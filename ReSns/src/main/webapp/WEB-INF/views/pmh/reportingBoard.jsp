<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
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

	div.sub_content { margin-left: 600px;}
	legend { text-align: center;
			margin-bottom: 10px auto;
	}
		
</style>

</head>
<body>
<br>
	<div class="sub_content">
	    <div class="postscript_area">
	        <ul class="post_con">
	            <li class="post_title">게시글을 신고하는 페이지입니다.</li>
	            <li class="post_font">접수된 신고는 접수된 날짜 순으로 처리해드리겠습니다. <br />
	              	         허위신고의 경우 제재당할 수 있으므로 주의해주시기 바랍니다.
	            </li>
	        </ul>
	    </div>
</div>
<br>
<form class="form-horizontal" id="submitFrm" method="post" action="reportingBoardHandler.re">
<fieldset>

<!-- Form Name -->
<legend>신고하기</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_content">피신고자</label>  
  <div class="col-md-4">
  <input id="fk_login_id" name="fk_login_id" placeholder="" class="form-control input-md" value="${fk_login_id}" type="text" readonly>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_content">피신고게시글 번호</label>  
  <div class="col-md-4">
  <input id="fk_seq_tbl_board" name="fk_seq_tbl_board" placeholder="" class="form-control input-md" value="${seq_tbl_board}" type="text" readonly>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_content">신고자</label>  
  <div class="col-md-4">
  <input id="report_user" name="report_user" placeholder="" class="form-control input-md" value="${loginUser.login_id}" type="text" readonly>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ask_content">신고내용</label>  
  <div class="col-md-4">
  <input id="report_content" name="report_content" placeholder="" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="report_cate">신고사유</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="report_cate-0">
      <input name="report_cate" id="report_cate-0" value="1" checked="checked" type="radio">
      타인비방
    </label> 
    <label class="radio-inline" for="report_cate-1">
      <input name="report_cate" id="report_cate-1" value="2" type="radio">
      유해성 게시물
    </label> 
    <label class="radio-inline" for="report_cate-2">
      <input name="report_cate" id="report_cate-2" value="3" type="radio">
      스팸광고
    </label> 
    <label class="radio-inline" for="report_cate-3">
      <input name="report_cate" id="report_cate-3" value="4" type="radio">
      기타
    </label>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submitBtn">입력</label>
  <div class="col-md-8">
    <button id="submitBtn" name="submitBtn" class="btn btn-success" onclick="goSubmit();">입력</button>
    <button id="cancelBtn" name="cancelBtn" class="btn btn-danger"  onclick="goBack();" style="margin-left: 150px;">취소</button>
  </div>
</div>

</fieldset>
</form>



<script type="text/javascript">

	function goSubmit() {
		
		var frm = document.getElementById("submitFrm");
		frm.submit();
	}
	
	function goBack() {
		location.href = "<%= request.getContextPath() %>/index.re";
	}

	document.title = "신고하기";
</script>
</body>
</html>