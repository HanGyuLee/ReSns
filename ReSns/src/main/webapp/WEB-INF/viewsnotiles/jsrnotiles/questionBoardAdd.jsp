<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백문백답 게시판</title>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>



<style type="text/css">
.q_content{
width: 500px;
height: 50px;
font-size: 14px;
color: #555;
background-color: #fff;
background-image: none;
border: 1px solid #ccc;
border-radius: 4px;
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
     -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         
box-shadow:none;
border-color:#eee;      

}
 .q_content:focus{
box-shadow:none; border-color:black;
outline: 0;
} 
.q_content-feedback{ line-height:50px;}
.main-btn{ background:black; color:gray;}
.main-btn:hover{ color:white;}


.goQ{
background-color: black;
border: black;
}

.goQ:focus{
background-color: black;
border: black;
}

.goQ:active:hover{
background-color: black;
border: black;
}

.goQ:active:focus{
background-color: black;
border: black;
}

.goQ:hover{
background-color: black;
border: black;
}



</style>


<script type="text/javascript">
$(document).ready(function(){
	
    $('#q_content').on('keyup', function() {
        if($(this).val().length > 150) {

            $(this).val($(this).val().substring(0, 150));
            alert("공백 포함 150자 까지만 쓸 수 있습니다.");

        }
    });
    
    
    $("#q_go").click(function(){
    	var q_content = $("#q_content").val();
    	//alert("q_content"+q_content);
    	 if (q_content == "" || $.trim(q_content) == "") {
    			alert("질문을 입력하셔야 합니다.");
    			$("#q_content").focus();
    	 }
    	 
    	 else{
    		var frm = document.question;
    		
    		frm.method = "post";
    		frm.action = "<%= request.getContextPath()%>/questionAddEnd.re";
    		frm.submit(); 	 
    		 
    		 
    	 }
   			
    });



});//end of $(document).ready(function()



</script>

</head>
<body>

<form name="question" class="">

<div align="center">
<div style="">
<input type="hidden" name="q_askid" id="q_askid" value="${sessionScope.loginUser.login_id}"><br/>
<input type="hidden" name="fk_login_id" id="fk_login_id" value="${fk_login_id}" ><br/>
<input type="hidden" name="gobackURL" id="gobackURL" value="${gobackURL}" ><br/>
</div>

<div>
<br/>
<br/>
<br/>
<span style="color: gray; font-weight: bold; font-size: 12pt;">질문 등록 후, 수정과 삭제가 불가능합니다. 신중하게 질문을 등록해주세요.</span><br/>
<textarea id="q_content" name="q_content" class="q_content" style="height: 150px; resize: none;" placeholder="질문을 작성해주세요." ></textarea>
</div>
<br/>
<div>
<button type="button" id="q_go" class="delete btn btn-danger goQ">질문하기</button>
<button type="button" id="q_ce" class="delete btn btn-danger" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">돌아가기</button>
</div>
</div>

</form>

	

</body>
</html>