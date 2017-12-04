package com.spring.pmh.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pmh.service.InterPmhService;

@Controller
@Component
public class PmhController {

	@Autowired
	private InterPmhService service;
	
	@RequestMapping(value="/report.re", method={RequestMethod.GET})
	public String reportMain(HttpServletRequest req) {
		
		List<HashMap<String, String>> rvoList = service.getReport();
		
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
		
		req.getParameter("reportnum");
		
		
		return "boardContent.notiles2";
	}
	
	
}
