package com.spring.pmh.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
				
		return "pmh/reportMain.tiles2";
	}
	
	@RequestMapping(value="/reportDetail.re", method={RequestMethod.GET})
	public String reportDetail(HttpServletRequest req) {
		
		String seq = req.getParameter("seq");
		
		HashMap<String, String> reportMap = service.getReportDetail(seq);
		
		req.setAttribute("reportMap", reportMap);
				
		return "pmh/reportDetail.tiles2";
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
		if (searchInput != null && !searchInput.trim().isEmpty()) { // 검색어가 있는 경우
			    totalCount = service.getHelpTotalCount2(searchMap);
			}
			
		else { // 검색어가 없는 경우
			    totalCount = service.getHelpTotalCount1();
		} 
		
		String destination = "help.re";
		String step2bar = ppgg.makePageBarStep2(step1map, totalCount, searchType, searchInput, destination);
		
		req.setAttribute("pagebar", step2bar);
		
		req.setAttribute("helpList", helpList); 
		req.setAttribute("searchType", searchType);
		req.setAttribute("searchInput", searchInput);
		
		req.setAttribute("currentShowPageNo", step1map.get("currentShowPageNo"));
		req.setAttribute("pageNo", step1map.get("pageNo"));
		req.setAttribute("totalCount", totalCount);
		
		String url = MyUtil.getCurrentURL(req);
		ses.setAttribute("gobackURL", url);
				
		return "pmh/helpMain.tiles2";
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
			return "pmh/helpWrite.tiles2";
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
		
		ses.setAttribute("gobackURL", "helpDetail.re?seq=" + seq);
		
		return "pmh/helpDetail.tiles2";
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
		
		return "pmh/helpModify.tiles2";
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
	public String faqMain(HttpServletRequest req) {
		
		
		return "pmh/faqMain.tiles2";
	}
	
/////////////////////////////////////////// 자주묻는질문 게시판 컨트롤러 끝 /////////////////////////////////////////////////
	
}
