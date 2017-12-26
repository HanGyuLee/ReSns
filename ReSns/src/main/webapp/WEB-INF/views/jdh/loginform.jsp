<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>



    <style type="text/css">

	body{
 background: url('http://k30.kn3.net/taringa/3/F/4/1/A/2/TheCrashWTF/B95.jpg');
}
	  
	</style>

<!-- 
.mydiv {display: inline-block; 
	        position: relative; 
	        top: 30px; 
	        line-height: 150%; 
	        border: solid 0px green;
	       } 
	
	.mydisplay {display: block;}
	       	
	.myfont {font-size: 14pt;} -->

<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#btnLOGIN").click(function() {
    		 
    		 var event = event || window.event;
    		 
    		 func_Login(event);
    	 }); // end of $("#btnLOGIN").click();-----------------------
    	 
    	 $("#pwd").keydown(function(event){
  			
  			if(event.keyCode == 13) { // 엔터를 했을 경우
  				func_Login(event);
  			}
    	 }); // end of $("#pwd").keydown();-----------------------	
		
		var method = "${method}";		
		//alert("확인용 : " + method);
		
		if (method == "GET") {
			$("#div_finalResult").hide(); //get 이면 보이지마라
		}
		
		$("#btnFind").click(function(){
			var frm = $("form[name=idFindFrm]").serialize();
			$.ajax({
				url:"idFind.re",
				data:frm,
				type:"post",
				dataType:"JSON",
				success:function(data){
					$("#userid").html(data.userid);
				}, error:function(){
					alert("알 수 없는 오류입니다. 관리자에게 문의하세요.");
				}
			});
		});
		
		if (method == "POST") {
			$("#email").val("${email}");
			$("#nickname").val("${nickname}");
			$("#div_finalResult").show();
		}
		
		$(".myclose").click(function(){
			modalClose();
		});
		
		$(document).on("keydown", function(e){
			if(e.keyCode == 27) {
				modalClose();
			}
		});
	});
     
    function modalClose(){
    	var userid = $("#userid").text();
		$("#id").val(userid);
		$("#pwd").focus();
		
		$("#email").val("");
		$("#nickname").val("");
		$("#userid").html("");
    }
    
    
    function func_Login(event){
    	
    	if(${sessionScope.loginuser != null}) {
			 alert("이미 로그인을 하신 상태 입니다 !!");
			 $("#id").val("");
			 $("#pwd").val("");
			 $("#id").focus();
			 event.preventDefault();
			 return; 
		 }
		 
		 var userid = $("#id").val(); 
		 var pwd = $("#pwd").val(); 
		
		 if(userid.trim()=="") {
		 	 alert("아이디를 입력하세요!!");
			 $("#id").val(""); 
			 $("#id").focus();
			 event.preventDefault();
			 return;
		 }
		
		 if(pwd.trim()=="") {
			 alert("비밀번호를 입력하세요!!");
			 $("#pwd").val(""); 
			 $("#pwd").focus();
			 event.preventDefault();
			 return;
		 }

		 document.loginFrm.action = "/resns/loginEnd.re";
		 document.loginFrm.method = "post";
		 document.loginFrm.submit();
		 
    
    }  // end of function func_Login(event)-----------------------------
    
</script>


