<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
  
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-ui.js"></script> 


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


.remore{
    cursor:pointer;
}

.conThe{
cursor: pointer;
}

.closeEnd{
cursor: pointer;
}


.form-control {
  -webkit-appearance: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  border-bottom-color: black;
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
​}

 .form-control:focus{
box-shadow:none; border-color:black;
outline: 0;
} 


.rebutton{
background-color: black;
border: black;
}

.rebutton:focus{
background-color: #343434;
border: black;
}

.rebutton:active:hover{
background-color: #343434;
border: black;
}

.rebutton:active:focus{
background-color: #343434;
border: black;
}

.rebutton:hover{
background-color: #343434;
border: black;
}


a{
  color: black;
  text-decoration: none;
}
a:hover,
a:focus {
  color: orange;
  text-decoration: none;
  font-weight: bold;
}
a:focus {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
  
}



.fallowmain{
border-radius: 10px;
box-shadow: 5px 5px 5px 0px lightgray;
}


#floatMenu {
	position:absolute;
	right:100px;
	top: 250px;
	color: #fff;
	
}


.pagination > li {
  display: block;
  margin-left: 0;

}


.pagination > li:first-child 
{
  margin-left: 0;
  

}
.pagination > li:child {
 margin-left: -4px;


}
.pagination > li:last-child {
 margin-left:-4px;

}



.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}




</style>


<script type="text/javascript">

$(document).ready(function(){
/* 	$(document).on("click","#ekerl", function(event) {	

		var desc = $(".desc");
		desc.slideUp();	

	}); */
	//alert("6");
	
	$("#hearted").hide();
	$("#heart").show();
	

	 var form_data = {"login_id" : $("#login_id").val(), "seq_tbl_board" : $("#seq_tbl_board").val() };	  
	 $.ajax({
			
			url: "/resns/heartCheck.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
				
				if (data.fk_login_id == null) {	// 데이터가 없으면 흰 하트
					$("#hearted").hide();
					$("#heart").show();
					
				}
				else if (data.fk_login_id != null) {	// 하트 찍은 적이 있으면 까만 하트
					$("#heart").hide();
					$("#hearted").show();
				
					
				}
				heartCounting();
			
			}, error: function() {
				
			}
		});//end of ajax
		
 });


function goVeiwContent(){

	VeiwCon();
	VeiwTag();

	
	
	
	
	
	
}


function VeiwCon(){
	  var form_data = {"seq_tbl_board" : $("#contentTagView").val()};
	  
	 $("#too").hide();
	 $("#thebogi").hide();
	
$.ajax({
			url: "<%= request.getContextPath()%>/followmainCon.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
				var resultHTML = "";
			
				if(data != null) { 
				
				   var content = data.content;
				   
				   resultHTML += "<span style='font-size: 13pt;'>"+content+"</span>";
										
					var tag ="<div id='tag'></div>"
					var test ="<br/><span id='ekerl2' class='closeEnd' onClick='contagClose();'>닫기</span>";		
					resultHTML += "<br/>"+tag+test;	
					$("#displayContent").html(resultHTML);
					$("#displayContent").show();				
				}
				
				else{
					var resultHTML = "";
					$("#displayContent").html(resultHTML);
					$("#displayContent").show();	
				}
				
			
				
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------

	  
}

function VeiwTag(){
	  var form_data = {"seq_tbl_board" : $("#contentTagView").val()};
	  
	 $("#too").hide();
	 $("#thebogi").hide();
	
	$.ajax({
			
			url: "/resns/followmainTag.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
			
				if (data.length != null) {

					var result = "<br/><br/>";
					
					$.each(data, function(entryIndex, entry){
						
						var seq_tbl_tag = entry.seq_tbl_tag;
						var tag_content = entry.tag_content;
						
						var sub_tag_content = tag_content.substring(1);

						result += "<span style='font-weight: bold;'>"+tag_content+"</span>";

						
					});
				}
					
				$("#tag").html(result);
				$("#tag").show();	
				
			}, error: function() {
				
			}
			
		});

	  
}


function contagClose(){
	var desc = $("#displayContent");
	desc.hide('fast');	
	 $("#too").show('fast');
	 $("#thebogi").show('fast');
	
}


function addHeart(){
	
	
	var form_data = {"fk_login_id" : $("#fk_login_id").val(),
					"seq_tbl_board" : $("#seq_tbl_board").val()};
	
	$.ajax ({
		
		url: "/resns/addHeart.re",
		type: "GET",
		data: form_data,
		dataType: "JSON",
		success: function(data) {
			
		$("#heart").hide();
		$("#hearted").show();
				
		swal(data.msg);
		
		heartCounting();
		
			
		}, error : function () {
			
		}
		
		
	});
	
	
}


function deleteHeart() {
	
	var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val() };

	 
	 swal({
		  title: "취소하시겠습니까?",
		  text: "하트 취소 후 다시 누를 수 있습니다.",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "네, 취소합니다.",
		  closeOnConfirm: false
		},
		function(){
			 
			
			$.ajax ({
				 
				 url: "/resns/deleteHeart.re",
				 type: "GET",
				 data: form_data,
				 dataType: "JSON",
				success: function(data) {
						
				swal(data.msg);
				
				$("#heart").show();
				$("#hearted").hide();
				
				heartCounting();
					
				}, error : function () {
					
				}
				 
			 });
			 
		});

}



