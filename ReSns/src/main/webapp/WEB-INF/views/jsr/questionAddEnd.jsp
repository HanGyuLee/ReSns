<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

<%-- <c:if test="${n == 1}">
alert("글쓰기 성공")
</c:if>

<c:if test="${n != 1}">
alert("글쓰기 실패")
</c:if>


location.href="<%= request.getContextPath()%>/questionList.re";
 --%>
</script>



<c:if test="${n == 1}">
질문 등록이 되었습니다!
<button type="button">닫기</button>
</c:if>

<c:if test="${n != 1}">
질문등록에 실패하였습니다.
<button type="button">닫기</button>
</c:if>