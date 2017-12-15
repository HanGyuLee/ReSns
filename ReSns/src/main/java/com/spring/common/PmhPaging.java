package com.spring.common;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.pmh.service.InterPmhService;

public class PmhPaging {
	
	public HashMap<String, String> makePageBarStep1(String str_currentShowPageNo) {
		
		HashMap<String, String> map = new HashMap<String, String>();
				
		int sizePerPage = 5;       // 한 페이지당 보여줄 게시물수
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치는 1페이지로 한다.
		
		int startRno = 0;          // 시작 행 번호
		int endRno = 0;            // 끝 행 번호
		
		int blockSize = 10;        // "페이지바"에 보여줄 페이지의 갯수
		
		if (str_currentShowPageNo == null) {
			// 게시판의 초기화면 이다.
			currentShowPageNo = 1;
		}
		else {
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
		}
				
		startRno = ((currentShowPageNo - 1)*sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
				
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		map.put("sizePerPage", String.valueOf(sizePerPage));
		map.put("currentShowPageNo", String.valueOf(currentShowPageNo));
		map.put("blockSize", String.valueOf(blockSize));
		
		return map;
		
	}
	
	public String makePageBarStep2(HashMap<String, String> step1map, int totalCount, String searchType, String searchInput, String destination) {
				
		int sizePerPage = Integer.parseInt(step1map.get("sizePerPage"));
		int blockSize = Integer.parseInt(step1map.get("blockSize"));
		int currentShowPageNo = Integer.parseInt(step1map.get("currentShowPageNo"));
				
		int totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
		
		String pagebar = "<ul>";
		
		pagebar += MyUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, searchType, searchInput, null, destination);    
		
		pagebar += "</ul>";
		
		return pagebar;
		
	}
}
