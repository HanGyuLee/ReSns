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
    	$( "#birth" ).datepicker();
   
    });

    </script>
    
 <form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>회원가입</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ip">회원 ID</label>  
  <div class="col-md-4">
  <input id="id" name="id" type="text" placeholder="아이디를 입력하세요." class="form-control input-md" required="">
  <span class="help-block"></span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="netmask">비밀번호</label>  
  <div class="col-md-4">
  <input id="regpwd" name="regpwd" type="text" placeholder="비밀번호를 입력하세요." class="form-control input-md" required="">
  <span class="help-block"></span>  
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="netmask">비밀번호 확인</label>  
  <div class="col-md-4">
  <input id="chkpwd" name="chkpwd" type="text" placeholder="비밀번호를 한번 더 입력하세요." class="form-control input-md" required="">
  <span class="help-block"></span>  
  </div>
</div>

<!-- Text input-->

<h2>성별</h2>
  <fieldset>
    <legend>성별을 선택하세요 </legend>
    <label for="radio-1">남자</label>
    <input type="radio" name="radio-1" id="radio-1">
    <label for="radio-2">여자</label>
    <input type="radio" name="radio-1" id="radio-2">
    <label for="radio-3">선택안함</label>
    <input type="radio" name="radio-1" id="radio-3">
  </fieldset>
  

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">이메일</label>  
  <div class="col-md-4">
  <input id="mac" name="mac" type="text" placeholder="사용하실 이메일을 입력하세요" class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">별명</label>  
  <div class="col-md-4">
  <input id="mac" name="mac" type="text" placeholder="사용하실 별명을 입력하세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mac">생년월일</label>  
  <div class="col-md-4">
  <input id="birth" name="birth" type="text" placeholder="생년월일을 선택하세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>


<!-- Text input-->
<div class="form-group" id="profile">
  <label class="col-md-4 control-label" for="mac">사진등록</label>  
  <div class="col-md-4">
  <input id="profile" name="profile"  placeholder="사용하실 사진을 선택하세요." class="form-control input-md">
  <span class="help-block"></span>  
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="deskripsi">자기소개</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="deskripsi" name="deskripsi" placeholder="500자 이내로 써주세요."></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="simpan"></label>
  <div class="col-md-8">
    <button type="button" id="goregister" name="reregister" class="btn btn-success">등록</button>
    <button type="button" id="gofail" name="registerfail" class="btn btn-danger">취소</button>
  </div>
</div>

</fieldset>
</form>
 
    
    
    