package com.spring.common;

import javax.servlet.http.HttpServletRequest;

public class JsrUtill {
	public static String getPageBarSearch(int totalcount,int sizep,int cShowp,int totalPage,int blockSize,String qsearch,String fk_login_id,String url) {
		String pageBar ="";
		
		int loop = 1;
		
		int pageNo = ((cShowp - 1)/blockSize)*blockSize + 1; 
		//현제 페이지
		// 공식임!!!
		
		// currentShowPageNo 가 1~10 일때 pageNo 는   1 
		// currentShowPageNo 가 11~20 일때 pageNo 는 11
		// currentShowPageNo 가 21~30 일때 pageNo 는 21

		
		//pageBar += "<div class='container'>";
		pageBar += "<div class='row'>";
		pageBar += "<nav aria-label='Page navigation'>";
		pageBar += "<ul class='pagination'>";
				
		String str_pageNo = "";
		
		if (pageNo == 1) {
			str_pageNo = "";
		}
		
		else {
			str_pageNo = "<li><a href=\""+url+"?fk_login_id="+fk_login_id+"&cShowp="+(pageNo-1)+"&sizep="+sizep+"&qsearch="+qsearch+"\" aria-label='Previous' >"+" <span aria-hidden='true'>«</span></a></li>";
			//str_pageNo = "&nbsp;<a href=\""+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"\" >"+"[이전"+blockSize+"페이지]</a>&nbsp;";
		}
		
		pageBar += str_pageNo;
		
		
		
		while(!(pageNo > totalPage || loop > blockSize)){
			
			if (pageNo == cShowp)
				str_pageNo = "<li><span style=\"color:red; font-size:12pt; font-weight:bold; text-decoration:underline;\">"+pageNo+ "</span>";
			else			
			    str_pageNo = "<li><a href=\""+url+"?fk_login_id="+fk_login_id+"&cShowp="+pageNo+"&sizep="+sizep+"&search="+qsearch+"\" >"+pageNo+"</a>";
			pageBar += str_pageNo; 
			
			pageNo++;
			loop++;
		}
		
		
		
		if (pageNo > totalPage) {
			str_pageNo = "";
		}
		else {
			str_pageNo = "<a href=\""+url+"?fk_login_id="+fk_login_id+"&cShowp="+pageNo+"&sizep="+sizep+"&qsearch="+qsearch+"\" ><span aria-hidden='true'>»</span></a></li>";
			//str_pageNo = "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"\" >"+"[다음"+blockSize+"페이지]</a>&nbsp;";
		}
		
		pageBar += str_pageNo;	
		
		pageBar += "</ul>";
		pageBar += "</nav>";
		pageBar += "<nav aria-label='Page navigation'>";
		pageBar += "</div>";	
		//pageBar += "</div>";
	
		
		
		
		
		return pageBar;
		}// end of String getPageBarSearch()--------------------	
	
	
	
	
	
	
	public static String getPageBarFallowMain(int totalcount,int sizep,int cShowp,int totalPage,int blockSize,String url) {
		String pageBar ="";
		
		int loop = 1;
		
		int pageNo = ((cShowp - 1)/blockSize)*blockSize + 1; 
		//현제 페이지
		// 공식임!!!
		
		// currentShowPageNo 가 1~10 일때 pageNo 는   1 
		// currentShowPageNo 가 11~20 일때 pageNo 는 11
		// currentShowPageNo 가 21~30 일때 pageNo 는 21

		
		//pageBar += "<div class='container'>";
		pageBar += "<div class='row'>";
		pageBar += "<nav aria-label='Page navigation'>";
		pageBar += "<ul class='pagination'>";
				
		String str_pageNo = "";
		
		if (pageNo == 1) {
			str_pageNo = "";
		}
		
		else {
			str_pageNo = "<li><a href=\""+url+"?cShowp="+(pageNo-1)+"&sizep="+sizep+"\" aria-label='Previous' >"+" <span aria-hidden='true'>«</span></a></li>";
			//str_pageNo = "&nbsp;<a href=\""+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"\" >"+"[이전"+blockSize+"페이지]</a>&nbsp;";
		}
		
		pageBar += str_pageNo;
		
		
		
		while(!(pageNo > totalPage || loop > blockSize)){
			
			if (pageNo == cShowp)
				str_pageNo = "<li><span style=\"color:red; font-size:12pt; font-weight:bold; text-decoration:underline;\">"+pageNo+ "</span>";
			else			
			    str_pageNo = "<li><a href=\""+url+"?cShowp="+pageNo+"&sizep="+sizep+"\" >"+pageNo+"</a>";
			pageBar += str_pageNo; 
			
			pageNo++;
			loop++;
		}
		
		
		
		if (pageNo > totalPage) {
			str_pageNo = "";
		}
		else {
			str_pageNo = "<a href=\""+url+"?cShowp="+pageNo+"&sizep="+sizep+"\" ><span aria-hidden='true'>»</span></a></li>";
			//str_pageNo = "&nbsp;<a href=\""+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&colname="+colname+"&search="+search+"\" >"+"[다음"+blockSize+"페이지]</a>&nbsp;";
		}
		
		pageBar += str_pageNo;	
		
		pageBar += "</ul>";
		pageBar += "</nav>";
		pageBar += "<nav aria-label='Page navigation'>";
		pageBar += "</div>";	
		//pageBar += "</div>";
	
		
		
		
		
		return pageBar;
		}// end of String getPageBarSearch()--------------------	
	
	
		
		
}
