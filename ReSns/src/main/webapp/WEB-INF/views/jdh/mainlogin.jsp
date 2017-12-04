<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">


function gologin(){
	location.href="login.re";
}



</script>

<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Form Name</legend>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="login">로그인</label>
  <div class="col-md-4">
    <button type="button" id="login" name="login" class="btn btn-primary" onclick="gologin();">Button</button>
  </div>
</div>

</fieldset>
</form>

