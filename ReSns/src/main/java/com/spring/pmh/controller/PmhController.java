package com.spring.pmh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.common.PmhPaging;
import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pmh.service.InterPmhService;

@Controller
@Component
public class PmhController {

	@Autowired
	private InterPmhService service;
	
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
	public String helpMain(HttpServletRequest req) {
		
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
			
			req.setAttribute("loginUser", loginUser);
			return "pmh/helpWrite.tiles2";
		}
		
	}
	
	@RequestMapping(value="/helpWriteEnd.re", method={RequestMethod.POST})
	String helpWriteEnd(HttpServletRequest req, HttpSession ses) {
		
		String ask_cate = req.getParameter("ask_cate"); // 1
		String fk_login_id = req.getParameter("fk_login_id"); // 이명박
		String ask_title = req.getParameter("ask_title"); // 다스는 내거다
		String ask_content = req.getParameter("ask_content"); // 다스다스
		String ask_status = req.getParameter("ask_status"); // 2
		
		
		
		return "pmh/helpMain.tiles2";
	}
	
/////////////////////////////////////////// 문의게시판 컨트롤러 끝 /////////////////////////////////////////////////	
	
/////////////////////////////////////////// 자주묻는질문 게시판 컨트롤러 시작 /////////////////////////////////////////////////
	@RequestMapping(value="faq.re", method={RequestMethod.GET})
	public String faqMain(HttpServletRequest req) {
		
		
		return "pmh/faqMain.tiles2";
	}
	
/////////////////////////////////////////// 자주묻는질문 게시판 컨트롤러 끝 /////////////////////////////////////////////////
	
}
