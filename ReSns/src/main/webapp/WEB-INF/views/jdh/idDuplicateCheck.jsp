<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검사</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css"> 
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script> 
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
 

<script type="text/javascript">

   function goCheck() {
      
      var userid = document.getElementById("userid");
      
      if(!userid.value || userid.value.trim()=="" ) {
      // 자바스크립트에서 null 은 false 로 인식한다.   
          alert("아이디를 입력하세요!!");
          userid.value = "";
          userid.focus();
      }
      else {
         var frm = document.frmIdDuplicateCheck; 
         frm.method="post";
         frm.action="memberIdDuplicateCheck.re";
         frm.submit();   
      }
      
   }// end of goCheck()--------------
   
   
   function setUserID(userid) {
	   self.close();
   }
 /*  $(document).ready(function(){
	 dldl();
  }); */
  


</script>

</head>
<body style="background-color: #fff0f5;">
<span style="font-size:10pt; font-weight: bold;">${method}</span>   

<c:if test="${method == 'GET'}">
<form name="frmIdDuplicateCheck">
   <table style="width: 95%; height: 90%;">
      <tr>
         <td style="text-align: center;">
               아이디를 입력하세요<br style="line-height: 200%;"/>
               <input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
               <button type="button" class="box" onClick="goCheck();">확인</button>
         </td>
      </tr>
   </table>
</form>
</c:if>

<c:if test="${method == 'POST'}">

   <!-- <form name="registerFrm">
   	<input type="hidden" name="userid" id="userid">
   </form> -->
   
   <c:if test="${isUseuserid == false}">
         <br style="line-height: 200%"/>   
         <div align="center">
            <span style="color:red; font-weight: bold;">[${userid}]는 이미 사용중입니다.</span>
         <br/>
         
         <form name="frmIdDuplicateCheck" action="memberIdDuplicateCheck.re" method="post">
             <table style="width: 95%; height: 90%;">
            <tr>
              <td style="text-align: center;">
               아이디를 입력하세요<br style="line-height: 200%;"/>
               <input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
               <button type="button" class="box" onClick="goCheck();">확인</button>
             </td>
            </tr>
             </table>
            </form>
         </div>
   </c:if>
   
   <c:if test="${isUseuserid == true}">
      <br style="line-height: 200%"/>
      <br style="line-height: 200%"/>   
      <div align="center">
         ID로 [<span style="color:red; font-weight: bold;">${userid}</span>]를 사용할 수 있습니다.
         <br/><br/><br/>
         <button type="button" onClick="setUserID('${userid}')">닫기</button>
      </div>
   </c:if>
   

</c:if>

</body>
</html>
    