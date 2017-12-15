<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.fittext.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.lettering.js"></script>
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/jquery.textillate.js"></script>
<link href="<%= request.getContextPath() %>/resources/textillate-master/assets/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<title>FAQ 수정 및 삭제</title>
<style type="text/css">

	#container {  position:absolute;
				  top:35%;
				  left:50%;
				  background:skyblue;
				  transform:translate(-50%, -50%);
				  width: 70%;
	}
	
	div.btns { position:absolute;
				  top:60%;
				  left:81%;
	}
	/* 	
	table { width: 100%;
				table-layout: fixed;}
	
	td div{ 
		max-width: 100px;
		text-overflow: ellipsis;
		overflos: hidden;
	} */

</style>
</head>
<body>
<br>
<h1 align="center">FAQ 수정 및 삭제 관리</h1>
<br>
<br>
<form id="faqFrm">
<div id="container">
<table class="table" style="table-layout: fixed;">
	
<c:if test="${faqList ne null}">
	<tr>
		<th width="3%">#</th>
		<th width="5%">no.</th>
		<th width="10%">카테고리</th>
		<th width="10%">제목</th>
		<th width="20%">서브제목</th>
		<th width="36%">답변</th>
		<th width="5%">상태</th>	
		<th width="5%">수정</th>
	</tr>
	<c:forEach var="faq" items="${faqList}" varStatus="status">
		<c:choose>
			<c:when test="${faq.faq_category eq '1'}">
				<tr>
					<td><input type="checkbox" name="faqchk" value="${faq.seq_tbl_faq}" ></td>
					<td>${faq.seq_tbl_faq}</td>
					<td>회원관련</td>
					<td>${faq.faq_title}</td>
					<td><div style='display:block; overflow:hidden;'>${faq.faq_content}</div></td>
					<td><div style='display:block; overflow:hidden;'>${faq.faq_answer}</div></td>
					<td>
						<c:if test="${faq.faq_status eq 1}">
							<span style="color: green;">활성</span>
						</c:if>
						<c:if test="${faq.faq_status eq 0}">
							<span style="color: red;">비활성</span>
						</c:if>
					</td>
					<td><button type="button" onclick="goModi('${faq.seq_tbl_faq}');">수정</button></td>
				</tr>
			</c:when>
			<c:when test="${faq.faq_category eq '2'}">
				<tr>
					<td><input type="checkbox" name="faqchk" value="${faq.seq_tbl_faq}"></td>
					<td>${faq.seq_tbl_faq}</td>
					<td>기능관련</td>
					<td>${faq.faq_title}</td>
					<td>${faq.faq_content}</td>
					<td>${faq.faq_answer}</td>
					<td>	
						<c:if test="${faq.faq_status eq 1}">
							<span style="color: green;">활성</span>
						</c:if>
						<c:if test="${faq.faq_status eq 0}">
							<span style="color: red;">비활성</span>
						</c:if></td>
					<td><button type="button" onclick="goModi('${faq.seq_tbl_faq}');">수정</button></td>
				</tr>
			</c:when>
			<c:when test="${faq.faq_category eq '3'}">
				<tr>
					<td><input type="checkbox" name="faqchk" value="${faq.seq_tbl_faq}"></td>
					<td>${faq.seq_tbl_faq}</td>
					<td>기타사항</td>
					<td>${faq.faq_title}</td>
					<td>${faq.faq_content}</td>
					<td>${faq.faq_answer}</td>
					<td>
						<c:if test="${faq.faq_status eq 1}">
							<span style="color: green;">활성</span>
						</c:if>
						<c:if test="${faq.faq_status eq 0}">
							<span style="color: red;">비활성</span>
						</c:if>
					</td>
					<td><button type="button" onclick="goModi('${faq.seq_tbl_faq}');">수정</button></td>
				</tr>
			</c:when>
			
		</c:choose>
	</c:forEach>
</c:if>

<c:if test="${faqList eq null}">
	<tr>
		<td colspan="8">입력된 FAQ가 없습니다.</td>
	</tr>
</c:if>
</table>
</div>
</form>
<br>
<div class="btns">
<button type="button" onclick="goDel();">선택삭제</button>
<br>
<button type="button" onclick="goAct();">선택활성</button>
</div>
<script type="text/javascript">

	function goDel() {
		var chk = document.getElementsByName("faqchk");
		var size = document.getElementsByName("faqchk").length;
		var chkcnt = 0;
		
		for (var i = 0; i < size; i++) {
			if (chk[i].checked == true) {
				chkcnt++;
			}	
		}
		
		if (chkcnt == 0) {
			swal("삭제할 항목의 체크박스를 선택해 주세요.");
			return;
		}
		
		var frm = document.getElementById("faqFrm");
		
		frm.method = "post";
		frm.action = "faqDeleteEnd.re";
		frm.submit();
	}
	
	function goAct() {
		var chk = document.getElementsByName("faqchk");
		var size = document.getElementsByName("faqchk").length;
		var chkcnt = 0;
		
		for (var i = 0; i < size; i++) {
			if (chk[i].checked == true) {
				chkcnt++;
			}	
		}
		
		if (chkcnt == 0) {
			swal("활성화할 항목의 체크박스를 선택해 주세요.");
			return;
		}
		
		var frm = document.getElementById("faqFrm");
		
		frm.method = "post";
		frm.action = "faqActivateEnd.re";
		frm.submit();
	}
	
	function goModi(seq) {
		
		
		
	}
	document.title = "FAQ 수정 및 삭제"
</script>
</body>
</html>