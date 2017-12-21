<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<title>글삭제</title>

<script type="text/javascript">
<c:if test="${n == 1}">
	alert("글삭제 성공:D");
	location.href="<%= request.getContextPath() %>/music.re?fk_login_id=${fk_login_id}&seq_tbl_music=${seq_tbl_music}";       
</c:if>

<c:if test="${n != 1}">
	alert("글삭제 실패");
	history.back();
</c:if>


</script>
