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
	
	
	$("#msg_content").on('keyup', function() {
        if($(this).val().length > 500) {

            $(this).val($(this).val().substring(0, 500));
            alert("공백 포함 500자 까지만 보낼 수 있습니다.");

        }
    });
	
	
	$("#sendMsg").click(function(){
		
		var msg_content = $("#msg_content").val();
		
		if (msg_content == "") {
			
			alert("글 내용을 입력하셔야 합니다.");
			$("#msg_content").focus();
			
		}
		else {
			
			var frm = document.msgFrm;
			
			frm.method = "POST";
			frm.action = "/resns/writeMsgEnd.re";
			frm.submit();
			
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
  	<div class="description" style="margin-left: 10pt;">
		<form class="form-horizontal" name="msgFrm">
		<fieldset>
		
		<!-- Form Name -->
		<legend>쪽지작성</legend>
		
		<!-- Select Basic -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="fk_login_id">보낼 사람</label>
		  <div class="col-md-1">
		    <select id="fk_login_id" name="fk_login_id" class="form-control">
		    	<c:if test="${login_name == ''}">
			    	<c:forEach items="${followList}" var="follow">
			    	<option value="${follow.follow_id}">${follow.follow_name}</option>
			    	</c:forEach>
		    	</c:if>
		    	<c:if test="${login_name != ''}">
		    		<option value="${msg_send}">${login_name}</option>
		    	</c:if>
		    </select>
		  </div>
		</div>
		
		<!-- Textarea -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="msg_content"></label>
		  <div class="col-md-4">                     
		    <textarea class="form-control" id="msg_content" name="msg_content" placeholder="500자까지 가능합니다." style="width: 300px; min-height: 300px; overflow: auto;"></textarea>
		  </div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="sendMsg"></label>
		  <div class="col-md-4">
		    <button id="sendMsg" name="sendMsg" class="btn btn-default">보내기</button>
		  </div>
		</div>
		
		</fieldset>
		</form>
  		
  	</div>
  </div>
</div>
</body>
</html>