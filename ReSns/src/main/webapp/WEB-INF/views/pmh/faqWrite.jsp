<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<title>FAQ 질답 입력</title>
<style type="text/css">
	legend { text-align: center;
	}
</style>
</head>
<body>
<br>

<form class="form-horizontal" id="faqFrm" method="post" action="faqWriteEnd.re">
<fieldset>

<!-- Form Name -->
<legend>FAQ 입력하기</legend>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="radios">카테고리</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="radios-0">
      <input name="faq_category" id="radios-0" value="1" checked="checked" type="radio">
      회원관련
    </label> 
    <label class="radio-inline" for="radios-1">
      <input name="faq_category" id="radios-1" value="2" type="radio">
      기능관련
    </label> 
    <label class="radio-inline" for="radios-2">
      <input name="faq_category" id="radios-2" value="3" type="radio">
      기타
    </label>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="faq_title">FAQ 제목</label>  
  <div class="col-md-4">
  <input id="faq_title" name="faq_title" placeholder="" class="form-control input-md" required type="text">
  <span class="help-block">FAQ의 제목부분</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="faq_content">FAQ 질문</label>  
  <div class="col-md-4">
  <input id="faq_content" name="faq_content" placeholder="" class="form-control input-md" required type="text">
  <span class="help-block">FAQ의 질문 내용</span>  
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="faq_answer">FAQ 답변</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="faq_answer" name="faq_answer"></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submitBtn">입력확인</label>
  <div class="col-md-8">
    <button type="button" id="submitBtn" name="submitBtn" class="btn btn-success" onclick="goWrite();">입력</button>
    <button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-danger" style="margin-left: 100px;" onclick="goBack();">취소</button>
  </div>
</div>

</fieldset>
</form>



<script type="text/javascript">

	function goWrite() {
		var frm = document.getElementById("faqFrm");
		
		frm.submit();
	}

	function goBack() {
		$("input[type=text]").prop("required", false);
		location.href = "<%= request.getContextPath() %>/faq.re";
	}

	document.title = "FAQ 질답 입력";
</script>
</body>
</html>