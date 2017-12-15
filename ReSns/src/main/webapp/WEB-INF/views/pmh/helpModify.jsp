<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 글쓰기 페이지</title>
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
<style type="text/css">
	div.intro {
		align: center;
		width: 30%;
		text-align: left;
		margin-left: 600px;
	}
	legend { text-align: center;
			margin-bottom: 10px auto;
	}
	div.thumb{ margin-left: 34%; }
	
</style>
</head>
<body>

<div align="center"><h1>문의하기</h1></div>


<div class="sub_title_info">
	    <h3 style="margin-left: 35px;">문의게시판</h3>
	</div>
	<!-- sub content s -->
	<div class="sub_content">
	    <div class="postscript_area">
	        <ul class="post_con">
	            <li class="post_title">ReSNS 관련 문의 및 요청사항을 작성하는 게시판입니다.</li>
	            <li class="post_font">글을 남겨주시면 빠른 시일내에 답변해드리겠습니다. 여러분의 소중한 의견을 기다립니다.<br />
	                <br />
	                해당 게시판의 게시물은 사이트를 방문하는 모든 방문자가 확인할 수 있으므로 문의 및 요청사항 작성시 개인 정보가 포함되지 않도록 주의
	        바랍니다.<br />
	                <br />
	                게시판의 효과적인 운영을 위하여 비방, 욕설, 음란한 표현, 상업적인 광고, 동일한 내용 반복게시, 특정인의 개인정보 유출 등 홈페이지의
	        정상적인 운영을 저해하는 내용은 게시자에게 통보하지 않고 삭제될 수 있음을 알려드립니다.
	            </li>
	        </ul>
	
	    </div>
</div>

<br>
<br>

<form class="form-horizontal" enctype="multipart/form-data" id="writeFrm">
<fieldset>

<!-- Form Name -->
<legend>문의 작성하기</legend>

<!-- Select Basic -->

<div class="form-group">
  <label class="col-md-4 control-label" for="ask_cate">카테고리</label>
  <input type="hidden" id="selectCate" value="${avo.ask_cate}">
  <div class="col-md-4">
    <select id="ask_cate" name="ask_cate" class="form-control">
      <option value="1">회원정보</option>
	  <option value="2">이용관련</option>
	  <option value="3">버그문의</option>
	  <option value="4">기타</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fk_login_id">작성자</label>  
  <div class="col-md-4">
  <input id="fk_login_id" name="fk_login_id" type="text" placeholder="" class="form-control input-md" value="${avo.fk_login_id}" required="required" readonly>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_title">제목</label>  
  <div class="col-md-4">
  <input id="ask_title" name="ask_title" type="text" placeholder="" class="form-control input-md" value="${avo.ask_title}" required="required">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_content">문의내용</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="ask_content" name="ask_content">${avo.ask_content}</textarea>
  </div>
</div>

<div class="thumb">
<c:if test="${aivo.aimg_thumb ne null}">
	<img src="<%= request.getContextPath() %>/resources/files/${aivo.aimg_thumb}" alt="현재 업로드된 사진" title="현재 업로드된 사진"><br>
</c:if>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="aimg_category">파일첨부</label>
  <div class="col-md-4">
    <input id="aimg_category" name="file" class="input-file" type="file"> 파일 업로드를 다시 하시면 기존의 파일은 삭제됩니다.
    <c:if test="${aivo.aimg_thumb ne null}">
    	<br>
   	 		<input id="aimg_deleteCheck" name="aimg_deleteCheck" type="checkbox" > 체크하시면 업로드된 파일을 삭제합니다.
   	 		<input type="hidden" name="aimg_delete" id="aimg_delete" >
   </c:if>
  </div>
</div>



<!-- Multiple Checkboxes (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_status">비밀글</label>
  <div class="col-md-4">
    <label class="checkbox-inline" for="ask_status">
      <input type="checkbox" name="ask_statusCheck" id="ask_statusCheck" value="1">
      <input type="hidden" name="ask_secret" id="ask_secret" >
      &nbsp;체크하시면 비밀글로 저장됩니다.
    </label>
  </div>
</div>

	<input type="hidden" name="seq" value="${avo.seq_tbl_ask}" />
	<input type="hidden" name="groupno" value="${avo.ask_groupno}" />
	<input type="hidden" name="fk_seq" value="${avo.ask_fk_seq}" />
	<input type="hidden" name="depthno" value="${avo.ask_depthno}" />

<div align="center" class="buttons">
		<button type="button" id="listBtn" style="margin-right: 100px;" onclick="goList();">목록</button>
	
		<button type="button" id="writeBtn" onclick="goWrite();">작성</button>

		<button type="button" style="margin-left: 100px;" onclick="goReset(this.form);">비우기</button>
</div>

</fieldset>
</form>




<script type="text/javascript">

	window.onload = function(){
		selectCate();
	}

	function selectCate() {
		var cate = document.getElementById("selectCate").value;
		
		document.getElementById("ask_cate").options[cate-1].selected = true;
	}

	function goList() {
		location.href = "help.re";
	}
	
	function goWrite() {
		
		var checkedStatus = document.getElementById("ask_statusCheck").checked;
				
		if (checkedStatus) {
			document.getElementById("ask_secret").value = 0;
		}
		else {
			document.getElementById("ask_secret").value = 1;
		}
		 
		
		var checkedImage = document.getElementById("aimg_deleteCheck");
		
		if (checkedImage != null) {
			if (checkedImage.checked) {
				document.getElementById("aimg_delete").value = 0;
			}
			else {
				document.getElementById("aimg_delete").value = 1;
			}
		}
		
			
		var frm = document.getElementById("writeFrm");
		
		frm.method = "post";
		frm.action = "<%= request.getContextPath() %>/helpModifyEnd.re";
		frm.submit();
	}
	
	function goReset(frm) {
		$('[type=text], select, textarea', frm).val('');
		$('[type=checkbox]:checked', frm).prop('checked', false);
		document.getElementById("fk_login_id").value = "${avo.fk_login_id}";
	}

	document.title ="문의게시판 글쓰기 페이지";
	
</script>
</body>
</html>