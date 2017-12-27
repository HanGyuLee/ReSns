package com.spring.pmh.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.common.FileManager;
import com.spring.common.MyUtil;
import com.spring.common.PmhPaging;
import com.spring.common.ThumbnailManager;
import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pmh.model.AimageVO;
import com.spring.pmh.model.AskVO;
import com.spring.pmh.model.FaqVO;
import com.spring.pmh.service.InterPmhService;

@Controller
@Component
public class PmhController {

	@Autowired
	private InterPmhService service;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private ThumbnailManager thumbnailManager;
	
////////////////////////////// 신고게시판 컨트롤러 시작 ////////////////////////////////////
	@RequestMapping(value="/report.re", method={RequestMethod.GET})
	public String reportMain(HttpServletRequest req) {
		
		List<HashMap<String, String>> rvoList = null;
		
		String searchType = req.getParameter("searchType");
		String searchInput = req.getParameter("searchInput");
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
			
		PmhPaging ppgg = new PmhPaging(); 
		
		HashMap<String, String> step1map = ppgg.makePageBarStep1(str_currentShowPageNo);
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchInput", searchInput);
		searchMap.put("startRno", step1map.get("startRno"));
		searchMap.put("endRno", step1map.get("endRno"));
			
				
		// 게시물 리스트 받아오기
		if (searchInput != null && !searchInput.trim().isEmpty()) {
			rvoList = service.getReportPgSearch(searchMap);
		}
		else {
			 rvoList = service.getReportPg(searchMap);
		}
		
		
		// 총게시물 건수를 구한다.
		int totalCount = 0;
		if (searchInput != null && !searchInput.trim().isEmpty()) { // 검색어가 있는 경우
			    totalCount = service.getReportTotalCount2(searchMap);
			}
			
		else { // 검색어가 없는 경우
			    totalCount = service.getReportTotalCount1();
		} 
		
		String destination = "report.re";
		String step2bar = ppgg.makePageBarStep2(step1map, totalCount, searchType, searchInput, destination);
		
		req.setAttribute("pagebar", step2bar);
		
		req.setAttribute("rvoList", rvoList); 
		req.setAttribute("searchType", searchType);
		req.setAttribute("searchInput", searchInput);
				
		return "pmh/reportMain.tiles";
	}
	
	@RequestMapping(value="/reportDetail.re", method={RequestMethod.GET})
	public String reportDetail(HttpServletRequest req) {
		
		String seq = req.getParameter("seq");
		
		HashMap<String, String> reportMap = service.getReportDetail(seq);
		
		req.setAttribute("reportMap", reportMap);
				
		return "pmh/reportDetail.tiles";
	}
	
	@RequestMapping(value="/getBoardContent.re")
	public String getBoardContent(HttpServletRequest req) {
		
		String reportnum = req.getParameter("reportnum");
		
		BoardVO bvo = service.getBoardContent(reportnum);
		
		List<ReVO> rvoList = service.getReContent(reportnum);
		
		BimageVO bivo = service.getBimageContent(reportnum);
		
		req.setAttribute("bvo", bvo);
		req.setAttribute("rvoList", rvoList);
		req.setAttribute("bivo", bivo);
		
		return "boardContent.notiles2";
	}
	
