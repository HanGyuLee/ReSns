<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<style type="text/css">

 .bgcol{background-color: lightgray;}

</style>

<script type="text/javascript">
 	$(document).ready(function() {
 		$(".error").hide();
		//$("#user_birth").datepicker();
		
		// 아이디 중복체크
		$("#idcheck").click(function() {
					// 팝업창 띄우기
			window.open("memberIdDuplicateCheck.re", "idcheck","left=500px; top=100px; width=300px; height=200px;");
		});

		// 별명 중복체크
		$("#nickcheck").click(function() {// 팝업창 띄우기
			window.open("memberNickDuplicateCheck.re", "nickcheck","left=500px; top=100px; width=300px; height=200px;");
		});
		
		// 비밀번호 유효성 검사
		 $("#login_pwd").blur(function() {
			
			var pwd = $(this).val();
			var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			// 암호는 숫자/영문자/특수문자/ 포함 형태의  8~15자리 이내만 허락해주는 정규표현식 객체생성
			var bool = pattern.test(pwd);

			if (!bool) {
				
				$(this).parent().parent().next().show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
				$("#goregister").attr("disabled", true);
				$(this).val("");
				$(this).focus();
				} 
			else {
				
				$(".error").hide();
				$(":input").attr("disabled", false).removeClass("bgcol");
				$("#goregister").attr("disabled", false);
			}
		}); // end of $("#passwd").blur()----------------------

		$("#login_pwdchk").blur(function() {
			var pwd = $("#login_pwd").val();
			var pwdcheck = $(this).val();
			if (pwd != pwdcheck) {
				$(this).parent().parent().next().show();
				$(":input").attr("disabled", true).addClass("bgcol");
				$(this).attr("disabled", false).removeClass("bgcol");
				$("#login_pwd").attr("disabled", false).removeClass("bgcol");
				$("#goregister").attr("disabled", true);
				$(this).val("");
				$("#login_pwd").focus();
			} else {
				//$(this).next().hide();
				$(".error").hide();
				$(":input").attr("disabled", false).removeClass("bgcol");
				$("#goregister").attr("disabled", false);
			}
		}); // end of $("#passwdcheck").blur
		
		$(".birthSelect").change(function(){
			
			var birth1 = $("#birth1").val();
			var birth2 = $("#birth2").val();
			var birth3 = $("#birth3").val();
			
			if(parseInt(birth2) < 10) {
				birth2 = "0"+birth2;
			}
			if(parseInt(birth3) < 10) {
				birth3 = "0"+birth3;
			}
			$("#user_birth").val(birth1+birth2+birth3);
		});
		
	}); // end of document ready()-------------
 	
 	
	function doRegister(event) {
		
		var flagBool = false;
		
		$(".required").each(function(){
		
			var data = $(this).val().trim();
			if(data.length == 0) {
				flagBool = true;
				
				return false;
			}
			
		});
		
		if(flagBool) {
			alert("빠짐없이 모두 입력하셔야 합니다.");
			event.preventDefault();
		}
		
		else {
			
		var frm = document.registerFrm;
		
		frm.method = "post";
		frm.action = "reRegisterEnd.re";
		frm.submit();
		}
	};
	
	 document.title = "회원가입"; 
</script>

<style>
	legend {
		text-align: center;
	}
