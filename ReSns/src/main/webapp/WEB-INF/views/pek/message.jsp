<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>Message</title>
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
  margin: 32px 0;
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



</style>

</head>
<body>
	<div class="container">
	
<c:forEach items="${msgList}" var="msg" varStatus="status">
  <div class="card">
    <div class="icon-container">
      <div class="loading-icon perpetuum-mobile"><img src="<%=request.getContextPath()%>/resources/images/${msg.UIMG_PROFILE_FILENAME}" style="width: 30px; height: 30px;" /></div>
    </div>
    <div class="description">
    <span class="name" style="font-size: 8pt; font-weight: bold;">${msg.LOGIN_NAME}</span>
      <div class="name">${msg.MSG_CONTENT}</div>
      <code>${msg.MSG_DATE}</code>
    </div>
  </div>
</c:forEach>  
  
</div>
</body>
</html>