function heartCounting() {
	
	var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val() };
	
	$.ajax ({
		
		url: "/resns/heartCounting.re",
		type: "GET",
		data: form_data,
		dataType: "JSON",
		success: function(data) {

			var board_heart = data.board_heart;
			
			//alert(board_heart);
			
			var result = "좋아요 "+board_heart+" 개";
			
			$("#heartCnt").html(result);
			
		}, error : function() {
			
		}
		
	});
	
}




  function goVeiwRe(){
	VeiwRe(); }

  
  function VeiwRe(){

		var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val()};
		
		$.ajax({
			url: "<%= request.getContextPath()%>/followmainre.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
			
				
				var resultHTML = "";
				
				if(data.length >0) { 
					
					$.each(data, function(entryIndex, entry){

						 
						var entryIndex = entryIndex;
						
						var re_seq = entry.re_seq;
						var re_id = entry.re_id;
						var re_content = entry.re_content;
						var re_date = entry.re_date;
						var re_status = entry.re_status;
						var re_fk_seq = entry.re_fk_seq;
						var re_groupno = entry.re_groupno;
						var re_depthno = entry.re_depthno;
						var login_name = entry.login_name;
						var uimg_profile_filename = entry.uimg_profile_filename;
						var board_seq = entry.seq_tbl_board;
			
						var re= "";
						re +="<div>";

						if(re_depthno == 0){ //원 댓글
							re += "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							}
							
							
							if ('${sessionScope.loginUser.login_id}' != re_id){
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							}

							
							re += "<a href='/resns/reportingBoard.re?re_id="+re_id+"'>";
							re += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' />"; //신고 아직 안됨
							re += "</a>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){//원댓글 아이디가 로그인 아이디이면
								re +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+")' style='width: 15px; height: 15px; cursor: pointer;' align='right' />";
							}//원 댓글이 로그인한 회원과 같으면	
							
						
							re += "<img src='resources/images/reoption.png' align='right' style='width: 15px; height: 15px; cursor: pointer;' onclick='runEffect("+entryIndex+")' /><br/>";
							re += re_content;
							re += "<div style='display: none' id='reReply"+entryIndex+"'>";
							re += "<input type='text' id='reReValue"+entryIndex+"' />";
							re += "<button onclick=\"writeReRe("+entryIndex+","+re_groupno+","+re_seq+",'"+re_id+"');\">입력!</button>";
							re += "</div>";
							
						}//원 댓글 끝
						
	
						else if (re_depthno == 1){//대댓글이라면
							
							re += "<div style='margin-left: 15px;'>";
							re += "<img src='resources/images/rere.png' style='width: 10px; height: 10px;' />";
							re += "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;' />";
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							}
							
							
							if ('${sessionScope.loginUser.login_id}' != re_id){
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							}

							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+")' style='width: 15px; height: 15px;' align='right' />";
							}
							
							re += "<a href='/resns/reportingBoard.re?re_id="+re_id+"'>";
							re += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' /><br/>";
							re += "</a>";
							re += "<div style='margin-left: 20px;'>"+re_content+"</div>";
							re += "</div>";	
							
						}//대댓글이라면 끝
						
						re += "</div>";
					 						
					    resultHTML += re;				   
					    
					});//end of each

					var test ="<span id='ekerl' class='closeEnd' onClick='reclose();' >댓글 닫기</span>";		
					resultHTML += "<br/>"+test;				
					$("#display").html(resultHTML);
					$("#display").show();	
					
				}//end of data>0
				
				else {
				//alert("검색데이터 없음");
				resultHTML += "댓글이 없습니다."
				var test ="<span id='ekerl' class='closeEnd' onClick='reclose();' >댓글 닫기</span>";		
				resultHTML += "<br/>"+test;					
				$("#display").html(resultHTML);
				$("#display").show();		
				/* $("#display"+statuscount).show(); */
				} // end of if ~ else ----------------
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------


		
	}//end of function VeiwRe(statuscount)
	
	
	
 
	function runEffect(entryIndex) {

	    // Most effect types need no options passed by default
	    var options = {};
	    
	    // Run the effect

	   $( "#reReply"+entryIndex ).toggle("blind", options, 500 ); 

	    
	    
	  }

	  function reclose(){
		  var desc = $("#display");
		  desc.slideUp('fast');	
		  	
		  }

	
	  

		function writeRe() {
			
			if (${sessionScope.loginUser != null}) {
				
				var re_content = $("#re_content").val();
				
				if ($.trim(re_content) == "") {
					
					swal("내용을 입력하세요.");
					
					event.preventDefault();
					
				}
				
				
				var form_data = {"re_content" : re_content,
								 "seq_tbl_board" : $("#seq_tbl_board").val(),
								 "fk_login_id" : $("#fk_login_id").val() };

				$.ajax({
					
					url: "/resns/writeReply.re",
					type: "GET",
					data: form_data,
					dataType: "JSON",
					success: function(data) {
						
						swal(data.msg);
						
						$("#re_content").val("");
						goVeiwRe(statuscount);
						reCounting(statuscount);
					}, error: function() {
						
					}
					
				});
			}
			else if (${sessionScope.loginUser == null}) {
				location.href="/resns/writeReply.re";
			}
			

			
		}

	  

	  
	  function reCounting() {
			
			var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val() };
			
			$.ajax ({
				
				url: "/resns/reCounting.re",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(data) {

					var board_recnt = data.board_recnt;
					
					//alert(board_heart);
					
					var result = "댓글"+board_recnt+" 개";
					
					$("#reCnt").html(result);
					
				}, error : function() {
					
				}
				
			});
			
		}
		
		
	  
		
		function deleteRe(re_seq, re_groupno, re_depthno) {
			
			form_data = {"re_seq" : re_seq, "re_groupno" : re_groupno, "re_depthno" : re_depthno, 
					"seq_tbl_board" : $("#seq_tbl_board").val()};
			
			$.ajax({
				
				url: "/resns/deleteReply.re",
				data: form_data,
				type: "GET",
				dataType: "JSON",
				success: function(data) {
					
					swal(data.msg);
					
					VeiwRe();
					reCounting();
					
				}, error: function() {
					
				}
				
			});
			
		}
		
	  
		function writeReRe(entryIndex, re_groupno, re_seq, re_id) {
			//alert("dd");
			var rereValue = $("#reReValue"+entryIndex).val();
			
			if (${sessionScope.loginUser == null}) {
				
				location.href="/resns/writeReRe.re";
				
			}
			
			
			if ($.trim(rereValue) == "") {
				
				swal("내용을 입력하세요.");
				
				event.preventDefault();
				
			}
			

			var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val(),
						"re_groupno" : re_groupno, "re_seq" : re_seq, "re_content" : rereValue, "re_id" : re_id
						,"fk_login_id" : $("#fk_login_id").val()
						};
			  
			  $.ajax({
				  
				  url: "/resns/writeReRe.re",
				  type: "GET",
				  data: form_data,
				  dataType: "JSON",
				  success: function(data) {
					  
					swal(data.msg);
					  
					VeiwRe();
					reCounting();
					  
				  }, error: function() {
					  
				  }
				  
				  
			  }); 
		}