</style>
<body>
<form class="form-horizontal" name="registerFrm" id="registerFrm" encType="multipart/form-data">
	<fieldset>

		<legend><span style="font-size: xx-large; font-style: oblique; font-weight: bold; color: fuchsia;">회원가입</span></legend>

	<div style="margin-left: 250px;">
		<div class="form-group center-block">
			<label class="cols-sm-4 control-label" for="name"></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user fa"aria-hidden="true"></i>아이디</span> 
					<input type="text" class="form-control required" id="login_id" name="login_id" placeholder="사용하실 아이디를 입력하세요." required/>
				</div>
			</div>
			<a class="btn btn-xs btn-warning" id="idcheck"> 
			<span style="color: #4F84C4;"><span class="glyphicon glyphicon-ok-circle"></span> ID 중복체크</span>
			</a> <span class="error">아이디 중복체크부터 해주세요.</span>
		</div>
	

		<div class="form-group">
			<label for="password" class="cols-sm-4 control-label"></label>
			<div class="col-md-4">
				<div class="input-group">
				
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i>비밀번호</span> 
						
					<input id="login_pwd" name="login_pwd"
					type="password" placeholder="영문자,숫자,특수기호를 포함 9글자 이상 입력하세요."
					class="form-control input-md required" required> 
									
				</div>
			</div>
			<span class="error" style="color:red;">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
		</div>


		<div class="form-group">
			<label for="confirm" class="cols-sm-4 control-label"></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i>비밀번호 확인</span> <input id="login_pwdchk"
						name="login_pwdchk" type="password"
						placeholder="비밀번호를 한번 더 입력하세요." class="form-control input-md required"
						required="required" required> <span class="help-block"></span>
				</div>
			</div>
			
			<span class="error" style="color:red;">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
		</div>


		<div>
			성별
			<fieldset style="font-weight: bold;"> 
				성별을 선택하세요 <input type="radio" name="user_gender" id="user_gender"
					value="1" checked="checked" class="required" required><label for="radio-1">남자</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="user_gender" id="user_gender2" value="2" class="required" required><label
					for="radio-2">여자</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="user_gender" id="user_gender3" value="3" class="required" required><label
					for="radio-3">선택안함</label>&nbsp;&nbsp;&nbsp;&nbsp;
			</fieldset> 
		</div>
		



		<div class="form-group">
			<label class="cols-sm-4 control-label" for="email"></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope fa"
						aria-hidden="true"></i>이메일</span> <input id="user_email"
						name="user_email" type="text" placeholder="사용하실 이메일을 입력하세요"
						class="form-control input-md required" required> <span class="help-block"></span>
				</div>
			</div>
		</div>


		<br />
		<div class="form-group">
			<label for="star" class="control-label"></label>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-star"
						aria-hidden="true"></i>별명</span> <input id="login_name" name="login_name"
						type="text" placeholder="사용하실 별명을 입력하세요."
						class="form-control input-md required" required> <span class="help-block"></span>
				</div>
			</div>
			<a class="btn btn-xs btn-warning" id="nickcheck"> <span
				style="color: #4F84C4;"><span
					class="glyphicon glyphicon-ok-circle"></span> 별명 중복체크</span>
			</a> <span class="error">별명 중복체크부터 해주세요.</span>
		</div>




	<div class="form-group">
		<label class="col-md-0 control-label" for="mac"></label>
		<div class="col-md-4">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-th"aria-hidden="true"></i>생년월일</span> 
				<input id="user_birth" name="user_birth" type="text" placeholder="월/일/년도 순으로 입력해주세요."
					class="form-control input-md required" value="19500101" required>
					
					
					<select id="birth2" name="birth2" class="birthSelect">
						<c:forEach begin="1" end="12" step="1" varStatus="status">
							<option value="${status.count}">${status.count}월</option>
						</c:forEach>
					</select>
					
					<select id="birth3" name="birth3" class="birthSelect">
						<c:forEach begin="1" end="31" step="1" varStatus="status">
							<option value="${status.count}">${status.count}일</option>
						</c:forEach>
					</select>
					
					<select id="birth1" name="birth1" class="birthSelect">
						<c:set var="year" value="1950" />
						<c:forEach begin="1950" end="2017" step="1">
							<option value="${year}">${year}년</option>
							<c:set var="year" value="${year+1}" />
						</c:forEach>
					</select>
					
					
					<span class="help-block"></span>
			</div>
		</div>
	</div>



	<div class="form-group">
		<label class="col-md-0 control-label" for="mac"></label>
		<div class="col-md-4">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-upload"
					aria-hidden="true"></i>사진등록</span> <input id="uimg_filename"name="attach" type="file" class="form-control input-md"> <span
					class="help-block"></span>
			</div><span style="color: red;">사진등록은 선택사항입니다.</span>
		</div>
	</div>



	<div class="form-group">
		<label class="col-md-0 control-label" for="simpan"></label>
		<div class="col-md-8">
			<button type="button" id="goregister" name="reregister"class="btn btn-success" onclick="doRegister();">등록</button>
			<button type="button" id="gofail" name="registerfail"class="btn btn-danger">취소</button>
		</div>
	</div>
</div>
	</fieldset>
</form>

</body>