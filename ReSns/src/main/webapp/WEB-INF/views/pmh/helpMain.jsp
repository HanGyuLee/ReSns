<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 메인</title>
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
	div.main1 {	width: 50%;
			}
			
		html,body{
  height:100%;
}

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:35px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

input[type=text] {
 border: none;
 border-bottom: 2px solid cyan;
}

    select {
        width: 150px;
        height: 30px;
        padding-left: 10px;
        font-size: 18px;
        color: #006fff;
        border: 1px solid #006fff;
        border-radius: 3px;
        -webkit-appearance: none; 
       -moz-appearance: none;    
       appearance: none;
       background: url('<%= request.getContextPath() %>/resources/images/mod_select-arrow-down-red.png') no-repeat 95% 50%; /* 화살표 아이콘 추가 */       
    }
    select::-ms-expand {
       display: none;            
    }
</style>
</head>
<body>

<div align="center"><h1>문의 게시판</h1></div>
&nbsp;<br>

<div class="main1" align="center" >
	<span style="font-weight: bold;">${currentShowPageNo}  / ${totalPage}</span> 페이지, 총 게시글 <span style="font-weight: bold;">${totalCountExceptDelete}</span> 개
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
								<c:choose>
								<c:when test="${help.ask_status eq 1}">
									<tr>
										<td width="10%">${help.seq_tbl_ask}</td>
										<td width="10%">${help.ask_cate}</td>
										<td width="10%">
											<c:if test="${help.ask_secret eq 0}">
												<img src="<%= request.getContextPath() %>/resources/images/lock.png" width="20px"  height="15px"/>
											</c:if>
										</td>
										<td style="text-align: left;" width="30%">
											<c:if test="${help.ask_depthno eq 0}">
												<span style="cursor: pointer;" onclick="goDetail('${help.seq_tbl_ask}');">${help.ask_title}</span>
											</c:if>
											<c:if test="${help.ask_depthno > 0}">
												<span style="font-style: italic; padding-left: ${help.ask_depthno*20}px; cursor: pointer;" onclick="goDetail('${help.seq_tbl_ask}');">┗re ${help.ask_title}</span>
											</c:if>
										&nbsp;
										<c:if test="${help.ask_newest eq 1}">
											<img src="<%= request.getContextPath() %>/resources/images/pmh_newest.png" width="30px"  height="15px"/>
										</c:if>
										</td>
										<td width="10%">${help.fk_login_id}</td>
										<td width="15%">${help.ask_date1}</td>
									</tr>
								</c:when>
								<c:when test="${help.ask_status eq 0}">
									<tr>
										<td>${help.seq_tbl_ask}</td>
										<td width="10%"></td>
										<td width="10%"></td>
										<td colspan="3" style="text-align: left;"><span style="color: red;">삭제된 글입니다</span></td>
									</tr>							
								</c:when>
								</c:choose>
							</c:forEach>
						</c:if>
						
						<c:if test="${helpList eq null}">
							<tr>
								<td colspan="6">문의된 내용이 없습니다.</td>
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
		<input type="text" onkeyup="enterkey();" width="300px" id="searchInput" name="searchInput">
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
	<button type="button" style="margin-right: 150px;" onclick="goWrite();">글쓰기</button>
</div>

<script type="text/javascript">

	function enterkey() {
		var event = event || window.event;
	    if (event.keyCode == 13) {
	
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