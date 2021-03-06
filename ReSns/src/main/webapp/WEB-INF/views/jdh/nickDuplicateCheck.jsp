<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별명 중복검사</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>


<script type="text/javascript">

   function goNickCheck() {
      
      var login_name = document.getElementById("login_name");
      
      if(!login_name.value || login_name.value.trim()=="" ) {
      // 자바스크립트에서 null 은 false 로 인식한다.
          alert("별명을 입력하세요!!");
          login_name.value = "";
          login_name.focus();
      }
      else {
         var frm = document.frmNickDuplicateCheck;
         frm.method="post";
         frm.action="memberNickDuplicateCheck.re";
         frm.submit();
      }
      
   }// end of goCheck()--------------
   
   
   function setUserNick(login_name) {
      
      var openerfrm = opener.document.registerFrm;
      // opener 는 팝업창을 열게한 부모창을 말한다.
      // 여기서 부모창은 memberRegisterForm.jsp 회원가입 페이지이다.
      openerfrm.login_name.value = login_name;
      
      self.close();
      // 여기서 self 는 팝업창 자기자신을 말한다.
      // 지금의 self 는 idDuplicateCheck.jsp 페이지 이다.i
   }

</script>

</head>
<body style="background-color: #fff0f5;">
<span style="font-size:10pt; font-weight: bold;">${method}</span>

<c:if test="${method == 'GET'}">
<form name="frmNickDuplicateCheck">
   <table style="width: 95%; height: 90%;">
      <tr>
         <td style="text-align: center;">
               별명을 입력하세요<br style="line-height: 200%;"/>
               <input type="text" id=login_name name="login_name" size="20" class="box" /><br style="line-height: 300%;"/>
               <button type="button" class="box" onClick="goNickCheck();">확인</button>
         </td>
      </tr>
   </table>
</form>
</c:if>

<c:if test="${method == 'POST'}">

   <c:if test="${isUseusernick == true}">
      <br style="line-height: 200%"/>
      <br style="line-height: 200%"/>
      <div align="center">
         별명으로 [<span style="color:red; font-weight: bold;">${login_name}</span>]를 사용할 수 있습니다.
         <br/><br/><br/>
         <button type="button" onClick="setUserNick('${login_name}');">닫기</button>
      </div>
   </c:if>
   
   <c:if test="${isUseusernick == false}">
         <br style="line-height: 200%"/>
         <div align="center">
            <span style="color:red; font-weight: bold;">[${login_name}]는 이미 사용중입니다.</span>
         <br/>
         
         <form name="frmIdDuplicateCheck" action="memberNickDuplicateCheck.re" method="post">
             <table style="width: 95%; height: 90%;">
            <tr>
              <td style="text-align: center;">
               별명을 입력하세요<br style="line-height: 200%;"/>
               <input type="text" id="login_name" name="login_name" size="20" class="box" /><br style="line-height: 300%;"/>
               <button type="button" class="box" onClick="goNickCheck();">확인</button>
             </td>
            </tr>
             </table>
            </form>
         </div>
   </c:if>

</c:if>

</body>
</html>