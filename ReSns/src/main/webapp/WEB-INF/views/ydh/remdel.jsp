<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<title>글수정</title>

<script type="text/javascript">
<c:if test="${n == 1}">
	alert("글삭제 성공:D");
	location.href="<%= request.getContextPath() %>/music.re?seq_tbl_music=${seq_tbl_music}&fk_login_id=${fk_login_id}";       
</c:if>

<c:if test="${n != 1}">
	alert("글삭제 실패");
	history.back();
</c:if>


</script> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<script type="text/javascript">
		alert("${msg}");
		location.href="<%= request.getContextPath() %>/mview.re?seq_tbl_music=${seq_tbl_music}&fk_login_id=${fk_login_id}"; 
		// 댓글쓰기를 한 원글 페이지로 이동
	</script>
