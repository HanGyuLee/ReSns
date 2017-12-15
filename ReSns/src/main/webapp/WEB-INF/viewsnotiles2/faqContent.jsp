<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
    
<c:choose>
	<c:when test="${faqList ne null}">
		<c:forEach var="faq" items="${faqList}" varStatus="status">
			<p class="heading">${faq.faq_title}</p>
			<div class="content"><span style="font-weight: bold;">${faq.faq_content}</span><br>${faq.faq_answer}</div>
		</c:forEach>
		<button type="button" id="btn"></button>
	</c:when>
	<c:when test="${faqList eq null}">
		검색된 결과가 없습니다.
	</c:when>
</c:choose>    

<script type="text/javascript">

	$(document).ready(function() {
		
	  $(".content").hide();
	  
	  $("#btn").html("모두 펼치기");
	 
	  //content 클래스를 가진 div를 표시/숨김(토글)
	  $(".heading").click(function()
	  {
	    $(this).next(".content").slideToggle(500);
	  });
	  
	  $("#btn").click(function() {
		  
		  var submenu = $(".heading").next(".content");
		  
		  if (submenu.is(":visible")) {
			  submenu.slideUp();
			  $("#btn").html("모두 펼치기");
		  }
		  else {
			  submenu.slideDown();
			  $("#btn").html("모두 닫기");
		  }
		
	  });
		  
	});

</script>