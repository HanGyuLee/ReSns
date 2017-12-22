<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-2.0.0.js"></script> --%> 
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Animations</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    
    
    <style type="text/css">
    
    #playground-container {
    height: 500px;
    overflow: hidden !important;
    -webkit-overflow-scrolling: touch;
}
body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background:url(https://i.ytimg.com/vi/4kfXjatgeEU/maxresdefault.jpg);
 	font-family: 'Oxygen', sans-serif;
	    background-size: cover;
}

.main{
 	margin:50px 15px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}
.form-control {
    height: auto!important;
padding: 8px 12px !important;
}
.input-group {
    -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
}
#button {
    border: 1px solid #ccc;
    margin-top: 28px;
    padding: 6px 12px;
    color: #666;
    text-shadow: 0 1px #fff;
    cursor: pointer;
    -moz-border-radius: 3px 3px;
    -webkit-border-radius: 3px 3px;
    border-radius: 3px 3px;
    -moz-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    -webkit-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    box-shadow: 0 1px #fff inset, 0 1px #ddd;
    background: #f5f5f5;
    background: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #eeeeee));
    background: -webkit-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -o-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -ms-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5', endColorstr='#eeeeee', GradientType=0);
}
.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 400px;
    padding: 10px 40px;
	background:#009edf;
	    color: #FFF;
    text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
-moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);

}
span.input-group-addon i {
    color: #009edf;
    font-size: 17px;
}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
    
    </style>
    
    
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$( "#user_birth" ).datepicker();
   
    });
    
    function doRegister(){
    	
	    var frm = document.registerFrm;
	    
	    frm.action = "reRegisterEnd.re";
	    frm.method = "post";
	    frm.submit();
    
    }
    
    // 아이디 중복체크
    $("#idcheck").click(function() {
        // 팝업창 띄우기
        window.open("memberIdDuplicateCheck.re", "idcheck", "left=500px; top=100px; width=300px; height=200px;");
     });
	
    // 별명 중복체크
    $("#nickcheck").click(function() {
        // 팝업창 띄우기
        window.open("memberNickDuplicateCheck.re", "nickcheck", "left=500px; top=100px; width=300px; height=200px;");
     });
    
    
    document.title = "회원가입";
    </script>
    
 <form class="form-horizontal" name="registerFrm" encType="multipart/form-data">
<fieldset>


<legend>회원가입</legend>

<!-- 
<div class="form-group">
  <label class="col-md-4 control-label" for="ip">회원 ID</label>   
  <div class="col-md-4">    
  <input id="login_id" name="login_id" type="text" placeholder="아이디를 입력하세요." class="form-control input-md" required="required">
  <span class="help-block"></span>
   
  </div>
</div> -->

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">아이디</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" id="login_id" name="login_id" required="required"  placeholder="사용하실 아이디를 입력하세요."/>
								</div>
							</div>
						</div>


	 <a class="btn btn-xs btn-warning" id="idcheck">
      <span style="color: #4F84C4;"><span class="glyphicon glyphicon-ok-circle"></span> ID 중복체크</span>
     </a>
       <span class="error">아이디는 필수입력 사항입니다.</span>



<div class="form-group">
  <label class="col-md-4 control-label" for="netmask">비밀번호</label>  
  <div class="col-md-4">
  <input id="login_pwd" name="login_pwd" type="password" placeholder="영문자,숫자,특수기호를 포함 9글자 이상 입력하세요." class="form-control input-md" required="required">
  <span class="help-block"></span>  
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="netmask">비밀번호 확인</label>  
  <div class="col-md-4">
  <input id="login_pwdchk" name="login_pwdchk" type="password" placeholder="비밀번호를 한번 더 입력하세요." class="form-control input-md" required="required">
  <span class="help-block"></span>  
  </div>
</div>


<div>
<th>성별</th>
  <fieldset style="font-weight: bold;">
    <td>성별을 선택하세요 </td>
    <label for="radio-1">남자</label>
    <input type="radio" name="user_gender" id="user_gender" value="1" checked="checked">&nbsp;&nbsp;
    <label for="radio-2">여자</label>
    <input type="radio" name="user_gender" id="user_gender2" value="2">&nbsp;&nbsp;
    <label for="radio-3">선택안함</label>
    <input type="radio" name="user_gender" id="user_gender3" value="3">&nbsp;&nbsp;
  </fieldset>
  </div>
  <br/>
  


<div class="form-group">
  <label class="col-md-4 control-label" for="mac">이메일</label>  
  <div class="col-md-4">
  <input id="user_email" name="user_email" type="text" placeholder="사용하실 이메일을 입력하세요" class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="mac">별명</label>  
  <div class="col-md-4">
  <input id="login_name" name="login_name" type="text" placeholder="사용하실 별명을 입력하세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>

<a class="btn btn-xs btn-warning" id="nickcheck">
      <span style="color: #4F84C4;"><span class="glyphicon glyphicon-ok-circle"></span> 별명 중복체크</span>
     </a>
       <span class="error">별명은 필수입력 사항입니다.</span>


<div class="form-group">
  <label class="col-md-4 control-label" for="mac">생년월일</label>
  <div class="col-md-4">
  <input id="user_birth" name="user_birth" type="text" placeholder="월/일/년도 순으로 입력해주세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="mac">사진등록</label>  
  <div class="col-md-4">
  <input id="uimg_filename" name="attach" type="file" class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>




<!-- <div class="form-group">
  <label class="col-md-4 control-label" for="deskripsi">자기소개</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="user_selfi" name="user_selfi" placeholder="500자 이내로 써주세요."></textarea>
  </div>
</div> -->


<div class="form-group">
  <label class="col-md-4 control-label" for="simpan"></label>
  <div class="col-md-8">
    <button type="button" id="goregister" name="reregister" class="btn btn-success" onclick="doRegister();">등록</button>
    <button type="button" id="gofail" name="registerfail" class="btn btn-danger">취소</button>
  </div>
</div>

</fieldset>
</form>
 
    
    <!-- <div class="container">
			<div class="row main" >
				<div class="main-login main-center">
				<h5>회원가입</h5>
					<form class="" method="post" action="#">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">아이디</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="사용하실 아이디를 입력하세요."/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">이메일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="이용중인 이메일을 입력하세요."/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">별명</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="username"  placeholder="사용하실 별명을 입력하세요."/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">비밀번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호는 영문자,숫자,특수기호를 포함한 8자 이상 12자 이하로 입력해주세요."/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한번 더 입력해주세요."/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">생년월일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한번 더 입력해주세요."/>
								</div>
							</div>
						</div>
						
						<th>성별</th>
  <fieldset>
    <td>성별을 선택하세요 </td>
    <label for="radio-1">남자</label>
    <input type="radio" name="user_gender" id="user_gender" value="1" checked="checked">
    <label for="radio-2">여자</label>
    <input type="radio" name="user_gender" id="user_gender2" value="2">
    <label for="radio-3">선택안함</label>
    <input type="radio" name="user_gender" id="user_gender3" value="3">
  </fieldset>
						
						
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">날짜</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한번 더 입력해주세요."/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">사진 등록</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한번 더 입력해주세요."/>
								</div>
							</div>
						</div>

						<div class="form-group">
					  <label class="col-md-4 control-label" for="simpan"></label>
					  <div class="col-md-8">
					    <button type="button" id="goregister" name="reregister" class="btn btn-success" onclick="doRegister();">등록</button>
					    <button type="button" id="gofail" name="registerfail" class="btn btn-danger">취소</button>
					  </div>
					</div>
						
					</form>
				</div>
			</div>
		</div> -->
    
    