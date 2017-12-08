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
	
    document.title = "회원가입";
    </script>
    
 <form class="form-horizontal" name="registerFrm">
<fieldset>

<!-- Form Name -->
<legend>회원가입</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ip">회원 ID</label>  
  <div class="col-md-4">
  <input id="login_id" name="login_id" type="text" placeholder="아이디를 입력하세요." class="form-control input-md" required="required">
  <span class="help-block"></span>  
  </div>
</div>
&nbsp;<button type="button" id="idchk" >아이디 중복확인</button>

<!-- Text input-->
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

<!-- Text input-->

<h2>성별</h2>
  <fieldset>
    <legend>성별을 선택하세요 </legend>
    <label for="radio-1">남자</label>
    <input type="radio" name="user_gender" id="user_gender" value="1">
    <label for="radio-2">여자</label>
    <input type="radio" name="user_gender" id="user_gender2" value="2">
    <label for="radio-3">선택안함</label>
    <input type="radio" name="user_gender" id="user_gender3" value="3">
  </fieldset>
  
  

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">이메일</label>  
  <div class="col-md-4">
  <input id="user_email" name="user_email" type="text" placeholder="사용하실 이메일을 입력하세요" class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">별명</label>  
  <div class="col-md-4">
  <input id="login_name" name="login_name" type="text" placeholder="사용하실 별명을 입력하세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">생년월일</label>
  <div class="col-md-4">
  <input id="user_birth" name="user_birth" type="text" placeholder="월/일/년도 순으로 입력해주세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">사진등록</label>  
  <div class="col-md-4">
  <input id="uimg_filename" name="uimg_filename" type="file" class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="deskripsi">자기소개</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="user_selfi" name="user_selfi" placeholder="500자 이내로 써주세요."></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="simpan"></label>
  <div class="col-md-8">
    <button type="button" id="goregister" name="reregister" class="btn btn-success" onclick="doRegister();">등록</button>
    <button type="button" id="gofail" name="registerfail" class="btn btn-danger">취소</button>
  </div>
</div>

</fieldset>
</form>
 
    
    
    