	@RequestMapping(value="/delBoardContents.re")
	public String delBoardContents(HttpServletRequest req) {
		
		String seq = req.getParameter("seq");
		
		int n = 0;
		try {
			n = service.delBoardContents(seq);
			
			if (n < 1) {
				req.setAttribute("msg", "게시물 비활성화 실패");
				req.setAttribute("loc", "/resns/report.re");
			}
			else {
				req.setAttribute("msg", "게시물 비활성화 성공");
				req.setAttribute("loc", "/resns/report.re");
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return "msg.notiles2";
	}
	
	@RequestMapping(value="/actBoardContents.re")
	public String actBoardContents(HttpServletRequest req) {
		
		String seq = req.getParameter("seq");
		
		int n = 0;
		try {
			n = service.actBoardContents(seq);
						
			if (n < 1) {
				req.setAttribute("msg", "게시물 활성화 실패");
				req.setAttribute("loc", "/resns/report.re");
			}
			else {
				req.setAttribute("msg", "게시물 활성화 성공");
				req.setAttribute("loc", "/resns/report.re");
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return "msg.notiles2";
	}
	
	@RequestMapping(value="/reportingBoard.re", method={RequestMethod.GET})
	public String requireLogin2_reportingBoard(HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
		
		String fk_login_id = req.getParameter("fk_login_id");
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			req.setAttribute("msg", "회원전용 메뉴입니다. 로그인을 해 주세요.");
			req.setAttribute("loc", "/resns/login.re");
			
			String url = MyUtil.getCurrentURL(req);
			ses.setAttribute("gobackURL", url);
			
			return "msg.notiles2";
		}
		
		HashMap<String, String> reportMap = new HashMap<String, String>();
		
		reportMap.put("fk_login_id", fk_login_id);
		reportMap.put("fk_seq_tbl_board", seq_tbl_board);
		reportMap.put("report_user", loginUser.getLogin_id());
		
		int n1 = service.checkPreReporting(reportMap);
		
		if (n1 > 0) {
			String msg = "이미 신고한 글입니다.";
			String loc = "/resns/selfClose.re";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles2";
		}
						
		req.setAttribute("fk_login_id", fk_login_id);
		req.setAttribute("seq_tbl_board", seq_tbl_board);
		req.setAttribute("loginUser", loginUser);
				
		return "reportingBoard.notiles2";
	}
	
	@RequestMapping(value="/reportingBoardHandler.re", method={RequestMethod.POST})
	public String reportingBoardHandler(HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
		
		String fk_login_id = req.getParameter("fk_login_id"); // pek94
		String fk_seq_tbl_board = req.getParameter("fk_seq_tbl_board"); // 31
		String report_user = req.getParameter("report_user"); // admin89
		String report_content = req.getParameter("report_content"); // 신고합니다
		String report_cate = req.getParameter("report_cate"); // 1
	
		HashMap<String, String> reportMap = new HashMap<String, String>();
		
		reportMap.put("fk_login_id", fk_login_id);
		reportMap.put("fk_seq_tbl_board", fk_seq_tbl_board);
		reportMap.put("report_user", report_user);
		reportMap.put("report_content", report_content);
		reportMap.put("report_cate", report_cate);
		
		int n1 = service.insertReporting(reportMap);
		
		if (n1 > 0) {
			try {
				res.sendRedirect("reportBoardEnd.re");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			String msg = "신고에 실패하였습니다.";
			String loc = "/resns/index.re"; 
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
		}
		return "msg.notiles2";
		
	}
	
	@RequestMapping(value="/reportBoardEnd.re")
	public String reportBoardEnd() {
		
		return "reportingBoardEnd.notiles2";
	}
/////////////////////////////////////////// 신고게시판 컨트롤러 끝 //////////////////////////////////////////////////
	
/////////////////////////////////////////// 문의게시판 컨트롤러 시작 /////////////////////////////////////////////////
	@RequestMapping(value="/help.re", method={RequestMethod.GET})
	public String helpMain(HttpServletRequest req, HttpSession ses) {
		
		List<HashMap<String, String>> helpList = null;
		
		String searchType = req.getParameter("searchType");
		String searchInput = req.getParameter("searchInput");
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
				
		PmhPaging ppgg = new PmhPaging(); 
		
		HashMap<String, String> step1map = ppgg.makePageBarStep1(str_currentShowPageNo);
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchInput", searchInput);
		searchMap.put("startRno", step1map.get("startRno"));
		searchMap.put("endRno", step1map.get("endRno"));
			
				
		// 게시물 리스트 받아오기
		if (searchInput != null && !searchInput.trim().isEmpty()) {
			helpList = service.getHelpPgSearch(searchMap);
		}
		else {
			helpList = service.getHelpPg(searchMap);
		}
		
		
		// 총게시물 건수를 구한다.
		int totalCount = 0;
		int totalCountDelete = 0;
		if (searchInput != null && !searchInput.trim().isEmpty()) { // 검색어가 있는 경우
			    totalCount = service.getHelpTotalCount2(searchMap);
			    totalCountDelete = service.getHelpTotalCountDelete2(searchMap);
			}
			
		else { // 검색어가 없는 경우
			    totalCount = service.getHelpTotalCount1();
			    totalCountDelete = service.getHelpTotalCountDelete1();
		} 
		
		String destination = "help.re";
		String step2bar = ppgg.makePageBarStep2(step1map, totalCount, searchType, searchInput, destination);
		
		int totalPage = (int)Math.ceil( (double)totalCount/Integer.parseInt(step1map.get("sizePerPage")));
		int totalCountExceptDelete = totalCount - totalCountDelete;
		
		req.setAttribute("pagebar", step2bar);
		
		req.setAttribute("helpList", helpList); 
		req.setAttribute("searchType", searchType);
		req.setAttribute("searchInput", searchInput);
		
		req.setAttribute("currentShowPageNo", step1map.get("currentShowPageNo"));
		req.setAttribute("pageNo", step1map.get("pageNo"));
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCountExceptDelete", totalCountExceptDelete);
		
		String url = MyUtil.getCurrentURL(req);
		ses.setAttribute("gobackURL", url);
				
		return "pmh/helpMain.tiles";
	}
	
	@RequestMapping(value="/helpWrite.re")
	String helpWrite(HttpServletRequest req, HttpSession ses) {
				
		LoginVO loginUser = (LoginVO)ses.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			req.setAttribute("msg", "회원전용 메뉴입니다. 로그인을 해 주세요.");
			req.setAttribute("loc", "/resns/login.re");
			
			String url = "/resns/helpWrite.re";
			ses.setAttribute("gobackURL", url);
			
			return "msg.notiles2";
		}
		else {
			int seq = service.getAskSeq();
			
			String fk_seq = req.getParameter("fk_seq");
			String groupno = req.getParameter("groupno");
			String depthno = req.getParameter("depthno");

			req.setAttribute("seq", seq);
			
			req.setAttribute("fk_seq", fk_seq);
			req.setAttribute("groupno", groupno);
			req.setAttribute("depthno", depthno);
			
			req.setAttribute("loginUser", loginUser);
			return "pmh/helpWrite.tiles3";
		}
		
	}
	
	@RequestMapping(value="/helpWriteEnd.re", method={RequestMethod.POST})
	String helpWriteEnd(HttpServletRequest req, HttpSession ses, @RequestParam("file")MultipartFile file) {
		
		HashMap<String, Object> helpMap = new HashMap<String, Object>();
		
		String ask_cate = req.getParameter("ask_cate"); // 1
		String fk_login_id = req.getParameter("fk_login_id"); // 이명박
		String ask_title = req.getParameter("ask_title"); // 다스는 내거다
		String ask_content = req.getParameter("ask_content"); // 다스다스
		String ask_secret = req.getParameter("ask_secret"); // 2
		String fk_seq = req.getParameter("fk_seq");
		String groupno = req.getParameter("groupno");
		String depthno = req.getParameter("depthno");
		String seq = req.getParameter("seq");
				
		helpMap.put("ask_cate", Integer.parseInt(ask_cate));
		helpMap.put("fk_login_id", fk_login_id);
		helpMap.put("ask_title", ask_title);
		helpMap.put("ask_content", ask_content);
		helpMap.put("ask_secret", ask_secret);
		helpMap.put("fk_seq", fk_seq);
		helpMap.put("groupno", groupno);
		helpMap.put("depthno", depthno);
		
		if (!file.isEmpty()) {
			String root = ses.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String originalFilename = file.getOriginalFilename();
			
			String newFileName = "";
			
			String thumbnailFileName = "";
			
			byte[] bytes = null;
			
			long fileSize = 0;
			
			try {
				bytes = file.getBytes();
				
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
				
				fileSize = file.getSize();
				
				thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path);
				
				int seqplus = Integer.parseInt(seq) + 1;
				helpMap.put("seq", seqplus);
				helpMap.put("newFileName", newFileName);
				helpMap.put("originalFilename", originalFilename);
				helpMap.put("fileSize", fileSize);
				helpMap.put("thumbnailFileName", thumbnailFileName);
								
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int n = 0; 
		
		n = service.askWrite(helpMap);
			
		req.setAttribute("n", n);
		
		return "askEnd.notiles2";
	}
	
	@RequestMapping(value="/helpDetail.re", method={RequestMethod.GET})
	public String helpDetail(HttpServletRequest req, HttpSession ses) {
		
		String seq = req.getParameter("seq");
		
		AskVO avo = service.getAskDetail(seq);
		String login_name = service.getLoginNameById(avo.getFk_login_id());
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		String login_id = "";
		if (loginUser != null) {
			login_id = loginUser.getLogin_id();
		
			if (avo.getAsk_secret().equals("0")) {
				if (!login_id.equals(login_name) && loginUser.getLogin_status() != 9) {
					req.setAttribute("msg", "비밀글은 작성한 회원 혹은 관리자만 열람이 가능합니다.");
					req.setAttribute("loc", "/resns/help.re");
					
					String url = MyUtil.getCurrentURL(req);
					ses.setAttribute("gobackURL", url);
									
					return "msg.notiles2";
				}
			}
		}
		else {
			if (avo.getAsk_secret().equals("0")) { 
				req.setAttribute("msg", "비밀글은 작성한 회원 혹은 관리자만 열람이 가능합니다.");
				req.setAttribute("loc", "/resns/help.re");
								
				String url = MyUtil.getCurrentURL(req);
				ses.setAttribute("gobackURL", url);
				
				return "msg.notiles2";
			}
		}
		AimageVO aivo = service.getAskAimage(seq);
		
		String content = avo.getAsk_content(); 
		content = content.replaceAll("\r\n", "<br/>");
		avo.setAsk_content(content);
		
		switch (avo.getAsk_cate()) {
		case "1":
			avo.setAsk_cate("회원정보");
			break;
		case "2":
			avo.setAsk_cate("이용관련");
			break;
		case "3":
			avo.setAsk_cate("버그문의");
			break;
		default:
			avo.setAsk_cate("기타");
			break;
		}
		
		
		req.setAttribute("avo", avo);
		req.setAttribute("login_name", login_name);
		if (aivo != null)
			req.setAttribute("aivo", aivo);
		
		req.setAttribute("loginUser", loginUser);
		
		ses.setAttribute("gobackURL", "helpDetail.re?seq=" + seq);
		
		return "pmh/helpDetail.tiles3";
	}
	
	@RequestMapping(value="/helpDelete.re")
	public String helpDelete(HttpServletRequest req, HttpSession ses) {
		
		String seq = req.getParameter("seq");
		String login_id = req.getParameter("loginid");
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		String sessionid = "";
				
		if (loginUser != null) {
			if (!login_id.equals(sessionid) && loginUser.getLogin_status() != 9) {
				req.setAttribute("msg", "작성글은 작성한 회원만 삭제 가능합니다.");
				req.setAttribute("loc", "/resns/helpDetail.re?seq=" + seq);
												
				return "msg.notiles2";
			}
		}
		else {
			req.setAttribute("msg", "작성글은 작성한 회원만 삭제 가능합니다.");
			req.setAttribute("loc", "/resns/helpDetail.re?seq=" + seq);
									
			return "msg.notiles2";
		}
		
		
		int n = service.updateHelpDelete(seq);
		
		if (n > 0) {
			req.setAttribute("msg", "게시물 삭제 성공");
			req.setAttribute("loc", "/resns/help.re");
		}
		else {
			req.setAttribute("msg", "게시물 삭제 실패");
			req.setAttribute("loc", "/resns/help.re");
		}
			
		return "msg.notiles2";
	}
	
	@RequestMapping(value="helpModify.re")
	public String helpModify(HttpServletRequest req, HttpSession ses) {
		
		String seq = req.getParameter("seq");
		String login_id = req.getParameter("loginid");
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		AskVO avo = service.getAskDetail(seq);
		String login_name = service.getLoginNameById(avo.getFk_login_id());
		
		String sessionid = "";
				
		if (loginUser != null) {
			if (!login_id.equals(sessionid) && loginUser.getLogin_status() != 9) {
				req.setAttribute("msg", "작성글은 작성한 회원만 수정 가능합니다.");
				req.setAttribute("loc", "/resns/helpDetail.re?seq=" + seq);
												
				return "msg.notiles2";
			}
		}
		else {
			req.setAttribute("msg", "작성글은 작성한 회원만 수정 가능합니다.");
			req.setAttribute("loc", "/resns/helpDetail.re?seq=" + seq);
									
			return "msg.notiles2";
		}
		
		AimageVO aivo = service.getAskAimage(seq);
		
		req.setAttribute("avo", avo);
		req.setAttribute("login_name", login_name);
		if (aivo != null)
			req.setAttribute("aivo", aivo);
		
		ses.setAttribute("gobackURL", "helpDetail.re?seq=" + seq);
		
		return "pmh/helpModify.tiles3";
	}
	
	@RequestMapping(value="/helpModifyEnd.re", method={RequestMethod.POST})
	public String helpModifyEnd(HttpServletRequest req, HttpSession ses, @RequestParam("file")MultipartFile file) {
		
		HashMap<String, Object> helpMap = new HashMap<String, Object>();
		
		String ask_cate = req.getParameter("ask_cate"); // 1
		String fk_login_id = req.getParameter("fk_login_id"); // 이명박
		String ask_title = req.getParameter("ask_title"); // 다스는 내거다
		String ask_content = req.getParameter("ask_content"); // 다스다스
		String ask_secret = req.getParameter("ask_secret"); // 2
		String fk_seq = req.getParameter("fk_seq");
		String groupno = req.getParameter("groupno");
		String depthno = req.getParameter("depthno");
		String seq = req.getParameter("seq");
		String imgCheck = req.getParameter("aimg_delete");
		
		helpMap.put("ask_cate", Integer.parseInt(ask_cate));
		helpMap.put("fk_login_id", fk_login_id);
		helpMap.put("ask_title", ask_title);
		helpMap.put("ask_content", ask_content);
		helpMap.put("ask_secret", ask_secret);
		helpMap.put("fk_seq", fk_seq);
		helpMap.put("groupno", groupno);
		helpMap.put("depthno", depthno);
		helpMap.put("imgCheck", imgCheck);
		helpMap.put("seq", seq);
		helpMap.put("imgCheck", imgCheck);
		
		if (!file.isEmpty()) {
			String root = ses.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String originalFilename = file.getOriginalFilename();
			
			String newFileName = "";
			
			String thumbnailFileName = "";
			
			byte[] bytes = null;
			
			long fileSize = 0;
			
			try {
				bytes = file.getBytes();
				
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
				
				fileSize = file.getSize();
				
				thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path);
					
				helpMap.put("newFileName", newFileName);
				helpMap.put("originalFilename", originalFilename);
				helpMap.put("fileSize", fileSize);
				helpMap.put("thumbnailFileName", thumbnailFileName);
								
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int n = 0; 
		
		n = service.askModify(helpMap);
			
		req.setAttribute("n", n);
		
		return "askEnd.notiles2";
	}
	
/////////////////////////////////////////// 문의게시판 컨트롤러 끝 /////////////////////////////////////////////////	
	
/////////////////////////////////////////// 자주묻는질문 게시판 컨트롤러 시작 /////////////////////////////////////////////////
	@RequestMapping(value="faq.re", method={RequestMethod.GET})
	public String faqMain(HttpServletRequest req, HttpSession ses) {
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		if (loginUser != null)
			req.setAttribute("loginUser", loginUser);
		
		return "pmh/faqMain.tiles";
	}
	
	@RequestMapping(value="faqSearchInput.re", method={RequestMethod.GET})
	public String faqSearchInput(HttpServletRequest req) {
		
		List<FaqVO> faqList = null;
		
		String searchInput = req.getParameter("searchInput");
		String searchBtn = req.getParameter("searchBtn");
		
		if (searchInput != null) {
			faqList = service.getFaqListByInput(searchInput);
		}
		else if (searchBtn != null) {
			faqList = service.getFaqListByBtn(searchBtn);
		}
		
		req.setAttribute("faqList", faqList);
		
		return "faqContent.notiles2";
	}
	
	@RequestMapping(value="faqWrite.re", method={RequestMethod.GET})
	public String faqWrite() {
		
		return "pmh/faqWrite.tiles";
	}
	
	@RequestMapping(value="faqWriteEnd.re", method={RequestMethod.POST})
	public String faqWriteEnd(HttpServletRequest req) {
		
		String faq_category = req.getParameter("faq_category");
		String faq_title = req.getParameter("faq_title");
		String faq_content = req.getParameter("faq_content");
		String faq_answer = req.getParameter("faq_answer");
		
		HashMap<String, String> faqMap = new HashMap<String, String>();
		faqMap.put("faq_category", faq_category);
		faqMap.put("faq_title", faq_title);
		faqMap.put("faq_content", faq_content);
		faqMap.put("faq_answer", faq_answer);
		
		int n = service.insertFaq(faqMap);
		
		if (n > 0) {
			req.setAttribute("msg", "FAQ 작성 성공!");
			req.setAttribute("loc", "/resns/faq.re");
		}
		else {
			req.setAttribute("msg", "FAQ 작성 실패!");
			req.setAttribute("loc", "/resns/faq.re");
		}
		
		return "msg.notiles2";
	}
	
	@RequestMapping(value="faqModifyDelete.re", method={RequestMethod.GET})
	public String faqModifyDelete(HttpServletRequest req) {
		
		List<FaqVO> faqList = service.getFaqList();
		
		req.setAttribute("faqList", faqList);
		
		return "pmh/faqModifyDelete.tiles3";
	}
	
	@RequestMapping(value="faqDeleteEnd.re", method={RequestMethod.POST})
	public String faqDeleteEnd(HttpServletRequest req) {
		
		String[] faqchkArr = req.getParameterValues("faqchk");
		
		List<String> faqchkList = new ArrayList<String>();
		
		if (faqchkArr != null) {
			for (int i = 0; i < faqchkArr.length; i++) {
				faqchkList.add(faqchkArr[i]); 
			}
					
			int n = service.delSelectedFaq(faqchkList);
			
			req.setAttribute("msg", n + "개의 게시물이 삭제되었습니다.");
			req.setAttribute("loc", "/resns/faqModifyDelete.re");
		}
		else {
			req.setAttribute("msg", "게시물 삭제에 실패하였습니다.");
			req.setAttribute("loc", "/resns/faqModifyDelete.re");
		}
						
		return "msg.notiles2";
	}
	
	@RequestMapping(value="faqActivateEnd.re", method={RequestMethod.POST})
	public String faqActivateEnd(HttpServletRequest req) {
		
		String[] faqchkArr = req.getParameterValues("faqchk");
		
		List<String> faqchkList = new ArrayList<String>();
		
		if (faqchkArr != null) {
			for (int i = 0; i < faqchkArr.length; i++) {
				faqchkList.add(faqchkArr[i]); 
			}
					
			int n = service.actSelectedFaq(faqchkList);
			
			req.setAttribute("msg", n + "개의 게시물이 활성화되었습니다.");
			req.setAttribute("loc", "/resns/faqModifyDelete.re");
		}
		else {
			req.setAttribute("msg", "게시물 활성화에 실패하였습니다.");
			req.setAttribute("loc", "/resns/faqModifyDelete.re");
		}
						
		return "msg.notiles2";
	}
	
	@RequestMapping(value="faqModifyEnd.re", method={RequestMethod.POST})
	public String faqModifyEnd(HttpServletRequest req) {
		
		String seq_tbl_faq = req.getParameter("seq_tbl_faq"); // 2
		String faq_category = req.getParameter("faq_category"); // 1
		String faq_title = req.getParameter("faq_title"); // 회원가입 방법
		String faq_content = req.getParameter("faq_content"); // 회원가입은 어떻게 하나요?
		String faq_answer = req.getParameter("faq_answer"); // 회원가입 버튼을 누른 후 양식에 맞춰 정보를 입력하신 후 입력 버튼을 누르시면 됩니다.
		
		HashMap<String, String> faqMap = new HashMap<String, String>();
		faqMap.put("seq_tbl_faq", seq_tbl_faq);
		faqMap.put("faq_category", faq_category);
		faqMap.put("faq_title", faq_title);
		faqMap.put("faq_content", faq_content);
		faqMap.put("faq_answer", faq_answer);

		String result = service.updateFaqModify(faqMap);
		
		req.setAttribute("result", result);
		
		return "faqModifyJSON.notiles2";
	}
	
	/////////////////////////////////////////// 자주묻는질문 게시판 컨트롤러 끝 //////////////////////////////////////////
	
	/////////////////////////////////////////// 통계 페이지 컨트롤러 시작 ///////////////////////////////////////////////

	@RequestMapping(value="statistics.re", method={RequestMethod.GET})
	public String statisticsMain(HttpServletRequest req, HttpSession ses) {
		
		HashMap<String, Object> agelinePct = service.getAgelinePctAll();
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		req.setAttribute("agelinePct", agelinePct);
		req.setAttribute("loginUser", loginUser);
		
		
		return "pmh/statisticsMain.tiles";
	}
	
	@RequestMapping(value="getAgeDetail.re", method={RequestMethod.POST})
	public String getAgeDetail(HttpServletRequest req) {
		
		String ageline = req.getParameter("ageline");
		
		HashMap<String, Object> ageDetail = service.getAgeDetail(ageline);
		
		req.setAttribute("ageDetail", ageDetail);
		
		return "ageDetail.notiles2";
	}
	
	@RequestMapping(value="getGenderChartJson.re", method={RequestMethod.GET})
	public String getGenderChartJson(HttpServletRequest req) {
		
		String jsonData = service.getGenderInfo();
		req.setAttribute("jsonData", jsonData);
		return "jsonData.notiles2";
	}
	
	@RequestMapping(value="getBoardCountChartWeekJson.re", method={RequestMethod.GET})
	public String getBoardCountChartWeekJson(HttpServletRequest req) {
		
		String loginid = req.getParameter("loginid");
		String jsonData = service.getBoardCountChartWeekInfo(loginid);
		req.setAttribute("jsonData", jsonData);
		return "jsonDataWeek.notiles2";
	}
	
	@RequestMapping(value="getBoardCountChartPreWeekJson.re", method={RequestMethod.GET})
	public String getBoardCountChartPreWeekJson(HttpServletRequest req) {
		
		String loginid = req.getParameter("loginid");
		String jsonData = service.getBoardCountChartPreWeekInfo(loginid);
		req.setAttribute("jsonData", jsonData);
		return "jsonDataPreWeek.notiles2";
	}
	
	@RequestMapping(value="getTagChartJson.re", method={RequestMethod.GET})
	public String getTagChartJson(HttpServletRequest req) {
		
		String jsonData = service.getTagInfo();
		req.setAttribute("jsonData", jsonData);
		return "jsonDataTag.notiles2";
	}
	
	/////////////////////////////////////////// 통계 페이지 컨트롤러 끝 ///////////////////////////////////////////////
	
	/////////////////////////////////////////// 기타 컨트롤러 시작 ///////////////////////////////////////////////////
	@RequestMapping(value="reportingUser.re", method={RequestMethod.GET})
	public String reportingUserHandler(HttpServletRequest req, HttpSession ses) {
		
		LoginVO loginUser = (LoginVO) ses.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			req.setAttribute("msg", "회원전용 메뉴입니다. 로그인을 해 주세요.");
			req.setAttribute("loc", "/resns/login.re");
			
			String url = MyUtil.getCurrentURL(req);
			ses.setAttribute("gobackURL", url);
			
			return "msg.notiles2";
		}
		String re_id = req.getParameter("re_id");
		
		HashMap<String, String> reportMap = new HashMap<String, String>();
		
		reportMap.put("re_id", re_id);
		
		int n = service.reportingReply(reportMap);

		if (n>0) {
			String msg = "선택하신 리플을 신고하였습니다.";
			String loc = "/resns/index.re";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		}
		else {
			String msg = "리플 신고에 실패하였습니다.";
			String loc = "/resns/index.re";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		}
		
		return "msg.notiles2";
	}
	
	@RequestMapping(value="selfClose.re")
	public String selfClose() {
	
		return "selfClose.notiles2";
	}
	
	@RequestMapping(value="adminMain.re")
	public String adminMain() {
		
		return "pmh/adminMain.tiles";
	}
	
	/////////////////////////////////////////// 기타 컨트롤러 끝 ///////////////////////////////////////////////////
}
