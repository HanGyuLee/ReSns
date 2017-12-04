<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고상세 페이지</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">

<style type="text/css">

	table { width: 40%;
			font-size: 18px;
			border: 1px solid grey;
	}
	table tr { border: 1px solid grey;
	}
	table td { font-weight: bold;
				text-align: left;
				border: 1px solid grey;
	 }
	
</style>

</head>
<body>

<div align="center"><h1>신고된 게시물 상세내역</h1></div>
<br><br>


<div align="center">
<table>
	<tr>
		<td width="20%">신고사유</td>
		<td width="80%"><c:out value="${reportMap['report_cate']}"/></td>
	</tr>
	<tr>
		<td width="20%">신고자<%-- ${reportMap.reporting_name} --%></td>
		<td width="80%"><c:out value="${reportMap['reporting_name']}"/>&nbsp;(<c:out value="${reportMap['reporting_id']}"/>)</td>
	</tr>
	<tr>
		<td width="20%">피신고자</td>
		<td width="80%"><c:out value="${reportMap['report_name']}"/>&nbsp;(<c:out value="${reportMap['report_id']}"/>)</td>
	</tr>
	<tr>
		<td width="20%">신고글번호</td>
		<td width="80%"><c:out value="${reportMap['fk_seq_tbl_board']}"/></td>
	</tr>
	<tr>
		<td width="20%">신고날짜</td>
		<td width="80%"><c:out value="${reportMap['report_date1']}"/></td>
	</tr>
	<tr>
		<td width="20%">처리날짜</td>
		<td width="80%"><c:out value="${reportMap['report_date2']}"/></td>
	</tr>
	<tr>
		<td width="20%">처리상태</td>
		<td width="80%"><c:out value="${reportMap['report_status']}"/></td>
	</tr>
	<tr>
		<td width="20%">신고내용</td>
		<td width="80%"><c:out value="${reportMap['report_content']}"/></td>
	</tr>
	
</table>

<%-- <c:forEach var="i" items="${reportMap}">
			${i.key}=${i.value}
</c:forEach> --%>

</div>
<input type="text" id="reportnum" value="${reportMap['fk_seq_tbl_board']}">
<br>
<div align="center">
<button type="button" id="popbutton" data-target="#layerpop" data-toggle="modal">해당게시물 가기</button>
</div>


<div class="modal fade" id="layerpop" >
  <div class="modal-dialog" id="modalbody">
    
  </div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		$(function(){
		    $("#popbutton").click(function(){
		    	$("#modalbody").empty();
		    	
		        var form_data = { "reportnum" : $("#reportnum").val() };
		        
		        $.ajax({
					url: "/resns/getBoardContent.re",
					type: "GET",
					data: form_data,  
					dataType: "HTML",
					success: function(data) {
					
						$("#modalbody").append(data);
						$('div.modal').modal();
					}, // end of success: function()----------
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				}); // end of $.ajax()------------------------
		        
		        
		    });
		});


	});
	
	document.title = "신고된 게시물 상세내역";
</script>

</body>
</html>