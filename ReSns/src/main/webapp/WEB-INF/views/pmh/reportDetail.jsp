<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고상세 페이지</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<script src="<%= request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.min.js"></script>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css"> --%>
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.fittext.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.lettering.js"></script>
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/jquery.textillate.js"></script>
<link href="<%= request.getContextPath() %>/resources/textillate-master/assets/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<style type="text/css">

	/* table { width: 40%;
			font-size: 18px;
			border: 1px solid grey;
	}
	table tr { border: 1px solid grey;
	}
	table td { font-weight: bold;
				text-align: left;
				border: 1px solid grey;
	 } */
	 
	 table.ex1 {width:35%; margin:0 auto; text-align:right; border-collapse:collapse}
	.ex1 td {padding:5px 10px}
	.ex1 tbody th {text-align:left; width:15%}
	.ex1 tbody tr:hover {background:#F3F5BB}
	.ex1 tbody tr:hover th {background:#F2F684; color:#1BA6B2}
	 
	 .modal-dialog.modal-80size {
			  width: 80%;
			  height: 80%;
			  margin: 0;
			  padding: 0;
		}
	
</style>

</head>
<body>

<div align="center"><h1>신고된 게시물 상세내역</h1></div>
<br><br>


<div align="center">
<table class="ex1">
	<tr>
		<th width="20%">신고사유</th>
		<td width="80%"><c:out value="${reportMap['report_cate']}"/></td>
	</tr>
	<tr>
		<th width="20%">신고자</th>
		<td width="80%"><c:out value="${reportMap['reporting_name']}"/>&nbsp;(<c:out value="${reportMap['reporting_id']}"/>)</td>
	</tr>
	<tr>
		<th width="20%">피신고자</th>
		<td width="80%"><c:out value="${reportMap['report_name']}"/>&nbsp;(<c:out value="${reportMap['report_id']}"/>)</td>
	</tr>
	<tr>
		<th width="20%">신고글번호</th>
		<td width="80%"><c:out value="${reportMap['fk_seq_tbl_board']}"/></td>
	</tr>
	<tr>
		<th width="20%">신고날짜</th>
		<td width="80%"><c:out value="${reportMap['report_date1']}"/></td>
	</tr>
	<tr>
		<th width="20%">처리날짜</th>
		<td width="80%"><c:out value="${reportMap['report_date2']}"/></td>
	</tr>
	<tr>
		<th width="20%">처리상태</th>
		<td width="80%">
			<c:if test="${reportMap.report_status eq 0}">
							0. 처리완료
			</c:if>
			<c:if test="${reportMap.report_status eq 1}">
							1. 처리중...
			</c:if>
			
		</td>
	</tr>
	<tr>
		<th width="20%">신고내용</th>
		<td width="80%"><c:out value="${reportMap['report_content']}"/></td>
	</tr>
	
</table>

<%-- <c:forEach var="i" items="${reportMap}">
			${i.key}=${i.value}
</c:forEach> --%>

</div>
<input type="hidden" id="reportnum" value="${reportMap['fk_seq_tbl_board']}">
<br>
<div align="center">
<button type="button" id="popbutton" data-target="#layerpop" data-toggle="modal">해당게시물 가기</button>
</div>


<div class="modal fade" id="layerpop" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" id="modalbody">
    
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
						// $('div.modal').modal();
						$("#layerpop").modal("show");
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