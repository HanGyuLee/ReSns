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
	

});//document



</script>
<head>
이름한명클릭했때검색어결과뷰단
</head>

<body>


<div align="center">
<span style=" font-size:20pt; font-weight:bold;">(myPage연결하면됨)게시물</span><br/>
</div>
<c:forEach var="map" items="${searchNameOne}" >
이름 :${map.LOGIN_NAME}
<c:if test="${map.BIMG_FILENAME != null}">
<img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"><br/><br/>
<br/><br/>
<form name="moreResults">
	<div align="center">
		<button type="button" >더보기</button>
	</div>
</form>
<br/><br/>
</c:if>

<c:if test="${map.BIMG_FILENAME == null}">
	<div align="center">
      <span style=" font-weight:bold; font-size:20;">올린 게시물이 없습니다.</span>
      
    </div> 
</c:if>
</c:forEach>



      
</body>
</html>