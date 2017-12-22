<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tiles 를 사용한 메인(시작) 페이지 작성하기</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
      
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
  
 
 <style type="text/css" >
 	#myheader		{ height:120px; background-image: url("<%= request.getContextPath() %>/resources/images/headerback.png"); }
 	#myheader2		{ height:120px; background-image: url("<%= request.getContextPath() %>/resources/images/birthh.png"); }
 	#mycontainer	{ margin:0 auto; }
	#mycontent		{ float:left; width:75%; min-height:800px; padding-top: 40px;}
	#mysideinfo		{ float:left; width:25%; }
 
 </style>    

</head>

<body>
	<div id="mycontainer">
	<c:if test="${sessionScope.loginUser == null}">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
	</c:if>
	<c:if test="${sessionScope.loginUser != null}">
		<c:if test="${sessionScope.birth == 0}">
			<div id="myheader">
				<tiles:insertAttribute name="header" />
			</div>
		</c:if>
		<c:if test="${sessionScope.birth == 1}">
			<div id="myheader2">
				<tiles:insertAttribute name="header" />
			</div>
		</c:if>
	</c:if>
		<div id="mynoticeinf">
		<tiles:insertAttribute name="noticeinfo" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
		
		<div id="mysideinfo">
			<tiles:insertAttribute name="sideinfo" />
		</div>
	
	
	</div>
</body>
</html>