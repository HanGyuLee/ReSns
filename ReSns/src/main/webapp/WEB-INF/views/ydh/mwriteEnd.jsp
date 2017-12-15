<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

<c:if test="${n == 1}">
 	alert("글쓰기 성공:D");
 	location.href="<%= request.getContextPath()%>/music.re?fk_login_id=${fk_login_id}";
</c:if>

<c:if test="${n != 1}">
  alert("글의 제목,내용 그리고 url은 필수입력입니다.");
  history.back();
</c:if>


//글목록을 보여주는 페이지로 이동한다.

</script>