<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

table{
    font-family:'Calibri';
    font-size:13px;
    background-color:#fff;
    color:#333; 
}
.modal-header{
    background-color:#333;
    color:#fff;
}


/* .table-hover > tbody > tr:hover {
  background-color: blue;
}  */

.aaaa:hover {
  background-color: white;
} 


</style>

<script type="text/javascript">
$(document).ready(function(){
	
 
	});//end of $(document).ready
	
	
	
	function goqView(seq_tbl_q){	
		var frm = document.qViewFrm;
		//var statuscount = statuscount;
		frm.seq_tbl_q.value = seq_tbl_q;
		
 		frm.method = "get";
		frm.action ="<%= request.getContextPath()%>/questionView.re";
		frm.submit(); 
		//showView(statuscount);
		//alert("순서확인");
		
	
	}//end of goqView

/* 	function showView(statuscount){
		
	var statuscount = statuscount;
		$("#q_a_re"+statuscount).show();
		//alert("번호확인"+statuscount);
 
		 
		  var form_data = {"seq" : $("#review"+statuscount).val()}  
		
		$.ajax({
		url: "/resns/questionView.re",
		type: "GET",
		data: form_data,
		dataType: "HTML", 
		success: function(data) {

			$("#q_a_recontent"+statuscount).html(data);
			
		
			
		}, // end of success: function()----------
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	}); // end of $.ajax()------------------------
		
		
	}//end of showView	 */
	
	function goDel(seq_tbl_q,statuscount){
	var frm = document.delFrm;	
	var seq_tbl_q = seq_tbl_q;
	var statuscount = statuscount;
	//alert("확인"+seq_tbl_q);
	if (confirm("선택하신 "+statuscount+" 번 질문을 삭제하시겠습니까?") == true){    //확인
	   
	frm.seq_tbl_q.value= seq_tbl_q;
	frm.method = "post";
	frm.action = "<%= request.getContextPath()%>/questionDel.re";
	frm.submit(); 
	
	}else{   //취소
	    return;
	}

		
		
	}
	
	
</script>



<title>백문백답</title>
</head>
<body>
<br/>
<br/>

<div class="container">
	<div class="row">
		<table class="table table-hover table-responsive">
		    <thead>
		        <tr>
		            <th><span style="margin-left: 30%;">번호</span></th>
		            <th><span style="margin-left: 50%; text-align: center;">질문내용</span></th>
		            <th><span style="margin-left: 10%;">질문날짜</span>
		            </th>
<!-- 		            <th>시퀀스</th>
		            <th>상태값</th>
		            <th>수정</th>
		            <th>삭제</th> -->
		        </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="qvo" items="${queBoardList}" varStatus="status">
		    	<tr id="d1">
		            <td width="50px"><span style="margin-left: 50%;">${status.count}</span></td>
		            <td id="f1" width="700px"><span onClick="goqView('${qvo.seq_tbl_q}');">${qvo.q_content}</span>
		            <c:if test="${qvo.q_status == 1}">
		            <img  src="<%= request.getContextPath() %>/resources/images/qboard_c.png"/>
 					<span style="font-size: 9pt; color: gray;">답변이 달려있어요.</span>
 					</c:if>
		            </td>
		            <td id="l1" width="210px" style="margin-right: 0%;">${qvo.q_date}
		            <input type="hidden" id="review${status.count}" value="${qvo.seq_tbl_q}"/>
		            <input type="hidden" value="${qvo.fk_login_id}"/>
		            <input type="hidden" value="${qvo.q_askid}"/>
		            <input type="hidden" value="${qvo.q_status}"/>
 					<c:if test="${qvo.fk_login_id == sessionScope.loginUser.login_id}">
 					<!-- <button type="button" data-toggle="modal" data-target="#edit" data-uid="1" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button> -->
 					<button style="margin-left: 20%;" type="button" class="delete btn btn-danger" onClick="goDel('${qvo.seq_tbl_q}','${status.count}');">Delete<%-- <span class="glyphicon glyphicon-trash"></span> --%></button>
 					</c:if>

		            
		            </td>  
		            
		        </tr>	        

<%-- 		        <tr id="q_a_re${status.count}" class="a_board">
		        <td class="aaaa" colspan="3">
				<div id="q_a_recontent${status.count}"></div>
		        </td>
		        </tr> --%>
		    </c:forEach>
		    </tbody>
		</table>
	</div>
</div>

<form name="qViewFrm">
<input type="hidden" name="seq_tbl_q"/>
</form>

<form name="delFrm">
<input type="text" name="seq_tbl_q"/>


<input type="text" id="gobackURL" value="돌아갈 주소 들어갈 자리"/>
</form>


</body>
</html>