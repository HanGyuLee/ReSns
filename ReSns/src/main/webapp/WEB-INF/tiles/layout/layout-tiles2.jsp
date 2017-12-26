<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Remeber Emember::</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
      
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
 
 <style type="text/css" >
 	#myheader		{ height:120px; margin-top: -30px; background-image: url("<%= request.getContextPath() %>/resources/images/headerback.png"); }
 	#mycontainer	{ margin:0 auto; }
 	#mynoticeinf    { position: relative;}
	#mycontent		{ position:relative; width:100%; background-color:#F5F5F5; min-height:800px;}
 
 </style>    

</head>

<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="mynoticeinf">
		<tiles:insertAttribute name="noticeinfo" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
	
	</div>
</body>
</html>