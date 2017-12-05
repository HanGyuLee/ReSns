<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/BootStrapStudy/css/bootstrap.css">
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-2.0.0.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/BootStrapStudy/js/bootstrap.js"></script>


<style type="text/css">

	#div_name{
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_mobile{
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	#div_finalResult{
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
	
	#div_btnFind{
		width: 70%;
		height: 15%;
		margin-bottom: 5%;
		margin-left: 10%;
		position: relative;
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		var method = "${method}";		
		//alert("확인용 : " + method);
		
		if (method == "GET") {
			$("#div_finalResult").hide(); //get 이면 보이지마라
		}
		
		$("#btnFind").click(function(){
			var frm = document.idFindFrm;
			frm.method = "post";
			frm.action = "<%= request.getContextPath() %>/idFind.rs";
			frm.submit();
		});
		
		if (method == "POST") {
			$("#name").val("${name}");
			$("#email").val("${email}");
			$("#div_finalResult").show();
		}
	  
	});

</script>

<form name="idFindFrm">
	<div id="div_name" align="center">
		<span style="color: blue; font-size: 12pt;">성명</span><br/>
		<input type="text" id="name" name="name" size="15" placeholder="홍길동" required />
	</div>
	
	<div id="div_mobile" align="center">
		<span style="color: blue; font-size: 12pt;">이메일</span><br/>
		<input type="text" id="email" name="email" size="15" placeholder="이메일을 입력하세요" required />
	</div>
	
	<div id="div_finalResult" align="center">
		ID : <span style="color: red; font-size: 16pt; font-weight: bold;">${userid}</span>
	</div>
	
	<div id="div_btnFind" align="center">
		<button type="button" class="btn btn-success" id="btnFind">찾기</button>
	</div>
	
</form>
