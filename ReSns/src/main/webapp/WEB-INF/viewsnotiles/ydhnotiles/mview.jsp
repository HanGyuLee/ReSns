<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>

   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 0px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 600px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 	
	
	a{text-decoration: none;}	
	

</style>

<script type="text/javascript">
  
 function goWrite(){
  
	 var ycontent = $("#re_ycontent").val();
	 if(ycontent==""){
		 alert("댓글을 써주세요.");
	 }
	 else{
		 
		 var addWriteFrm = document.addWriteFrm;
			addWriteFrm.action = "/resns/addComment.re";
			addWriteFrm.method = "get";
			addWriteFrm.submit();
	 }
}
   
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1></h1>
	<table id="table">
		<%-- <tr>
			<th>글번호</th>
			<td><input type="hidden" name="seq_tbl_music" value="${mvo.seq_tbl_music}"/>${mvo.seq_tbl_music}</td>
		</tr> --%>
		   <input type="hidden" name="seq_tbl_music" value="${mvo.seq_tbl_music}"/>
			<input type="hidden" name="fk_login_id" value="${mvo.fk_login_id}"/>
		
		<tr>
           	<th>제목</th>
           	<td>${mvo.music_name}</td>
        	</tr>
		<tr>
			<th>내용</th>
				<td>${mvo.music_content}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${mvo.music_date}</td>
		</tr>
		<tr>
			<th>youtube</th>
			<td>${mvo.music_link}</td>
		</tr>
	
		
		
	</table>
	<c:if test="${fk_login_id == sessionScope.loginUser.login_id}">
	    <br/><br/>
	    <div style="margin-left: 200px;">
	    <button type="button" class="btn btn-sm btn-primary btn-create" onClick="javascript:location.href='<%= request.getContextPath() %>/music.re?fk_login_id=${fk_login_id}'">되돌아가기</button>
		<button type="button" class="btn btn-sm btn-primary btn-create" onClick="javascript:location.href='<%= request.getContextPath() %>/medit.re?seq_tbl_music=${mvo.seq_tbl_music}&fk_login_id=${fk_login_id}'">수정</button>
		<button type="button" class="btn btn-sm btn-primary btn-create" onClick="javascript:location.href='<%= request.getContextPath() %>/mdel.re?seq_tbl_music=${mvo.seq_tbl_music}&fk_login_id=${fk_login_id}'">삭제</button>
		<br/><br/>
		</div>
	</c:if>
	
		<c:if test="${fk_login_id != sessionScope.loginUser.login_id}">
	    <br/><br/>
	    <div style="margin-left: 200px;">
	    <button type="button" class="btn btn-sm btn-primary btn-create" onClick="javascript:location.href='<%= request.getContextPath() %>/music.re?fk_login_id=${fk_login_id}'">되돌아가기</button>
		<br/><br/>
		</div>
	</c:if>
	
	
	<!-- === #83. 댓글 쓰기 폼 추가 === -->
	
	<form	name="addWriteFrm" action="<%=request.getContextPath()%>/addComment.re" method="get">
			 <input type="hidden" name="re_login_id" value="${sessionScope.loginUser.login_id}" />
		성명 : <input type="text" name="login_name" value="${sessionScope.loginUser.login_name}" class="short" readonly />
		      <br/>
		댓글 : <input type="text" placeholder="바른말 고운말을 씁시다:)" name="re_ycontent" id="re_ycontent" class="long" />
			 <!-- 댓글에 달리는 원게시물 글번호 (즉, 댓글의 부모글) -->
			 <input type="hidden" name="seq_tbl_music" value="${seq_tbl_music}" />
			 <input type="hidden" name="fk_login_id" value="${fk_login_id}" />
			
	
	
		  
			 <!-- 돌아갈 글 목록 페이지 -->
			 <%-- <input type="hidden" name="gobackURL" value="${gobackURL}"/> --%>
		&nbsp;&nbsp;<button type="button" class="btn btn-sm btn-primary btn-create" onClick="goWrite();">쓰기</button>
	</form>
	
	<!-- ==== #93. 댓글 내용 보여주기 ==== -->

	 <c:if test="${not empty commentList}">
		<table id="table2">
			<c:forEach var="cvo" items="${commentList}">
				<tr>
			      	<input type="hidden" name="seq_tbl_remusic" value="${cvo.SEQ_TBL_REMUSIC}"/>
				    <input type="hidden" name="re_login_id" value="${cvo.RE_LOGIN_ID}"/>
				    <input type="hidden" name="seq_tbl_music" value="${cvo.SEQ_TBL_MUSIC}"/>
				    <input type="hidden" name="fk_login_id" value="${fk_login_id}"/>
				    <td><span style="font-weight:bold;">└${cvo.LOGIN_NAME}</span>:&nbsp;&nbsp;<span style="font-weight:bold;">${cvo.RE_YCONTENT}</span>&nbsp;&nbsp;${cvo.RE_YDATE}</td>
					<c:if test="${sessionScope.loginUser.login_id == cvo.RE_LOGIN_ID}">
					  <td  onClick="javascript:location.href='<%= request.getContextPath() %>/remdel.re?seq_tbl_music=${seq_tbl_music}&re_login_id=${cvo.RE_LOGIN_ID}&seq_tbl_remusic=${cvo.SEQ_TBL_REMUSIC}&fk_login_id=${fk_login_id}'"><button class="btn btn-sm btn-primary btn-create">삭제</button></td>
					</c:if>
					<c:if test="${sessionScope.loginUser.login_id != cvo.RE_LOGIN_ID}">
					</c:if>
				</tr>
				
			</c:forEach>
		</table>
	</c:if> 

</div>	
	
		<form name="seqFrm">
		<input type="hidden" name="seq_tbl_music" />
		<input type="hidden" name="fk_login_id" />
		<input type="hidden" name="seq_tbl_remusic" />
		<input type="hidden" name="re_login_id" />
		<!-- <input type="hidden" name="gobackURL" /> -->
	</form>