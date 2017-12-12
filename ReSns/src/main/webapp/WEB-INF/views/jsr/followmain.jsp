<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>resns</title>

<style type="text/css">
.reSubmit{
 width: 500px;
  height: 30px;

  font-size: 12px;
  
line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.container{
width: 600px;
}

.notice {
    padding: 10px;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;

}

/* .notice-success {
    border-color: #7f7f84;
} */
.notice-success>strong {
    color: #7f7f84;
}

.remore{
    cursor:pointer;
}

.conThe{
cursor: pointer;
}

.closeEnd{
cursor: pointer;
}

</style>


<script type="text/javascript">

$(document).ready(function(){

/* 	$(document).on("click","#ekerl", function(event) {	

		var desc = $(".desc");
		desc.slideUp();
		

	}); */
	
 
 });

function contagClose(statuscount){
	var statuscount = statuscount;
	var desc = $("#displayContent"+statuscount);
	desc.slideUp('fast');	
	 $("#too"+statuscount).show();
	 $("#thebogi"+statuscount).show();
	
}


function reclose(statuscount){
var statuscount = statuscount;
var desc = $("#display"+statuscount);
desc.slideUp('fast');	
	
}

function goVeiwContent(statuscount){
	var statuscount = statuscount;
	VeiwConTag(statuscount);

}


  function goVeiwRe(statuscount){
		var statuscount = statuscount;
	VeiwRe(statuscount);

	}
  
  
  
  
  function VeiwConTag(statuscount){
	
	  
	  var form_data = {"seq_tbl_board" : $("#contentTagView"+statuscount).val()}  
	  
	 $("#too"+statuscount).hide();
	 $("#thebogi"+statuscount).hide();
	
  $.ajax({
			url: "/resns/followmainConTag.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
			
				var resultHTML = "";
				
				if(data.length > 0) { 
					
					var resultHTML = "";

					$.each(data, function(entryIndex, entry){
						var board_content = entry.content;
						var tag = entry.tag;
						var contag= "";
					
						
						contag += "<span style=''>"+board_content+"</span>";	
						
						if(tag != null){
						contag += "<span><br/><br/>"+tag+"</span><br/>"
						}

					    resultHTML += contag;				   
					    
					});	
					var test ="<span id='ekerl2' class='closeEnd' onClick='contagClose("+statuscount+");'>닫기</span>";		
					resultHTML += "<br/>"+test;	
					$("#displayContent"+statuscount).html(resultHTML);
					$("#displayContent"+statuscount).show();				
				}
				
			
				
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
  
	  
  }
  
  
  
  
  
  
  
  
  

	function VeiwRe(statuscount){
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()}
		
		$.ajax({
			url: "<%= request.getContextPath()%>/followmainre.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
			
				var resultHTML = "";
				
				if(data.length > 0) { 
					
					var resultHTML = "";

					$.each(data, function(entryIndex, entry){
						var board_seq = entry.seq_tbl_board;
						var re_seq = entry.re_seq;
						var re_name = entry.login_name;
						var re_content = entry.re_content;
						var re= "";

					    re += "<span style='font-weight: bold;'>"+re_name+"</span>&nbsp;&nbsp;&nbsp;";
					    re += "<span>"+re_content+"</span><br/>"
					 						
					    resultHTML += re;				   
					    
					});

					var test ="<span id='ekerl' class='closeEnd' onClick='reclose("+statuscount+");' >댓글 닫기</span>";		
					resultHTML += "<br/>"+test;				
					$("#display"+statuscount).html(resultHTML);
					$("#display"+statuscount).show();				
				}
				
				else {
				//alert("검색데이터 없음");
				resultHTML += "댓글이 없습니다."
				var test ="<span id='ekerl' class='closeEnd' onClick='reclose("+statuscount+");' >댓글 닫기</span>";		
				resultHTML += "<br/>"+test;					
				$("#display"+statuscount).html(resultHTML);
				$("#display"+statuscount).show();		
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
<br/>
<br/>
<div style="padding-left: 10%;">

<c:forEach var="vo" items="${followBoard}" varStatus="status">
<table style="width: 800px; border: solid 0px red; background-color: #EAE7E7;" >
    
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>

    
    <tr>
		<td width="30px" height="50px">&nbsp;</td>
        <td colspan ="2" width="740px" height="50px"><img width="50px" height="50px" class=" img-circle" style="margin-right: 10px;" src="<%= request.getContextPath() %>/resources/images/${vo.follow_proile_image}"/>${vo.follow_name}
        </td>
        <td width="30px" height="50px">&nbsp;</td>
    </tr>
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="" align="right"><span style="font-weight: bold;">글 작성 시간 :${vo.board_time}</span></td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="" align="right">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    <tr>
        <td width="30px" height="500px">&nbsp;</td>
        <td width="740px" colspan="2" height="500px" style="text-align: center;"><img width="600px"  height="500px" src ="<%= request.getContextPath() %>/resources/images/${vo.bimg_filename}"/></td>
        <td width="30px" height="500px">&nbsp;</td>
    </tr>
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    <tr>
     	<td width="30px" height="40px">&nbsp;</td>
        <td width="320px" height="40px"></td>
        <td width="320px" height="40px" style="text-align: right;"><img width="20px" src="<%=request.getContextPath()%>/resources/images/heart.png" /><span style="font-weight: bold;">하트 ${vo.board_heart}개</span> &nbsp;&nbsp;										<img 
											src="<%=request.getContextPath()%>/resources/images/report.png" 
											style="width: 18px; height: 18px; margin-right: 80px;" 
											align="right"/></td>
        <td width="30px" height="40px">&nbsp;</td>
    </tr>
    
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
    
    <tr>
    	<td width="30px" height="30px">&nbsp;</td>
    	<c:if test="${vo.map_name == null}">
    	 <td width="740px" height="30px"  colspan="2"></td>
    	</c:if>
    	
    	<c:if test="${vo.map_name != null}">
        <td width="740px" height="30px"  colspan="2"><img src="<%=request.getContextPath()%>/resources/images/user_location_black.png" style="width: 16px; height: 16px;" /> &nbsp;&nbsp;${vo.map_name}</td>
        </c:if>
        <td width="30px" height="30px">&nbsp;</td>
    </tr>
     
     <tr>
    <td colspan="4" id=""></td>
    </tr>

    <tr> 
        <td width="30px" >&nbsp;</td>
        <td width="740px" colspan="2">
        <span id="too${status.count}" class="contents">${vo.title}</span>
        <span style="color: gray;" id="contentView${status.count}" class="readMore" onClick="goVeiwContent('${status.count}');">
        <strong id="thebogi${status.count}" class="conThe">&nbsp;...문구 더 보기</strong></span><input type="hidden" id="contentTagView${status.count}" value="${vo.seq_tbl_board}">
        <div id="displayContent${status.count}" style="padding-top: 10px;" class="descCon"></div>
        </td>
        <td width="30px" >&nbsp;</td>
    </tr>
   
   
      	 
   	 <tr>
     <td width="30px">&nbsp;</td>
     <td width="740px" colspan="2" ></td>
     <td width="30px">&nbsp;</td> 
    </tr>
    <tr>
   
   

    <tr>
    <td width="30px">&nbsp;</td>
    <td width="740px" colspan="2" class="readMore">
	<strong>댓글 ${vo.board_recnt}개</strong>
	<span id="spreadBtn" class="remore" onClick="goVeiwRe('${status.count}');">&nbsp;&nbsp;모두 보기</span>
	<input type="hidden" id="seq_tbl_board${status.count}" value="${vo.seq_tbl_board}">
	<div id="display${status.count}" style="padding-top: 10px;" class="desc"></div>
	</td>
    <td width="30px">&nbsp;</td>
   
    </tr> 


    <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="">

      &nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    <tr>
        <td width="30px">&nbsp;</td>
        <td width="740px" colspan="2"><input class="reSubmit" type="text"/>&nbsp;&nbsp;<button type="button" class="rebutton">댓글쓰기</button></td>
        <td width="30px">&nbsp;</td>
    </tr>
    
        <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="">

      &nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>
    

</table>
<br/>
<br/>


</c:forEach>
</div>


<br/>
<br/>



<%-- <c:forEach var="vo" items="${followBoard}">
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