<%-- 




	
	
	

	
	
	

	
 --%>
</script>


</head>
<body>
<br/>
<br/>

<div align="" style="margin-left: 10%;">
<table class="fallowmain" style="width: 500px; border: solid 0px red;  background-color: #f4f4f4;" >   
 
     <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="redisplay">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>

    
    <tr>
		<td width="5%">&nbsp;</td>
        <td colspan ="2" width="90%" height="50px"><img width="50px" height="50px" class=" img-circle" style="margin-right: 10px;" src="<%= request.getContextPath() %>/resources/images/${vo.board_profile_filename}"/>
        <a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${vo.board_login_id}">${vo.board_login_name}</a>
        <input type="hidden" id="seq_tbl_board" name="seq_tbl_board" value="${vo.seq_tbl_board}">
        <input type="hidden" id="fk_login_id" name="fk_login_id" value="${vo.board_login_id}">
        <input type="hidden" id="login_id" name="login_id" value="${loginUser.login_id}">
        </td>
        <td width="5%">&nbsp;</td>
    </tr>
        <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="" align="right"><span style="margin-right:7%; font-weight: bold;">글 작성 시간 :${vo.board_time}</span></td>
       <td width="5%">&nbsp;</td> 
    </tr>
    
     <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="" align="right">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    
    <tr>
        <td width="5%" height="500px">&nbsp;</td>
        <td width="90%" colspan="2" height="500px" style="text-align: center;"><img width="500px"  height="500px" src ="<%= request.getContextPath() %>/resources/images/${vo.bimg_filename}"/></td>
        <td width="5%" height="500px">&nbsp;</td>
    </tr>
        <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="redisplay">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    
    <tr>
     	<td width="5%" height="40px">&nbsp;</td>
        <td width="45%" height="40px"></td>
        <td width="45%" height="40px" style="text-align: right;"><img
												src="<%=request.getContextPath()%>/resources/images/hearted.png"
												id="hearted"
												style="width: 18px; height: 18px; cursor: pointer;"
												class="hearted" onclick="deleteHeart();" /> 
											<img
												src="<%=request.getContextPath()%>/resources/images/heart.png"
												id="heart"
												style="width: 18px; height: 18px; cursor: pointer;"
												class="heart" onclick="addHeart();" />
												<div style="display: inline-block;" id="heartCnt"><span style="font-weight: bold;">좋아요 ${vo.board_heart}개</span></div> &nbsp;&nbsp;
		<a href="/resns/reportingBoard.re?fk_login_id=${vo.board_login_id}&seq_tbl_board=${vo.seq_tbl_board}"> <img style="width: 18px; height: 18px; margin-right: 80px;"  src="<%=request.getContextPath()%>/resources/images/report.png" align="right" /> </a>	
		</td>
        <td width="5%" height="40px">&nbsp;</td>
    </tr>
    
        <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    
    
    <tr>
    	<td width="5%" height="30px">&nbsp;</td>
    	<c:if test="${vo.map_name == null}">
    	 <td width="90%" height="30px"  colspan="2"></td>
    	</c:if>
    	
    	<c:if test="${vo.map_name != null}">
        <td width="90%" height="30px"  colspan="2"><img src="<%=request.getContextPath()%>/resources/images/user_location_black.png" style="width: 16px; height: 16px;" /> &nbsp;&nbsp;${vo.map_name}</td>
        </c:if>
        <td width="5%" height="30px">&nbsp;</td>
    </tr>
     
     <tr>
    <td colspan="4" id=""></td>
    </tr>

    <tr> 
        <td width="5%" >&nbsp;</td>
        <td width="90%" colspan="2">
        <div style="padding-left: 5%;">
        <span id="too" style="font-size: 13pt;" class="contents">${vo.title}</span>
        <span style="color: gray;" id="contentView" class="readMore" onClick="goVeiwContent();">
        <strong id="thebogi" class="conThe">&nbsp;...문구 더 보기</strong></span><input type="hidden" id="contentTagView" value="${vo.seq_tbl_board}">
        <div id="displayContent" style="padding-top: 10px;" class="descCon"></div>
         </div>
        </td>
        <td width="5%" >&nbsp;</td>
    </tr>
   
   
      	 
   	 <tr>
     <td width="5%">&nbsp;</td>
     <td width="90%" colspan="2" ></td>
     <td width="5%">&nbsp;</td> 
    </tr>
    <tr>
   
   

    <tr>
    <td width="5%">&nbsp;</td>
    <td width="90" colspan="2" class="readMore">
    <div style="padding-left: 5%;">
	<strong id="reCnt">댓글${vo.board_recnt}개</strong>
	<span id="spreadBtn" class="remore" onClick="goVeiwRe();">&nbsp;&nbsp;모두 보기</span>
	<input type="hidden" id="seq_tbl_board" value="${vo.seq_tbl_board}">
	<div id="display" style="padding-top: 10px;" class="desc"></div>
	</div>
	</td>
    <td width="5%">&nbsp;</td>
   
    </tr> 


    <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="">

      &nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    
     <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    <tr>
        <td width="5%">&nbsp;</td>
        <td width="90%" colspan="2"><div align="center" style=""><input  class="reSubmit form-control" type="text" id="re_content" style="width:700px; border:hidden;  background:transparent; border-bottom:1px; border-bottom-style: solid; display: inline;"/>&nbsp;&nbsp;<button  type="button" class="rebutton delete btn btn-danger" onclick="writeRe();">댓글쓰기</button></div></td>
        <td width="5%">&nbsp;</td>
    </tr>
    
        <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="">

      &nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    

</table>
</div>
<br/>
<br/>



</body>
</html>