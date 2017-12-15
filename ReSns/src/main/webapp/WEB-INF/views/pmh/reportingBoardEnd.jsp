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
	div.btns { margin-left: 600px;
		
	}
		
</style>

</head>
<body>
<br>
	<div class="sub_content">
	    <div class="postscript_area">
	        <ul class="post_con">
	            <li class="post_title">신고가 완료되었습니다.</li>
	            <li class="post_font">접수된 신고는 접수된 날짜 순으로 처리해드리겠습니다. <br />
	              	         허위신고의 경우 제재당할 수 있으므로 주의해주시기 바랍니다. <br>
	              	         버튼을 누르지 않아도 5초 후에 자동으로 메인화면으로 돌아갑니다. <br>
	              	         5초 후에도 돌아가지 않으면 버튼을 눌러 주세요.
	            </li>
	        </ul>
	    </div>
</div>
<br>

<fieldset>

<!-- Form Name -->
<legend>신고 완료</legend>

<!-- Button -->
<div class="btns">
	<span style="font-weight: bold;">돌아가기</span> &nbsp;
    <button id="ViewTimerBtn" class="btn btn-primary" onclick="goBack();">초기화면</button>
    </div>

</fieldset>

<script type="text/javascript">

	function goBack() {
		location.href = "<%= request.getContextPath() %>/index.re";
	}

	var SetTime = 5;		// 최초 설정 시간(기본 : 초)

	function msg_time() {	// 1초씩 카운트
		
		m = (SetTime % 60) + "초";	// 남은 시간 계산
		
		var msg = m + " 후에 메인화면으로 돌아갑니다.";
		
		document.all.ViewTimerBtn.innerHTML = msg;		// div 영역에 보여줌 
				
		SetTime--;					// 1초씩 감소
		
		if (SetTime < 0) {			// 시간이 종료 되었으면..
			
			clearInterval(tid);		// 타이머 해제
			location.href = "<%= request.getContextPath() %>/index.re";
		}
		
	}

	window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
	
	document.title = "신고완료";
</script>
</body>
</html>