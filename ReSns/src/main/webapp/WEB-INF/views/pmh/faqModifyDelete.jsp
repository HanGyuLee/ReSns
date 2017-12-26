<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<td><button type="button" onclick="goModi(this);">수정</button></td>
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
					<td><button type="button" onclick="goModi(this);">수정</button></td>
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
					<td><button type="button" onclick="goModi(this);">수정</button></td>
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
<br>
<button type="button" onclick="goBack();">뒤로가기</button>
</div>
<!-- 
<div class="modify" id="modify">
	이거들어가냐
</div>
 -->
<!--  <select name="faq_category">
 	<option value="1">회원관련</option>
 	<option value="2">기능관련</option>
 	<option value="3">기타사항</option>
 </select> -->


<script type="text/javascript">

	window.onload = function() {
		/* document.getElementById("modify").style.display = "none"; */
	}

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
	
	function goBack() {
		location.href = "<%= request.getContextPath() %>/faq.re";
	}
	
	function goModi(element) {
		
		var $this = $(this);
			
		var td = element.parentNode.parentNode.parentNode;
			
		var seq = element.parentNode.parentNode.getElementsByTagName("td")[1].innerText;
		/* element.parentNode.parentNode.getElementsByTagName("td")[1].innerHTML = "<form name='faqFrm' id='faqFrm'>" +
		 										seq + "<input type='hidden' name='seq_tbl_faq' value='"+ seq +"'>"; */
		element.parentNode.parentNode.getElementsByTagName("td")[1].innerHTML = 
											seq + "<input type='hidden' id='seq_tbl_faq' name='seq_tbl_faq' value='"+ seq +"'>";
		
		var text = element.parentNode.parentNode.getElementsByTagName("td")[2].innerText;
		
		var selecter = "<select name='faq_category' id='faq_category'>";
		
		switch (text) {
		case '회원관련' : selecter += "<option value='1' selected>회원관련</option>" +
									  "<option value='2'>기능관련</option>" + 
									  "<option value='3'>기타사항</option> </select>"; break;
		case '기능관련' : selecter += "<option value='1'>회원관련</option>" +
									  "<option value='2' selected>기능관련</option>" +
									  "<option value='3'>기타사항</option> </select>"; break;
		case '기타사항' : selecter += "<option value='1'>회원관련</option>" +
									  "<option value='2'>기능관련</option>" +
									  "<option value='3' selected>기타사항</option> </select>"; break;
		}
		
		element.parentNode.parentNode.getElementsByTagName("td")[2].innerHTML = selecter;
		
		// 제목부분을 input 으로 바꾼다
		text = element.parentNode.parentNode.getElementsByTagName("td")[3].textContent;
		element.parentNode.parentNode.getElementsByTagName("td")[3].innerHTML = "<input type='text' size=15 name='faq_title'" +
																			"id='faq_title'	value='" + text + "'>";		
		
		// 서브제목 부분을 input 으로 바꾼다.
		text = element.parentNode.parentNode.getElementsByTagName("td")[4].textContent;
		element.parentNode.parentNode.getElementsByTagName("td")[4].innerHTML = "<input type='text' size=30 name='faq_content' id='faq_content'" +
																	"value='" + text + "'>";
		
		// 답변 부분을 input 으로 바꾼다.
		text = element.parentNode.parentNode.getElementsByTagName("td")[5].textContent;
		/* element.parentNode.parentNode.getElementsByTagName("td")[5].innerHTML = "<input type='text' size=70 name='faq_answer' value='" +
																															text + "'>" +
																													"</form>"; */
		element.parentNode.parentNode.getElementsByTagName("td")[5].innerHTML = "<input type='text' size=70 name='faq_answer'" +
																	"id='faq_answer' value='" + text + "'>";
									
		var testtext = 
		element.parentNode.parentNode.getElementsByTagName("td")[7].innerHTML = "<button type='button' onclick='goSubmit(this);'>승인</button>";
		
		
	/* 	for (var i = 0; i < 6; i++) {
			if (i >= 1) {
				var string = element.parentNode.parentNode.getElementsByTagName("td")[i].innerText;
				newtd.appendChild(document.createTextNode(string));
			}
		} */
		
		/* td.replaceChild(td.childNode, newtd); */
		
	}
	
	function goSubmit(element) {
		
		var seq = $("#seq_tbl_faq").val();
		var cate = $("#faq_category").val();
		var title = $("#faq_title").val();
		var content = $("#faq_content").val();
		var answer = $("#faq_answer").val();
		
		var form_data = {"seq_tbl_faq" : seq, "faq_category" : cate, "faq_title" : title, "faq_content" : content, "faq_answer" : answer};	
		
		$.ajax({
			url: "/resns/faqModifyEnd.re",
			type: "POST",
			data: form_data,
			dataType: "JSON",
			success: function(data) {
				/* alert(data.seq);
				alert(data.cate);
				alert(data.title);
				alert(data.content);
				alert(data.answer);
				alert(data.status); */
				var cateResult = "";
				if (data.cate == "1") {
					cateResult = "회원관련";
				}
				else if (data.cate == "2") {
					cateResult = "기능관련";
				}
				else if (data.cate == "3") {
					cateResult = "기타사항";
				}
				
				element.parentNode.parentNode.getElementsByTagName("td")[2].innerHTML = cateResult;
				
				element.parentNode.parentNode.getElementsByTagName("td")[3].innerHTML = data.title;
				
				element.parentNode.parentNode.getElementsByTagName("td")[4].innerHTML = data.content;
				
				element.parentNode.parentNode.getElementsByTagName("td")[5].innerHTML = data.answer;
				
				element.parentNode.parentNode.getElementsByTagName("td")[7].innerHTML = "<button type='button' onclick='goModi(this);'>수정</button>";
					
			},
			error: function(request, status) {
				alert("code: "+request.status+"\n"+"message: "+request.responseText);
			}
			
		});// end of ajax
		
		
		/* var frm = document.getElementById("faqFrm");
		
		frm.action = "faqModifyEnd.re";
		frm.method = "POST";
		frm.submit(); */
	}
	
	document.title = "FAQ 수정 및 삭제";
</script>
</body>
</html>