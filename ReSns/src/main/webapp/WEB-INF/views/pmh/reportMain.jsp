<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리(신고) 게시판</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
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

	table { font-size: 16px;
			text-align: center;
			
	}
	th { font-size: 18px;
		 text-align: center;
		 font-weight: bold;
	}

	a.no-uline { text-decoration:none }
	
</style>
</head>
<body>
<div>
	<div align="center"><h1>신고관리 게시판</h1></div>
	&nbsp;<br>
<div class="container">
    <div class="row">
        <div class="col-md-12">
			<div align="center" id="reportArea">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">#</th>
							<th width="10%">유형</th>
							<th style="text-align: left;" width="30%">제목</th>
							<th width="15%">처리상태</th>
							<th width="10%">아이디</th>
							<th width="15%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${rvoList ne null}">
							<c:forEach var="rvo" items="${rvoList}" varStatus="status">
							<tr>
								<td width="10%">${rvo.seq_tbl_report}</td>
								<td width="10%">${rvo.report_cate}</td>
								
								<td style="text-align: left;">
								&nbsp;<span style="font-weight: bold;"><a class="no-uline" onclick="goDetail(${rvo.seq_tbl_report});">${rvo.report_content}</a></span>
								</td>
								<td width="15%">
									<c:if test="${rvo.report_status eq 0}">
										[처리완료]<input type="hidden" id="color${status.count}" value="s">
									</c:if>
									
									<c:if test="${rvo.report_status eq 1}">
										[처리중]<input type="hidden" id="color${status.count}" value="d">
									</c:if>
								</td>
								<td width="10%">${rvo.report_user}</td>
								<td width="15%">${rvo.report_date1}</td>
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${rvoList eq null}">
							<tr class="danger">
								<td colspan="6"><span style="text-align: center; font-weight: bold;">현재 신고접수된 사항이 없습니다.</span></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div> 
	</div>
</div>
	
<div align="center" style="margin-left: 400px;">
	<form id="searchFrm" class="form-inline">
		<select id="searchType" name="searchType" style="width: 100px;" class="form-control col-xs-4">
			<option value="report_content">제목</option>
			<option value="report_user">아이디</option>
		</select>
		 <div class="container-fluid">
		 	<div class="col-md-4 col-sx-6">
				<input type="text" onkeyup="enterkey();" class="form-control" id="searchInput" name="searchInput">
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default" id="searchBtn" onclick="goSearch();">찾기</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default" id="clearBtn" onclick="goClear();">검색해제</button>
			</div>
		</div>
	</form>
</div>	
	<br>
	<form id="seqFrm">
		<input type="hidden" id="seq" name="seq">
	</form>
	
</div>

<br>&nbsp;
<div align="center">
		${pagebar}
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		var $rows = $("#reportArea table tr");
		
		$rows.each(function(i, item) {
			$this = $(item);
			
			var row = $("#color"+i).val();
			if (row == 's') {
				$this.addClass("success");
			}
			else if (row == 'd') {
				$this.addClass("danger");
			}
			else{
				$this.addClass("active");
			}
			
		});
		
	});// end of $(document).ready()------------
	
	function enterkey() {
		var event = event || window.event;
        if (event.keyCode == 13) {
 
        	goSearch();
        }
	}

	
	
	function goDetail(seq) {
		
		document.getElementById("seq").value = seq;
		
		var frm = document.getElementById("seqFrm");
		frm.action = "/resns/reportDetail.re";
		frm.method = "GET";
		frm.submit();
		
	}
	
	function goSearch() {
		var frm = document.getElementById("searchFrm");
		
		var content = document.getElementById("searchInput").value;
		
		if (content.trim() == "") {
			window.location.reload();
			return;
		}
		
		frm.action = "/resns/report.re";
		frm.method = "GET";
		frm.submit();
	}
	
	function goClear() {
		location.href = "/resns/report.re";
	}
	document.title = "신고관리 게시판";
</script>
</body>
</html>