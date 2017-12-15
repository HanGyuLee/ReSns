<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>Message</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
<style type="text/css">

body {
  margin: 0;
  background: #eee;
  
  font-family: "Roboto", sans-serif;
  color: #333;
}

.container {
  width: 700px;
  margin: 0 auto;
  
  padding: 0 32px;
  box-sizing: border-box;
}

.card {
  margin: 15px 0;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
  background: white;
  
  width: 100%;
  min-height: 80px;
  
  display: flex;
}

.card .icon-container {
  width: 80px;
  
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.card .description {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  
  flex-direction: column;
  flex-grow: 1;
  flex-basis: 0;
  
  padding: 8px 8px 8px 0;
}

.card .description .name {
  font-weight: bold;
  font-size: 1.3em;
}

.card .description .name span {
  font-size: .6em;
  font-weight: normal;
  font-style: italic;
  
  color: #bbb;
}

.img-circle {
  border-radius: 50%;
}






#mySidenav a {
    position: absolute;
    left: -80px;
    transition: 0.3s;
    padding: 15px;
    width: 100px;
    text-decoration: none;
    font-size: 15px;
    font-family: '나눔고딕';
    color: white;
    border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
    left: 0;
}

#about {
    top: 20px;
    background-color: #B9B3AC;
}

#blog {
    top: 80px;
    background-color: #2196F3;
}

#projects {
    top: 140px;
    background-color: #f44336;
}

</style>
<script type="text/javascript">

$(document).ready(function() {
	
	loop();
	
});

function loop() {
	
	setTimeout(function() {
					loop();	
				}, 1000);
	
}

function goDetail(seq_tbl_msg) {
	
	location.href="/resns/msgDetail.re?seq_tbl_msg="+seq_tbl_msg;
	
}

</script>

</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="/resns/writeMsg.re" id="about" >쪽지 쓰기</a>
  <a href="/resns/message.re" id="blog" >받은 쪽지</a>
  <a href="/resns/sendingMsg.re" id="projects" >보낸 쪽지</a>
</div>

	<div class="container">
	
<c:forEach items="${msgList}" var="msg" varStatus="status">
  <div class="card">
    <div class="icon-container">
      <div class="loading-icon perpetuum-mobile"><img src="<%=request.getContextPath()%>/resources/images/${msg.UIMG_PROFILE_FILENAME}" style="width: 30px; height: 30px;" class="img-circle" /></div>
    </div>
    <div class="description">
    	<span style="font-size: 8pt; font-weight: bold;">to ${msg.LOGIN_NAME}</span>
      <div class="name" style="cursor: pointer;" onclick="goDetail('${msg.SEQ_TBL_MSG}');">${msg.MSG_CONTENT}</div>
      <div style="font-size: 7pt;">${msg.MSG_DATE}</div>
    </div>
  </div>
</c:forEach>  
  
</div>
</body>
</html>