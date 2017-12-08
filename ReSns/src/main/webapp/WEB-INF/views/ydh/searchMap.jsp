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
검색어결과뷰단Map
</head>


<c:forEach var="map" items="${searchMap}" >
<div align="center">
<img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"><br/><br/>
게시물번호 : ${map.SEQ_TBL_BOARD}<br/>
지역이름 : ${map.MAP_NAME}<br/>
위도 : ${map.MAP_WE}<br/>
경도 : ${map.MAP_KY}<br/>
</div>
</c:forEach> 

<form name="moreResults">
	<div align="center">
		<button type="button" >더보기</button>
	</div>
</form>
      
</body>
</html>