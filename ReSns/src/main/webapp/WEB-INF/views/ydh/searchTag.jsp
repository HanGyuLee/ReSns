<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/webapp/resources/js/json2.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	
	////더보기[HTML로]
	

});//document



</script>
<head>
검색어결과뷰단Tag
</head>
<c:forEach var="map" items="${searchTag}" >

<div align="center">
<c:if test="${map.BIMG_FILENAME != null}">
	<img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"><br/><br/>
			           태그내용 :${map.TAG_CONTENT} 
				게시물번호 : ${map.SEQ_TBL_BOARD}     
			         게시물사진 : ${map.BIMG_FILENAME}
				게시물내용 :${map.BOARD_CONTENT}
				${searchTag}
</c:if>

<c:if test="${map.BIMG_FILENAME == null}" >
			          태그내용 :${map.TAG_CONTENT} 
				게시물번호 : ${map.SEQ_TBL_BOARD}     
			         게시물사진 : ${map.BIMG_FILENAME}
				게시물내용 :${map.BOARD_CONTENT}
</c:if>

</div>
</c:forEach>	


<form name="moreResults">
	<div align="center">
		<button type="button" >더보기</button>
	</div>
</form>
      
<body>
	