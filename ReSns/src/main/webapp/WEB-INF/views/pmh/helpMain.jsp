<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 메인</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
<style type="text/css">
	table { font-size: 16px;
			text-align: center;
	}
	th { font-size: 18px;
		 text-align: center;
		 font-weight: bold;
	}
	div.main1 {	width: 50%;
			}
</style>
</head>
<body>

<div align="center"><h1>문의 게시판</h1></div>
&nbsp;<br>

<div class="main1" align="center" >
	${currentShowPageNo} / ${pageNo} 페이지, 총 게시글 ${totalCount} 개
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
			<div align="center" id="helpArea">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">#</th>
							<th width="10%">유형</th>
							<th width="10%"></th>
							<th style="text-align: left;" width="30%">제목</th>
							<th width="10%">아이디</th>
							<th width="15%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${helpList ne null}">
							<c:forEach var="help" items="${helpList}" varStatus="status">
								<tr>
									<td width="10%">${help.seq_tbl_ask}</td>
									<td width="10%">${help.ask_cate}</td>
									<td width="10%"></td>
									<td style="text-align: left;" width="30%">${help.ask_title}&nbsp;
									<c:if test="${help.ask_newest == 1}">
										<img src="<%= request.getContextPath() %>/resources/images/pmh_newest.png" width="30px"  height="15px"/>
									</c:if>
									</td>
									<td width="10%">${help.fk_login_id}</td>
									<td width="15%">${help.ask_date1}</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<c:if test="${helpList eq null}">
							<tr>
								<td colspan="6">내용이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div> 
	</div>
</div>
<br>
<div align="center">
	<form id="searchFrm">
		<select id="searchType" name="searchType">
			<option value="ask_title">제목</option>
			<option value="fk_login_id">아이디</option>
			<option value="ask_content">내용</option>
			<option value="ask_title||ask_content">제목+내용</option>
		</select>
		<input type="text" onkeyup="enterkey();" id="searchInput" name="searchInput">
		<button type="button" id="searchBtn" onclick="goSearch();">찾기</button>
		<button type="button" id="clearBtn" onclick="goClear();">검색해제</button>
	</form>
</div>	
	
	<form id="seqFrm">
		<input type="hidden" id="seq" name="seq">
	</form>


<br>
<div align="center">
		${pagebar}
</div>

<div align="right">
	<button type="button" style="margin-right: 400px;" onclick="goWrite();">글쓰기</button>
</div>

<script type="text/javascript">

	function enterkey() {
	    if (window.event.keyCode == 13) {
	
	    	goSearch();
	    }
	}
	
	
	
	function goDetail(seq) {
		
		document.getElementById("seq").value = seq;
		
		var frm = document.getElementById("seqFrm");
		frm.action = "/resns/helpDetail.re";
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
		
		frm.action = "/resns/help.re";
		frm.method = "GET";
		frm.submit();
	}
	
	function goClear() {
		location.href = "/resns/help.re";
	}
	
	function goWrite() {
		location.href = "/resns/helpWrite.re"
	}

	document.title = "문의게시판 메인";
</script>
</body>
</html>