<body>
            <div class="container" style="width:130%; height:80%; margin: auto;">
                <div class="row vertical-offset-100">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">                                
                                <div class="row-fluid user-row">
                                    <img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-1/p200x200/21752007_1546637858708136_2911158173821163272_n.png?oh=8fef724e1730308435625632b2803357&oe=5AB88BC5" class="img-responsive" alt="Conxole Admin" style="margin-left: 170px;"/>
                                </div>
                            </div>
                            <div class="panel-body">
                            
                                <form accept-charset="UTF-8" role="form" class="form-signin" name="loginFrm">
                                    <fieldset>
                                        <label class="panel-login">
                                            <div class="login_result"></div>
                                        </label>
                                        <input class="form-control" placeholder="아이디를 입력하세요" type="text" name="id" id="id"><br/>
                                        <input class="form-control" placeholder="비밀번호를 입력하세요" type="password" name="pwd" id="pwd">
                                        <br></br>
                                        <input class="btn btn-lg btn-success btn-block" type="button" id="btnLOGIN" value="로그인 »">
                                    </fieldset>
                                </form>&nbsp;&nbsp;&nbsp;
                                
    &nbsp;&nbsp;<br/><br/><a data-toggle="modal" data-target="#idFindFrm" data-dismiss="modal" class="btn btn-warning" style="font-weight: bold; color: black;" >아이디찾기</a> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" class="btn btn-info" style="font-weight: bold; color: black;">비밀번호찾기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary" type="button" id="reregister" style="font-weight: bold; color: black;" href="<%= request.getContextPath() %>/reRegister.re">회원가입</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
		
		<!-- <div style="width:90%; margin: auto; border: solid 0px red;">

	<div style="width:80%; margin-top:10%; margin-left:10%; height:300px; border: solid 0px blue;">
		<h2 class="text-primary">로그인</h2>
		<p class="bg-primary">&nbsp;</p>
		
		<form name="loginFrm">
			<div class="mydiv" style="margin-left: 15%;">
				<span class="mydisplay myfont" >아이디 :</span>
				<span class="mydisplay myfont" style="margin-top: 30px;">암&nbsp;&nbsp;&nbsp;호 :</span> 
			</div>
			
			<div class="mydiv" style="margin-left: 5%;">
				<input class="mydisplay form-control" type="text" name="id" id="id" size="20" />
				<input class="mydisplay form-control" style="margin-top: 15px;" type="password" name="pwd" id="pwd" size="20" /> 
			</div>
			
			<div class="mydiv" style="margin-left: 10%;">
				<button class="btn btn-success" style="width: 100px; font-size: 14pt;" type="button" id="btnLOGIN" >확인</button>
				
			</div>	
		
		</form> -->
		
		
		<!-- <form name="findFrm">
		
		<div class="mydiv" style="margin-left: 20%;">
			<button type="button" id="btnIdFind">아이디 찾기</button> 
		</div> 
		
		<div class="mydiv" style="margin-left: 20%;">
			<button type="button" id="btnPwdFind">비밀번호 찾기</button> 
		</div>
		
		</form> -->
		
		
	<div class="modal fade" id="idFindFrm" role="dialog">
	<div class="modal-dialog">
	
		<%-- Modal content --%>
      <div class="modal-content" align="center">
        <div class="modal-header">
          <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이디 찾기</h4>
        </div>
          <div class="modal-body" style="width: 100%; height: 300px;">
          	<div id="idFind">
          		<%-- <iframe style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath() %>/idFind.re"></iframe> --%>
          	
          	<form name="idFindFrm">

				<div id="div_name" align="center">
					<span style="color: blue; font-size: 12pt; font-weight: bold;">이메일</span><br/>
					<input type="text" id="email" name="email" size="15" placeholder="email을 입력하세요." required />
				</div><br/>
				
				<div id="div_mobile" align="center">
					<span style="color: blue; font-size: 12pt; font-weight: bold;">별명</span><br/>
					<input type="text" id="nickname" name="nickname" size="15" placeholder="별명을 입력하세요." required />
				</div>
				
				<div id="div_finalResult" align="center">
					ID : <span style="color: red; font-size: 16pt; font-weight: bold;" id="userid"></span>
				</div>
				
				<div id="div_btnFind" align="center">
					<button type="button" class="btn btn-primary" id="btnFind">찾기</button>
				</div>
				<br/><br/>
				
				<div class="modal-footer">
				<span style="margin-right: 40pt;">회원가입을 하시겠습니까?</span><a href="<%= request.getContextPath() %>/reRegister.re" class="btn btn-primary">회원가입</a>
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">닫기</button>
        		</div>
				
			</form>
			

			
          	</div>
          	
        </div>
          
      </div>
		
	</div>
</div>

			<%-- 비밀번호 찾기 Modal --%>
<div class="modal fade" id="passwdFind" role="dialog">
	<div class="modal-dialog">
	
	<%-- Modal content --%>
      <div class="modal-content" align="center">
        <div class="modal-header">
          <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 찾기</h4>
        </div>
          <div class="modal-body" style="width: 100%; height: 400px;">
          	<div id="idFind">
          		 <iframe style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath() %>/pwdFind.re"></iframe>
          	</div>
        </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
        </div>
      </div>
	
	</div>
</div>
		
	</div>
	
</div>