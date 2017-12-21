 
<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>



<title>첵박스삭제</title>

<script type="text/javascript">
<c:if test="${n > 0}">
	alert("글삭제 성공:D");
	location.href="<%= request.getContextPath() %>/music.re?fk_login_id=${fk_login_id}";       
</c:if>

<c:if test="${n < 1}">
	alert("글삭제 실패");
	history.back();
</c:if>


</script>
