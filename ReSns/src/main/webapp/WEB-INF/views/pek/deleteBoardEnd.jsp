<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	<c:if test="${n == 1 && empty gobackURL}">
		alert("글삭제 성공!");
		location.href="<%= request.getContextPath() %>/index.re"; 
	</c:if>
	
	<c:if test="${n == 1 && not empty gobackURL}">
		alert("글 삭제 성공!");
		location.href="${gobackURL}"; 
	</c:if>

	<c:if test="${n == 0}">
		alert("글 삭제에 실패하였습니다.");
		javascript:history.back();
	</c:if>
	
</script>