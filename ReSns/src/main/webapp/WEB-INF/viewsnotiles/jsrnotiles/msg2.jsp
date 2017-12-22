<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>

    <script type="text/javascript">
    $(document).ready(function(){
 
    if(${msg != ""}){
    	 alert("${msg}"); 	
    } 
    
    //location.href="${loc}";

	//alert("테스트");
     gogo();
	 }); 
    
     function gogo() {
        
    	//alert("dd");
    	var frm = document.goback;
  
        frm.method = "get";
        frm.action = "${loc}";
        frm.submit();
    	
    } 
    </script>
   
    <div align="center">
    <img src="<%=request.getContextPath() %>/resources/images/loop_black.png"/>
    	<br/>로딩중...
    </div>
    
    <form name="goback">
    <input type="hidden" name="gobackURL" value="${gobackURL}">
    <input type="hidden" name="seq_tbl_q" value="${seq_tbl_q}">
    <input type="hidden" name="fk_login_id" value="${fk_login_id}">
    <input type="hidden" name="totalcount" value="${totalcount}">
    </form>