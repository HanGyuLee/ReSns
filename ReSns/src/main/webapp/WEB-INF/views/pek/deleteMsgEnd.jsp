<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	<c:if test="${n == 1 && empty gobackURL}">
		alert("쪽지 지우기 성공!");
		location.href="<%= request.getContextPath() %>/message.re"; 
	</c:if>
	
	<c:if test="${n == 1 && not empty gobackURL}">
		alert("쪽지 지우기 성공!");
		location.href="${gobackURL}"; 
	</c:if>

	<c:if test="${n == 0}">
		alert("쪽지 지우기에 실패하였습니다.");
		javascript:history.back();
	</c:if>
	
</script>