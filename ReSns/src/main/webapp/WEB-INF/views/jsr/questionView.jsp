<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백문백답 게시판</title>
<style type="text/css">


.a_content{
width: 400px;
height: 30px;
font-size: 14px;
color: #555;
background-color: #fff;
background-image: none;
border: 1px solid #ccc;
border-radius: 4px;/* 
//border-radius: 25px; */
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
     -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         
box-shadow:none;
border-color:#eee;      

}
.a_content:focus{
box-shadow:none; border-color:black;
outline: 0;
}
.a_content-feedback{ line-height:50px;}


.q_contentbox{
border-radius: 25px;
background-color: skyblue;
}

.a_contentbox{
border-radius: 25px;
background-color: #fffd95;
}

.main-btn{ background:black; color:gray;}
.main-btn:hover{ color:white;}
</style>


<script type="text/javascript">

$(document).ready(function(){
	 
	 });




function goQboardRe(){
	

	var frm =  document.qboardReFrm;
	
	frm.method = "post";
	frm.action ="<%= request.getContextPath()%>/questionReEnd.re";
	frm.submit(); 
	
}



function goQReDel(){
	
	var frm =  document.qboardReFrm;
	
	frm.method = "post";
	frm.action ="<%= request.getContextPath()%>/questionReDel.re";
	frm.submit(); 
	
}


</script>

</head>
<body>

<form name="qboardReFrm">
<div align="center">
<div align="center" style="margin-top:5%;  border: solid 1px #f6f3e8; width: 500px; height: 500px; border-radius: 25px; background-color:  #f8e91f; ">
<div style="padding-top:5%; margin-top: 9%; margin-bottom: 2%; background-color: #f6f3e8; width: 498px; height: 400px;" class="a_board">
<table>


<tr>
<td><img src="<%=request.getContextPath() %>/resources/images/q_ask_icon.png"></td>
<td  class="q_contentbox" ><span style="padding-right:100px; margin-left:20px; margin-right: 80px;">${getques.q_content}</span></td>
<td><input id="fk_seq_tbl_q" name="fk_seq_tbl_q" type="text" value="${getques.seq_tbl_q}"/></td>
</tr>
<tr>
<td colspan="2" align="right"><span style="text-align: right;">${getques.q_date}</span></td>
</tr>



<tr style="margin-top: 20px; margin-bottom: 20px;">
<td colspan="2" align="right">&nbsp;</td>
</tr>


<tr>
<td colspan="2" class="a_contentbox" style="padding-left: 50px;">
 <c:if test ="${replay.a_content == null}" >
<span style="text-align:right; margin-left:20px; margin-right: 20px;">아직 답변이 없습니다.</span>
</c:if>
 <c:if test ="${replay.a_content != null}" >
<span style="text-align:right; margin-left:20px; margin-right: 20px;">${replay.a_content}</span>
</c:if>
</td>
<td align="right"><img src="<%=request.getContextPath() %>/resources/images/a_board_login_id.png"><input type="hidden" name="fk_login_id" value="${sessionScope.loginUser.login_id}" /></td>
</tr>
<tr>
<td colspan="2" align="left"><span style="text-align: right;">${replay.a_date}</span></td>
</tr>


<tr style="margin-top: 20px; margin-bottom: 20px;">
<td colspan="3" align="right">&nbsp;</td>
</tr>

<c:if test ="${replay.a_content == null && getques.fk_login_id == sessionScope.loginUser.login_id}">
<tr >
<td colspan="2" align="center">
<div style="margin-left: 10px;"><textarea class="a_content" name="a_content" id="a_content" placeholder="답변을 작성해주세요." style=" height:100px; resize: none;"></textarea>
</div>
</td>

</tr>
<tr style="margin-top: 10px; margin-bottom: 20px;">
<td colspan="2" align="center"> <button type="button" id="q_board_re"  onClick="goQboardRe();" class="delete btn btn-danger">답변 작성</button></td>
</tr>
</c:if>


<c:if test ="${replay.a_content != null && getques.fk_login_id == sessionScope.loginUser.login_id}">
<tr >
<td colspan="2" align="center">
</td>

</tr>
<tr style="margin-top: 10px; margin-bottom: 20px;">
<td colspan="2" align="center"> <button type="button" id="q_board_re"  onClick="goQReDel();" class="delete btn btn-danger">답변 삭제</button></td>
</tr>
</c:if>





</table>

</div>
</div>
</div>

<input type="text" id="gobackURL" value="돌아갈 주소 들어갈 자리"/>

</form>


</body>
</html>