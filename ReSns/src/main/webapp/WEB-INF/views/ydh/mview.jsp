<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
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
  
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>글내용보기</h1>
	
	<table id="table">
		<tr>
			<th>글번호</th>
			<td>${mvo.seq_tbl_music}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${sessionScope.loginUser.login_name}</td>
		</tr>
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
    <br/><br/>
    <div style="margin-left: 200px;">
    <button type="button" onClick="javascript:location.href=">목록보기</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.re?seq=${mvo.seq_tbl_music}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/del.re?seq=${mvo.seq_tbl_music}'">삭제</button>
	<br/><br/>
	</div>
	<!-- 댓글쓰기 -->
	        성명 : <input type="text" name="name" value="${sessionScope.loginUser.login_name}" class="short" readonly />
		      <br/><br/>
		댓글 : <input type="text" name="content" class="long" placeholder="  바른말 고운말을 씁시다:)"/>&nbsp;&nbsp;<button>확인</button>
<%-- 	 
	<form	name="addCommentFrm" action="<%=request.getContextPath()%>/addComment.action" method="get">
			 <input type="hidden" name="userid" value="${sessionScope.logiUuser.userid}" />
		성명 : <input type="text" name="name" value="${sessionScope.loginUser.name}" class="short" readonly />
		      <br/><br/>
		댓글 : <input type="text" name="content" class="long" />
			 <!-- 게시물시퀏스에 달린 댓글 -->
			 <input type="hidden" name="parentSeq" value="${m.seq_tbl_music}" />
		  
			 <!-- 돌아갈 글 목록 페이지 -->
			 <input type="hidden" name="gobackURL" value="${gobackURL}"/>
		&nbsp;&nbsp;<button type="button" onClick="goWrite();">쓰기</button>
	</form>
	
	<!-- ==== #93. 댓글 내용 보여주기 ==== -->
	 <c:if test="${not empty commentList}">
		<table id="table2">
			<c:forEach var="commentvo" items="${commentList}">
				<tr>
					<td>${commentvo.name}</td>
					<td>${commentvo.content}</td>
					<td>${commentvo.regDate}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if> --%>

</div>	
	