package com.spring.common;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.pmh.service.InterPmhService;

public class PmhPaging {
	
	/*public String makePageBar(String str_currentShowPageNo, String colname, String search, InterPmhService service, HttpServletRequest req,
			String destination) {
		
		List<?> boardList = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("colname", colname);
		map.put("search", search);
		
		int totalCount = 0;        // 총게시물 건수
		int sizePerPage = 5;       // 한 페이지당 보여줄 게시물수
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치는 1페이지로 한다.
		int totalPage = 0;         // 총 페이지수(웹브라우저상에 보여줄 총 페이지수)
		
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
		
		// *** 가져올 게시글의 범위를 구한다.(공식임!!) ***
		
		  
		   currentShowPageNo    startRno     endRno
		   ----------------------------------------
		         1 page            1            5
		         2 page            6            10
		         3 page            11           15
		         4 page            16           20
		         5 page            21           25
		         6 page            26           30
		         7 page            31           35
		      
		 
		
		startRno = ((currentShowPageNo - 1)*sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		// ==== #109. 페이징처리를 위해서 startRno, endRno 를 map 에 추가하여
		//            파라미터로 넘겨서 select 되도록 한다.
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		
		if ( (colname != null && search != null) &&
			 (!colname.trim().isEmpty() && !search.trim().isEmpty()) && 
			 (!colname.equals("null") && !search.equals("null"))
			) { // 검색어가 있는 경우
				boardList = service.boardList2(map);	 
			}
			
		else { // 검색어가 없는 경우
			boardList = service.boardList1(map);	
		}  
		
		
		// ==== #111. 페이지바 만들기(먼저 페이지바에 나타낼 총페이지 갯수 구하기) ====
		
		    검색조건이 없을때의 총페이지수와
		    검색조건이 있을때의 총페이지수를 구해야 한다.
		     
		    검색조건이 없을때의 총페이지수 --> search 의 값이 없는 경우이다.
		    검색조건이 있을때의 총페이지수 --> search 의 값이 있는 경우이다. 
		 
		
		// 총게시물 건수를 구한다.
		if ( (colname != null && search != null) &&
			 (!colname.trim().isEmpty() && !search.trim().isEmpty()) && 
			 (!colname.equals("null") && !search.equals("null"))
			) { // 검색어가 있는 경우
			    totalCount = service.getTotalCount2(map);
			}
			
		else { // 검색어가 없는 경우
			    totalCount = service.getTotalCount1();
		} 
		
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
		
		String pagebar = "<ul>";
		
		pagebar += MyUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, colname, search, null, "list.action");    
		
		pagebar += "</ul>";
		
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("boardList", boardList); 
		req.setAttribute("colname", colname);
		req.setAttribute("search", search);
		
		return destination;
	}*/
}
