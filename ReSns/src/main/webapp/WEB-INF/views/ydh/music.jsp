<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style type="text/css">
	table, th, td {border: solid gray 1px;}
	/* #table {border-collapse: collapse; width: 750px;} */
	
	.subjectstyle {font-weight: bold;
    	           color: navy;
    	           cursor: pointer; }
	    
   /* === #142. 파일 첨부가 되었으므로 테이블의 가로폭 늘이기 ===  */
   #table { border-collapse: collapse; width:920px;}
   #table th, #table td {padding:5px;}
   #table th {background-color:#DDDDDD;}
   
</style>

 
<script type="text/javascript">
	$(document).ready(function(){
		
	
	});// end of $(document).ready()----------------------
	
	function goView(seq_tbl_music){
		
		var frm = document.seqFrm;
		frm.seq_tbl_music.value = seq_tbl_music;
		frm.method="get";
		frm.action="/resns/mview.re";
		frm.submit();
	
	}//goView
	
	
	
</script>

<div align="center" style="padding-left: 10%; border: solid 0px red;">
	<h1>YOUTUBE-LIST</h1><br/><br/>
		<!-- ==== 검색  ====-->
	<%-- <form name="searchFrm" action="<%=request.getContextPath() %>/music.re" method="get">
		<select name="colname" id="colname"> 
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
			<input type="text" name="search" id="search" size="40px"/>
			<button type="button" onClick="">검색</button>
		<br/><br/>
	 --%>
	<!-- ==== 테이블 보여주기 ==== -->
<table id="table">
	
	<thead>
		<div style="margin-left:750px; margin-bottom:5px;">
			<button onClick="javascript:location.href='/resns/mwrite.re'">글쓰기</button>&nbsp;
			<button>수정</button>
		</div>
	
		<tr align="center">
			<th style="width: 70px;">글번호</th>
			<th style="width: 360px;">제목</th>
			<th style="width: 70px;">날짜</th>
			<th style="width: 70px;">&nbsp;&nbsp;<input type="checkbox"/>&nbsp;&nbsp;<a href="javascript:goDel()">삭제</a></th>
		</tr>
	 </thead>	
 	
	<tbody>
	 <c:forEach var="m" items="${mlist}" varStatus="status"> 
			<tr >
			<td style="width: 70px;">${m.seq_tbl_music}</td>
			<td style="width: 360px;"><span style="cursor: pointer;" onClick="goView('${m.seq_tbl_music}');">${m.music_name}</span></td>
			<td style="width: 70px;">${m.music_date}</td>
			<td style="width: 70px;">&nbsp;&nbsp;<input type="checkbox"/></td>
			</tr>
    </c:forEach>
	</tbody>
</table> 
	<br/>
	
	<form name="seqFrm">
		<input type="hidden" name="seq_tbl_music" />
		<!-- <input type="hidden" name="gobackURL" /> -->
	</form>
	<br/>

	<!-- ===  페이지바 보여주기 -->
	<div align="center" style="width:70%; margin-left: 50px;" >
		<%-- ${pagebar} --%>
	</div>
	<br/>

			
			<!-- ===== Ajax로 검색어 입력시 자동글 완성하기 ===== -->
		<%-- <div id="displayList" style="width:312px; margin-left: 57px; border-top: 0px; border: solid gray 1px;">
		</div>
	
		<div style="margin-top: 20px;">
		<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/list.action'">글목록</button>&nbsp;
		<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/add.action'">글쓰기</button>
		</div> --%>
			
		
	</form>

</div>







