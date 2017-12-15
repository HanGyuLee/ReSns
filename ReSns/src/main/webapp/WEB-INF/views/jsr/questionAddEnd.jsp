<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

$(document).ready(function(){
	 
	$(document).keydown(function(e) {
	    key = (e) ? e.keyCode : event.keyCode;
	     
	    var t = document.activeElement;
	     
	    if (key == 8 || key == 116 || key == 17 || key == 82) {
	        if (key == 8) {
	            if (t.tagName != "INPUT") {
	                if (e) {
	                    e.preventDefault();
	                } else {
	                    event.keyCode = 0;
	                    event.returnValue = false;
	                }
	            }
	        } else {
	            if (e) {
	                e.preventDefault();
	            } else {
	                event.keyCode = 0;
	                event.returnValue = false;
	            }
	        }
	    }
	});

	 });//end of document.ready


</script>

<body>
<div align="center" style="margin-top: 50px;">

<c:if test="${n == 1}">
<div style="width:300px; border:  dotted black;">

<div align="center">질문 등록이 되었습니다!</div>
<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">리스트로 가기</button>
</div>

</c:if>

<c:if test="${n != 1}">
<div style="width:300px; border:  dotted black;">
<div align="center">질문등록에 실패하였습니다.</div>
<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">리스트로 가기</button>
</div>
</c:if>

</div>

<form name="gobacklist">
<input type="text" name="fk_login_id" value="${fk_login_id}">
</form>

</body>
</head>
</html>