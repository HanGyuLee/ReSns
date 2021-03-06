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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
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

	$(document).ready(function(){
		
		$("#deleteMsg").click(function(){
			
			var result = confirm("정말 삭제하시겠습니까?");
			
			if (result) {
				// 확인
				
				location.href="/resns/deleteMsg.re?seq_tbl_msg=${oneMsg.SEQ_TBL_MSG}";
				
			}
			
			
		});
		
	});

</script>

</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="/resns/writeMsg.re" id="about" >쪽지 쓰기</a>
  <a href="/resns/message.re" id="blog" >받은 쪽지</a>
  <a href="/resns/sendingMsg.re" id="projects" >보낸 쪽지</a>
</div>

<div class="container">
  <div class="card">

    <div class="loading-icon perpetuum-mobile" style="margin-left: 10px; padding: 10px;">
    <img src="<%=request.getContextPath()%>/resources/images/${oneMsg.UIMG_PROFILE_FILENAME}" style="width: 30px; height: 30px;" class="img-circle" /><br/>
    <span style="font-size: 9pt; font-weight: bold; margin-top: 9px; text-align: left;">${oneMsg.LOGIN_NAME}</span>
    </div>
    <div class="description">
    <div style="font-size: 9pt;">쪽지 보낸 날짜: ${oneMsg.MSG_DATE}</div>
    <span style="font-size: 9pt; margin-top: 9px; text-align: center;">쪽지 내용:</span><br/>
      <div class="name">${oneMsg.MSG_CONTENT}</div><br/><br/>
    </div>
  </div>
  <div class="card">
  <div class="loading-icon perpetuum-mobile" style="margin-left: 20px; padding: 10px;"></div>
  <c:if test="${oneMsg.MSG_SEND != sessionScope.loginUser.login_id}">
  	<div class="description" style="float: left;">
  		<a href="/resns/writeMsg.re?login_name=${oneMsg.LOGIN_NAME}&msg_send=${oneMsg.MSG_SEND}" class="btn btn-default">답장하기</a>
  	</div>
  </c:if>	
  	<div class="description" style="float: left;">
  	<a href="#" class="btn btn-default" id="deleteMsg">삭제하기</a>
  	</div>
  </div>
</div>
</body>
</html>