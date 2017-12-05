package com.spring.pmh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pmh.service.InterPmhService;

@Controller
@Component
public class PmhController {

	@Autowired
	private InterPmhService service;
	
	@RequestMapping(value="/report.re", method={RequestMethod.GET})
	public String reportMain(HttpServletRequest req) {
		
		List<HashMap<String, String>> rvoList = null;
		
		String searchType = req.getParameter("searchType");
		String searchInput = req.getParameter("searchInput");
				
		if (searchInput != null && !searchInput.trim().isEmpty()) {
			HashMap<String, String> searchMap = new HashMap<String, String>();
			searchMap.put("searchType", searchType);
			searchMap.put("searchInput", searchInput);
			
			rvoList = service.getReport(searchMap);
		}
		else {
			 rvoList = service.getReport();
		}
		
		
		
		req.setAttribute("rvoList", rvoList);
		
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
	
	
	
}
