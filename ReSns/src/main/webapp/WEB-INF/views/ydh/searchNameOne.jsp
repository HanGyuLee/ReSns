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


<div>
<c:forEach var="map" items="${searchNameOne}" >
이름 :${map.LOGIN_NAME}
<img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"><br/><br/>
<br/><br/>
<form name="moreResults">
	<div align="center">

</form>
<br/><br/>

<div>
<c:if test="${map.BIMG_FILENAME == null}">
	<div align="center">
      <span style=" font-weight:bold; font-size:20;">올린 게시물이 없습니다.</span>
      
    </div> 
</c:if>
</c:forEach>



      
</body>
</html>