<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백문백답 게시판</title>
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
</style>


<script type="text/javascript">
$(document).ready(function(){

	

});//end of $(document).ready(function()


function goQuestion(){


var frm = document.question;
//alert("엔터이벤트 왜떠???");
 frm.method = "post";
frm.action = "<%= request.getContextPath()%>/questionAddEnd.re";
frm.submit();
	
}


</script>

</head>
<body>

<form name="question" class="">

<div align="center">
<div style="">
<input type="text" name="q_askid" id="q_askid" value="${sessionScope.loginUser.login_id}"><br/>
<input type="text" name="fk_login_id" id="fk_login_id" ><br/>
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
<button type="button" class="delete btn btn-danger" onClick="goQuestion()">질문하기</button>
</div>

</div>

</form>

	

</body>
</html>