<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 게시판 메인</title>
<%-- <script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script> --%>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css"> --%>
<%-- <script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.fittext.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.lettering.js"></script>
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/jquery.textillate.js"></script>
<link href="<%= request.getContextPath() %>/resources/textillate-master/assets/animate.css" rel="stylesheet"> --%>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<style>
	
	legend { text-align: center;
	}
	div.selectBtns { position: absolute;
			top: 330px;
			left: 30%;
			margin-left: -100px; }
	div.controlBtns { 
			position: absolute;
			top: 300px;
			left: 50%;
			margin-left: -800px;
	}		
			
	.faqlayer {
		position: absolute;
		top: 390px;
		margin-left: 420px;
		width: 500px;
		}
		
	.heading {
		margin: 1px;
		color: #fff;
		padding: 3px 10px;
		cursor: pointer;
		position: relative;
		background-color:#c30;
		border-radius: 5px;
		}
	.content {
		padding: 5px 10px;
		background-color:#fafafa;
		border-radius: 5px;
		}
	p { padding: 5px 0; }
	
</style>
</head>
<body>
&nbsp;
<br>
<br>

<fieldset>

<!-- Form Name -->
<legend>자주묻는질문[FAQ]</legend>
<div class="container">
	<div class="center-block clearfix" style="width:60%;">
	    <div class="input-group">
	      <input type="text" class="form-control" id="searchInput" name="searchInput" placeholder="질문 전에 검색해 주세요!">
	      <span class="input-group-btn">
	        <button class="btn btn-secondary" type="button" id="searchBtn" onclick="goSearch();">검색</button>
	      </span>
	    </div>
	</div>
</div>

</fieldset>

<br>
<form id="btnFrm">
<div class="selectBtns">
	<button type="button" class="btn btn-default" onclick="goSearch(0);">전체</button>
	<button type="button" class="btn btn-default" style="margin-left: 30px;" onclick="goSearch(1)">회원관련</button>
	<button type="button" class="btn btn-default" style="margin-left: 30px;" onclick="goSearch(2)">기능관련</button>
	<button type="button" class="btn btn-default" style="margin-left: 30px;" onclick="goSearch(3)">기타사항</button>
</div>
</form>

<br><br>
<div>

</div>

<div class="faqlayer"></div>
<br>
<div class="controlBtns">
<c:if test="${loginUser ne null && loginUser.login_status eq 9}">
	<span style="font-weight: bold;">관리자용 메뉴</span><br>
	<button type="button" class="btn btn-default" onclick="goWrite();">입력</button>
	<button type="button" class="btn btn-default" onclick="goModiDel();">수정 및 삭제</button>
</c:if>
</div>
<script type="text/javascript">

	$(document).ready(function() {
	  $(".content").hide();
	  $(".faqlayer").hide();
	  
	  $("#searchInput").keydown(function (key) {
			if (key.keyCode == 13) {
				goSearch();
				$("input[type=text]").prop("disabled", true);
				 setTimeout(function() {
					  $("input[type=text]").prop("disabled", false);
				  },550);
			}		  
	  });
	  
	});// end of $(document).ready()----------
	
	 function goSearch(num) {
		  
		 $("button[type=button]").prop("disabled", true);
		 $("input[type=text]").prop("disabled", true);
		 
		  $(".faqlayer").empty();
		  $(".faqlayer").hide();
		  
		  var data = null;
		  var form_data = null;
		  
		  if (num == null) {
			  data = document.getElementById("searchInput").value;
			  form_data = { "searchInput" : data };
		  }
		  else {
			  form_data = { "searchBtn" : num };
		  }
		  		  
		  $.ajax({
			  url: "faqSearchInput.re",
			  type: "GET",
			  data: form_data,
			  dataType: "HTML",
			  success: function(data) {
				  $(".faqlayer").append(data);
				  $(".faqlayer").show(500);
				  
				  setTimeout(function() {
					  $("button[type=button]").prop("disabled", false);
					  $("input[type=text]").prop("disabled", false);
				  },550);
				  
			  },// end of success: function(data)
			  error: function(request, status) {
				  alert("code: "+request.status+"\n"+"message: "+request.responseText);
			  }
			  
		  }); // end of ajax;
	  }
	
	function goWrite() {
		location.href = "<%= request.getContextPath() %>/faqWrite.re";
	}
	
	function goModiDel() {
		location.href = "<%= request.getContextPath() %>/faqModifyDelete.re";
	}
	
	document.title = "자주묻는질문 게시판";
</script>
</body>
</html>