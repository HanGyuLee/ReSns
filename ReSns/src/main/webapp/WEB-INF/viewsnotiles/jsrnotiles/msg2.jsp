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
    
    
    <form name="goback">
    <input type="text" name="gobackURL" value="${gobackURL}">
    <input type="text" name="seq_tbl_q" value="${seq_tbl_q}">
    <input type="text" name="fk_login_id" value="${fk_login_id}">
    </form>