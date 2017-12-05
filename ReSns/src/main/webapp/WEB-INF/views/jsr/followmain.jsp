<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">

<title>resns</title>

<style type="text/css">
.container{
width: 600px;
}

.notice {
    padding: 15px;
    background-color: #fafafa;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;
    -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
       -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
            box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
}

.notice-success {
    border-color: #7f7f84;
}
.notice-success>strong {
    color: #7f7f84;
}

.readMore{
    cursor:pointer;
}
	    
</style>


<script type="text/javascript">

$(document).ready(function(){
//alert("df");



 });
 
 

 
/* function goRe(seq){
alert("확인::"+seq);
};
  */

  function goVeiwRe(statuscount){
		var statuscount = statuscount;
	  //alert("넘어오는 id값::"+statuscount);
	VeiwRe(statuscount);
		
	}
  

	function VeiwRe(statuscount){
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()}
		//alert("글 시퀀스::"+form_data.seq_tbl_board);
	
		
		$.ajax({
			url: "<%= request.getContextPath()%>/followmainre.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
				var resultHTML = "";
				
				if(data.length > 0) { // 검색된 데이터가 있는 경우라면
					
				
					$.each(data, function(entryIndex, entry){
						var re_seq = entry.re_seq;
						var re_name = entry.login_name;
						var re_content = entry.re_content;
						var re= "";

					    re += "<span style='font-weight: bold;'>"+re_name+"</span>&nbsp;&nbsp;&nbsp;";
					    re += re_content+"<br/>"
					 
					    
						resultHTML += re;	

					    
					    
					});
					//alert("확인"+"#display"+statuscount);
					$("#display"+statuscount).html(resultHTML);
					/* $("#display"+statuscount).show(); */
				}
				else {
				//alert("검색데이터 없음");
				resultHTML += "댓글이 없습니다."
				$("#display"+statuscount).html(resultHTML);
				/* $("#display"+statuscount).show(); */
				} // end of if ~ else ----------------
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------


		
	}//end of function VeiwRe(statuscount)


</script>


</head>
<body>
<div style="padding-left: 10%;">
<c:forEach var="vo" items="${followBoard}" varStatus="status">
<table style="width: 800px; border: solid 0px red; background-color: #EAE7E7;" >
  
    <tr>
		<td width="30px" height="50px">&nbsp;</td>
        <td colspan ="2" width="740px" height="50px"><img width="20px" style="padding-right: 70px;" src="<%= request.getContextPath() %>/resources/images/${vo.follow_proile_image}"/>${vo.follow_name}</td>
        <td width="30px" height="50px">&nbsp;</td>
    </tr>
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    <tr>
        <td width="30px" height="500px">&nbsp;</td>
        <td width="740px" colspan="2" height="500px" style="text-align: center;"><img width="500px"  height="500px" src ="<%= request.getContextPath() %>/resources/images/${vo.bimg_filename}"/></td>
        <td width="30px" height="500px">&nbsp;</td>
    </tr>
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    <tr>
     	<td width="30px" height="40px">&nbsp;</td>
        <td width="320px" height="40px">하트~~개</td>
        <td width="320px" height="40px" style="text-align: right;">하트 찍기, 신고하기</td>
        <td width="30px" height="40px">&nbsp;</td>
    </tr>
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    <tr>
    	<td width="30px" height="30px">&nbsp;</td>
        <td width="740px" height="30px"  colspan="2">위치:${vo.map_name}</td>
        <td width="30px" height="30px">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="4">&nbsp;</td>
    </tr>
    <tr> 
        <td width="30px" >&nbsp;</td>
        <td width="740px" colspan="2">${vo.board_content}</td>
        <td width="30px" >&nbsp;</td>
    </tr>
   
      <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
   
<%-- 
    <tr>
        <td width="30px">&nbsp;</td>
          <td width="740px" colspan="2" class="readMore"><a onClick="goVeiwRe('${status.count}');">댓글 모두 보기</a><input type="hidden" id="seq_tbl_board${status.count}" value="${vo.seq_tbl_board}"></td>
        <td width="30px">&nbsp;</td>
   
    </tr> --%>
    
     <tr>
     <td width="30px">&nbsp;</td>
     <td colspan="2" width="740px">


	<div class="container">
	<div class="notice notice-success">
	<strong>댓글 ${vo.board_recnt}개</strong>&nbsp;&nbsp;<span class="readMore" onClick="goVeiwRe('${status.count}');">모두 읽기</span><input type="hidden" id="seq_tbl_board${status.count}" value="${vo.seq_tbl_board}">
	<div id="display${status.count}" class="desc">
	</div>
	</div>

	</div>

	
	</td>
	
	
     <td width="30px">&nbsp;</td>
   	 </tr>

   	
    <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    <tr>
        <td width="30px">&nbsp;</td>
        <td width="740px" colspan="2"><input type="text"/><button type="button" class="rebutton">댓글쓰기</button></td>
        <td width="30px">&nbsp;</td>
    </tr>

</table>
<br/>
<br/>

</c:forEach>


</div>


<%-- 
<c:forEach var="vo" items="${followBoard}">
${vo.follow_name}<br/>
${vo.follow_proile_image}<br/>
${vo.follow_id}<br/>
${vo.seq_tbl_board}<br/>
${vo.board_content}<br/>
${vo.board_time}<br/>
${vo.board_heart}<br/>
${vo.board_recnt}<br/>
${vo.board_status}<br/>
${vo.bimg_filename}<br/>
${vo.bimg_orgfilename}<br/>
${vo.bimg_filesize}<br/>
${vo.map_we}<br/>
${vo.ma_ky}<br/>
${vo.map_name}<br/>
</c:forEach>
 --%>
</body>
</html>