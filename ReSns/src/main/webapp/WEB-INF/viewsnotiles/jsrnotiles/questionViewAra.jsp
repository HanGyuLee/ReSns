<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>

<style type="text/css">

table{
    font-family:'Calibri';
    font-size:13px;
    background-color:#fff;
    color:#333; 
}
.table-hover > tbody > tr:hover {
  background-color: #fff;
}


.modal-header{
    background-color:#333;
    color:#fff;
}



.a_content:focus{
box-shadow:none; border-color:black;
outline: 0;
}
.a_content-feedback{ line-height:50px;}


/* .q_contentbox{
border-radius: 25px;
background-color: skyblue;
}

.a_contentbox{
border-radius: 25px;
background-color: #fffd95;
} */



/* .table-hover > tbody > tr:hover {
  background-color: blue;
}  */

.aaaa:hover {
  background-color: white;
} 

.goQ{
background-color: black;
border: black;
}

.goQ:focus{
background-color: #343434;
border: black;
}

.goQ:active:hover{
background-color: #343434;
border: black;
}

.goQ:active:focus{
background-color: #343434;
border: black;
}

.goQ:hover{
background-color: #343434;
border: black;
}




.qsearch{
width: 300px;
height: 40px;
font-size: 12px;
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
border-color:#dbdbdb;      

}
 .qsearch:focus{
box-shadow:none; border-color:black;
outline: 0;
} 
.qsearch-feedback{ line-height:50px;}


.searchbox{
         
box-shadow: 5px 5px 5px 0px lightgray;

border-radius: 4px;

}





.triangle-isosceles {
  position:relative;
  padding:15px;
/*   margin:1em 0 3em; */
  color:#000;
  background:#f3961c; /* default background for browsers without gradient support */
  /* css3 */
  background:-webkit-gradient(linear, 0 0, 0 100%, from(#f9d835), to(#f3961c));
  background:-moz-linear-gradient(#f9d835, #f3961c);
  background:-o-linear-gradient(#f9d835, #f3961c);
  background:linear-gradient(#f9d835, #f3961c);
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

.triangle-isosceles:after {
  content:"";
  position:absolute;
  bottom:-15px; /* value = - border-top-width - border-bottom-width */
  left:50px; /* controls horizontal position */
  border-width:15px 15px 0; /* vary these values to change the angle of the vertex */
  border-style:solid;
  border-color:#f3961c transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}





.triangle-obtuse {
  position:relative;
  padding:15px;
/*   margin:1em 0 3em; */
  color:#000;
  background:#8c8c8c; /* default background for browsers without gradient support */
  /* css3 */
  background:-webkit-gradient(linear, 0 0, 0 100%, from(#8c8c8c), to(#000000));
  background:-moz-linear-gradient(#8c8c8c, #000000);
  background:-o-linear-gradient(#8c8c8c, #000000);
  background:linear-gradient(#8c8c8c, #000000);
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

.triangle-obtuse:after {
  content:"";
  position:absolute;
  bottom:-15px; /* value = - border-top-width - border-bottom-width */
  left:600px; /* controls horizontal position */
  border-width:15px 15px 0; /* vary these values to change the angle of the vertex */
  border-style:solid;
  border-color:#000000 transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}




</style>

<script type="text/javascript">

	
	
</script>



<title>답변보기</title>
</head>
<body>
<br/>
<br/>
<div style="border: solid 0px skyblue; width: 900px; position: relative; left: 5%;">


	<div class="myrow" style="width:900px; border: 0px solid red; ">
<form name="qboardReFrm">
<span style="margin-top: -10px;"><img src="<%= request.getContextPath()%>/resources/images/q_board_count.png "> 질문을 확인해주세요!</span>

		<table class="table table-hover table-responsive" style="width: 800px; border:1px solid; border-color: #c2c2c2; margin-top: 10px;">
		    <thead>
		        <tr>
		            <th colspan="5"><span style="margin-left: 45%; font-size: 12pt;">${getques.q_date}</span></th>

		        </tr>
		    </thead>
		    <tbody>
		    	<tr id="d1">
		    	<td></td>
		            <td align="center" id="f1" width="600px" colspan="3">
		           <p class="triangle-isosceles">${getques.q_content}</p>
		            <img style="position: relative; right: 38%;" src="<%=request.getContextPath() %>/resources/images/q_ask_icon.png">
		            <input id="fk_seq_tbl_q" name="fk_seq_tbl_q" type="hidden" value="${getques.seq_tbl_q}"/>
		           <input type="hidden" id="q_askid" name="q_askid" value="${getques.q_askid}"/>
		            </td>   
		            <td></td>
		            
		        </tr>	
		        

		        
		        		        
		        <tr>
		        <td colspan="5" style="border-top-style: hidden; border-bottom-style: hidden;"></td>
		        </tr>      
		        
		        
		        <tr>
		        <td></td>
		        
		        <td colspan="3" width="600px" align="center"> 
		        <c:if test ="${replayMap.a_content == null}" >
		       
				<span style="color: black; font-weight:bold; font-size:15pt;  text-align: center;">아직 답변이 없습니다.</span>
				${replayMap.fk_login_name}
				</c:if>
				
				<c:if test ="${replayMap.a_content != null}">
				<div  align="left">답변날짜:${replayMap.a_date}</div>
				<p class="triangle-obtuse">
				<span style="color: white;  text-align: center;">${replayMap.a_content}</span></p>
				<div style="font-size: 17pt; font-weight:bold; position: relative; left: 38%;">${replayMap.fk_login_name}</div>
				</c:if>        
				</td>
		        <td></td>
		        </tr>  

		    </tbody>
		</table>


		<input type="hidden" id="fk_login_id" name="fk_login_id" value="${getques.fk_login_id}"/>

</form>
		
			</div>

</div>




</body>
</html>