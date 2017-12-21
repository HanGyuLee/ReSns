  
<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>


	<script type="text/javascript">
		alert("${msg}");
		location.href="<%= request.getContextPath() %>/mview.re?fk_login_id=${fk_login_id}&seq_tbl_music=${seq_tbl_music}"; 
		// 댓글쓰기를 한 원글 페이지로 이동
	</script>
