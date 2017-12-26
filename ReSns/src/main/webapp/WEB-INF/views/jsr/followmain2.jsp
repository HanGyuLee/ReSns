<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
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
	position: fixed;
	right:100px;
	top: 100px;
	color: #fff;
	
}


.pagination > li {
  display: block;
  margin-left: 0;

}


.pagination > li:first-child 
{
  margin-left: 4px;
  

}



.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}




</style>


<script type="text/javascript">

$(document).ready(function(){
/* 	$(document).on("click","#ekerl", function(event) {	

		var desc = $(".desc");
		desc.slideUp();	

	}); */
	$(".repleCounthidden").hide();
	
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
 
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
 
		// 애니메이션 없이 바로 따라감
		// $("#floatMenu").css('top', newPosition);
		 
 
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();

	
	var test =[]
	$(".ReReseq").each(function(){
		var Reseq = test.push($(this).attr('id'));
		
		if(Reseq != null){
			VeiwRe(Reseq,"1");
			


		}//not null이라면
		

		
		
	})//end of ReReseq.each
	
	
	
	
	
	
	
	
	var retval = []	
	$(".heart").each(function(){
	 var heartse = retval.push($(this).attr('id'));
	 
	 
	 if (heartse != null){
		 
			$("#hearted"+heartse).hide();
			$("#heart"+heartse).show();

	 var form_data = {"login_id" : $("#login_id"+heartse).val(), "seq_tbl_board" : $("#seq_tbl_board"+heartse).val()};	  
	 $.ajax({
			
			url: "/resns/heartCheck.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
				
				if (data.fk_login_id == null) {	// 데이터가 없으면 흰 하트
					$("#hearted"+heartse).hide();
					$("#heart"+heartse).show();
					
				}
				else if (data.fk_login_id != null) {	// 하트 찍은 적이 있으면 까만 하트
					$("#heart"+heartse).hide();
					$("#hearted"+heartse).show();
				
					
				}
			
			
			}, error: function() {
				
			}
		});//end of ajax
		heartCounting(heartse);
		//reCounting(heartse);
	 }//end of  if hearts not null
	});//end of heart each
	
 
 });






function contagClose(statuscount){
	var statuscount = statuscount;
	var desc = $("#displayContent"+statuscount);
	desc.hide('fast');	
	 $("#too"+statuscount).show('fast');
	 $("#thebogi"+statuscount).show('fast');
	
}


function reclose(statuscount){
var statuscount = statuscount;
var desc = $("#display"+statuscount);
desc.slideUp('fast');	
	
}

function goVeiwContent(statuscount){
	var statuscount = statuscount;
	VeiwCon(statuscount);
	VeiwTag(statuscount);

}


  function goVeiwRe(statuscount){
		var statuscount = statuscount;
	VeiwRe(statuscount);

	}
  
  
  function VeiwCon(statuscount){
	  var form_data = {"seq_tbl_board" : $("#contentTagView"+statuscount).val()};
	  
	 $("#too"+statuscount).hide();
	 $("#thebogi"+statuscount).hide();
	
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
										
					var tag ="<div id='tag"+statuscount+"'></div>"
					var test ="<br/><span id='ekerl2' class='closeEnd' onClick='contagClose("+statuscount+");'>닫기</span>";		
					resultHTML += "<br/>"+tag+test;	
					$("#displayContent"+statuscount).html(resultHTML);
					$("#displayContent"+statuscount).show();				
				}
				
				else{
					var resultHTML = "";
					$("#displayContent"+statuscount).html(resultHTML);
					$("#displayContent"+statuscount).show();	
				}
				
			
				
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
  
	  
  }
  
  
  
  
  function VeiwTag(statuscount){
	  var form_data = {"seq_tbl_board" : $("#contentTagView"+statuscount).val()};
	  
	 $("#too"+statuscount).hide();
	 $("#thebogi"+statuscount).hide();
	
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

						result += "<a href='/resns/searchEndTag.re?search="+sub_tag_content+"'>";
						result += "<span style='font-weight: bold;'>"+tag_content+"</span>";
						result += "</a>";

						
					});
				}
					
				$("#tag"+statuscount).html(result);
				$("#tag"+statuscount).show();	
				
			}, error: function() {
				
			}
			
		});
  
	  
  }
  function goretheCount(statuscount){
	  var statuscount= statuscount;
	 var no =  $("#spreadBtn"+statuscount).val();
	// var no2 = $("#dataLength"+statuscount).text();
	 VeiwRe(statuscount,no);
	 
	// reCounting(statuscount,no2);
	 
  }
  
  
  var lenNew = 3;
  var len = 1;
	function VeiwRe(statuscount,start){
		var statuscount = statuscount;
		var start = start;
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()
						,"start":start
						,"len":lenNew
		};
		
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
							
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/></a>";
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+re_date;
							}
							
							
							if ('${sessionScope.loginUser.login_id}' != re_id){
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/></a>";
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+re_date;
							}

							re += "<a href='/resns/reportingUser.re?re_id="+re_id+"'>";
							re += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' />"; //신고 아직 안됨
							re += "</a>";
							
							
							if ('${sessionScope.loginUser.login_id}' == re_id){//원댓글 아이디가 로그인 아이디이면
								re +="<img src='resources/images/delete.png' onclick=\"deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+",'"+re_id+"');\" style='width: 15px; height: 15px; cursor: pointer;' align='right' />";
							}//원 댓글이 로그인한 회원과 같으면	
							
						
							re += "<img src='resources/images/reoption.png' id='re_seq"+re_seq+"' align='right' style='width: 15px; height: 15px; cursor: pointer;' onclick='runEffect("+re_seq+")' /><br/>";
							re += re_content;
							re += "<div style='display: none' id='reReply"+re_seq+"'>";
							re += "<input type='text' id='reReValue"+re_seq+"' />";
							re += "<button class='btn btn-default' onclick=\"writeReRe("+entryIndex+","+statuscount+","+re_groupno+","+re_seq+",'"+re_id+"');\">입력</button>";
							re += "</div>";
							
						}//원 댓글 끝
						
						
						
						
						else if (re_depthno == 1){//대댓글이라면
							
							re += "<div style='margin-left: 15px;'>";
							re += "<img src='resources/images/rere.png' style='width: 10px; height: 10px;' />";

						
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/></a>";
								re += "<a href='/resns/mypage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+re_date;
							}
							
							
							if ('${sessionScope.loginUser.login_id}' != re_id){
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/></a>";
								re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+re_date;
							}
							
							
							
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re +="<img src='resources/images/delete.png' onclick=\"deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+",'"+re_id+"');\" style='width: 15px; height: 15px;' align='right' />";
							}
							
							re += "<a href='/resns/reportingUser.re?re_id="+re_id+"'>";
							re += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' /><br/>";
							re += "</a>";
							re += "<div style='margin-left: 20px;'>"+re_content+"</div>";
							re += "</div>";	
							
						}//대댓글이라면 끝
						
						re += "</div>";
					 						
					    resultHTML += re;				   
					    
					});//end of each
					$("#display"+statuscount).append(resultHTML);
 					$("#spreadBtn"+statuscount).val(parseInt(start)+lenNew); 
					$("#recount"+statuscount).text(parseInt($("#recount"+statuscount).text()) + data.length );
					
					if ( parseInt($("#retotalCount"+statuscount).text()) == parseInt($("#recount"+statuscount).text()) ) { 
			    		
						//$("#spreadBtn"+statuscount).attr("disabled", true);
						$("#spreadBtn"+statuscount).hide();
				    	//$("#spreadBtn"+statuscount).css("cursor", "not-allowed");
			    	}
	   			 
					
					
				}//end of data>0
				
				else {//댓글없음
					$("#spreadBtn"+statuscount).hide();
				} // end of if ~ else ----------------
			}, // end of success: function()----------
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------


		
	}//end of function VeiwRe(statuscount)

	function runEffect(re_seq) {


	    // Most effect types need no options passed by default
	    var options = {};
	    
	    // Run the effect

	   $( "#reReply"+re_seq ).toggle("blind", options, 500 ); 

	    
	    
	  };
	  
	
	
	function addHeart(statuscount) {
		
		
		var form_data = {"fk_login_id" : $("#fk_login_id"+statuscount).val(),
						"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};
		
		$.ajax ({
			
			url: "/resns/addHeart.re",
			type: "GET",
			data: form_data,
			dataType: "JSON",
			success: function(data) {
				
			$("#heart"+statuscount).hide();
			$("#hearted"+statuscount).show();
					
			swal(data.msg);
			
			heartCounting(statuscount);
			
				
			}, error : function () {
				
			}
			
			
		});
		
		
	}
	
	

	function deleteHeart(statuscount) {
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val() };

		 
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
					
					$("#heart"+statuscount).show();
					$("#hearted"+statuscount).hide();
					
					heartCounting(statuscount);
						
					}, error : function () {
						
					}
					 
				 });
				 
			});

	}
	
	
	
	function heartCounting(statuscount) {
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val() };
		
		$.ajax ({
			
			url: "/resns/heartCounting.re",
			type: "GET",
			data: form_data,
			dataType: "JSON",
			success: function(data) {

				var board_heart = data.board_heart;
				
				//alert(board_heart);
				
				var result = "좋아요 "+board_heart+" 개";
				
				$("#heartCnt"+statuscount).html(result);
				
			}, error : function() {
				
			}
			
		});
		
	}
	
	
	


	function writeRe(statuscount) {
		var statuscount = statuscount;
		//var start = start;
		 //var no =  $("#spreadBtn"+statuscount).val();
		//alert("statuscount"+statuscount);
		//alert("start"+no);

			
			var re_content = $("#re_content"+statuscount).val();
			
			if ($.trim(re_content) == "") {
				
				swal("내용을 입력하세요.");
				event.preventDefault();
				
			}
			
			else {
			var form_data = {"re_content" : re_content,
							 "seq_tbl_board" : $("#seq_tbl_board"+statuscount).val(),
							 "fk_login_id" : $("#fk_login_id"+statuscount).val() };

			$.ajax({
				
				url: "/resns/writeReply.re",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(data) {
					
					
					
					$("#re_content"+statuscount).val("");
					$("#recount"+statuscount).text(parseInt($("#recount"+statuscount).text()) - parseInt($("#recount"+statuscount).text()) );
					$("#display"+statuscount).empty();
					
					swal({ title: "댓글 작성 성공!", text: data.msg}, function(){ location.reload(); });
					//swal(data.msg)
					//location.reload(); 
					//goVeiwRe(statuscount,"1");
					reCounting(statuscount);
					//$("#spreadBtn"+statuscount).attr("disabled", false);
					
		
				}, error: function() {
					
				}
				
			});
			}
	}

	
	function reCounting(statuscount) {
		
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val() };
		
		$.ajax ({
			
			url: "/resns/reCounting.re",
			type: "GET",
			data: form_data,
			dataType: "JSON",
			success: function(data) {

				var board_recnt = data.board_recnt;

				
				var result = "댓글"+board_recnt+"개";

				$("#reCnt"+statuscount).html(result);
				$("#retotalCount"+statuscount).html(board_recnt);
				//$("#spreadBtn"+statuscount).attr("disabled", false);
					//버튼에 4저장
					//recount에는 3저장

					
						
				
			}, error : function() {
				
			}
			
		});
		
	}
	
	
	function deleteRe(re_seq, re_groupno, re_depthno, statuscount) {
		//var no =  $("#spreadBtn"+statuscount).val();
		form_data = {"re_seq" : re_seq, "re_groupno" : re_groupno, "re_depthno" : re_depthno, 
				"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};
		
		$.ajax({
			
			url: "/resns/deleteReply.re",
			data: form_data,
			type: "GET",
			dataType: "JSON",
			success: function(data) {
				
				//swal(data.msg);
				
				$("#display"+statuscount).empty();
				VeiwRe(statuscount,"1");
				
				$("#recount"+statuscount).text(parseInt($("#recount"+statuscount).text()) - parseInt($("#recount"+statuscount).text()) );
				
				swal({ title: "댓글삭제", text: data.msg}, function(){ location.reload(); });
				
				//location.reload(); 
				
				//$("#spreadBtn"+statuscount).attr("disabled", false);
				reCounting(statuscount);
			}, error: function() {
				
			}
			
		});
		
	}
	
	
	
	function writeReRe(entryIndex, statuscount, re_groupno, re_seq, re_id) {
		//var no =  $("#spreadBtn"+statuscount).val();
		var rereValue = $("#reReValue"+re_seq).val();
		

		
		
		if ($.trim(rereValue) == "") {
			
			swal("내용을 입력하세요.");
			
			event.preventDefault();
			
		}
		
		else{
		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val(),
					"re_groupno" : re_groupno, "re_seq" : re_seq, "re_content" : rereValue, "re_id" : re_id
					,"fk_login_id" : $("#fk_login_id"+statuscount).val()
					};
		  
		  $.ajax({
			  
			  url: "/resns/writeReRe.re",
			  type: "GET",
			  data: form_data,
			  dataType: "JSON",
			  success: function(data) {
				  
				
				$("#rereValue"+statuscount).val("");
				$("#display"+statuscount).empty();
				$("#recount"+statuscount).text(parseInt($("#recount"+statuscount).text()) - parseInt($("#recount"+statuscount).text()) )
				VeiwRe(statuscount,"1");
				swal({ title: "댓글 작성 성공!", text: data.msg}, function(){ location.reload(); });
				//$("#spreadBtn"+statuscount).attr("disabled", false);
				reCounting(statuscount);
				//location.reload(); 
				  
			  }, error: function() {
				  
			  }
			  
			  
		  }); 
		}
	}

	

</script>


</head>
<body>
<br/>
<br/>
<div style="padding-left: 10%;">
<c:if test="${followBoard != null && not empty followBoard}">
<div id="floatMenu" style="position: relative; border: 0px solid red; width: 7%; ">
${pagebar}
</div>
</c:if>

<c:if test="${followBoard == null}">
<div align="center" style="margin-top: 15%;">
<span style="color: gray; font-size: 20pt; font-weight: bold;">
팔로우 하고 있는 회원이 없습니다.<br/>
지금 바로  다른 회원을 팔로우 해보세요 :)<br/>
</span>
</div>
</c:if>


<c:if test="${empty followBoard && followBoard != null}">
<div align="center" style="margin-top: 15%;">
<span style="color: gray; font-size: 20pt; font-weight: bold;">
내가 팔로우한 회원이 아직 글을 작성하지 않았습니다.<br/>
더 많은 회원을 팔로우 하여 구독해보세요 :)<br/>
</span>
</div>
</c:if>

<div style="margin-top:-8%;">
<c:forEach var="vo" items="${followBoard}" varStatus="status">
<table class="fallowmain" style="width: 1000px; border: solid 0px red;  background-color: #f4f4f4;" >   
 
     <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="redisplay">&nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>

    
    <tr>
		<td width="5%">&nbsp;</td>
        <td colspan ="2" width="90%" height="50px"><img width="50px" height="50px" class=" img-circle" style="margin-right: 10px;" src="<%= request.getContextPath() %>/resources/images/${vo.follow_proile_image}"/>
        <a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${vo.follow_id}">${vo.follow_name}</a>
        <input type="hidden" id="seq_tbl_board${status.count}" name="seq_tbl_board" value="${vo.seq_tbl_board}">
        <input type="hidden" id="fk_login_id${status.count}" name="fk_login_id" value="${vo.follow_id}">
        <input type="hidden" id="login_id${status.count}" name="login_id" value="${loginUser.login_id}">
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
        <td width="90%" colspan="2" height="700px" style="text-align: center;"><img width="800px"  height="700px" src ="<%= request.getContextPath() %>/resources/images/${vo.bimg_filename}"/></td>
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
												id="hearted${status.count}"
												style="width: 18px; height: 18px; cursor: pointer;"
												class="hearted" onclick="deleteHeart('${status.count}');" /> 
											<img
												src="<%=request.getContextPath()%>/resources/images/heart.png"
												id="heart${status.count}"
												style="width: 18px; height: 18px; cursor: pointer;"
												class="heart" onclick="addHeart('${status.count}');" />
												<div style="display: inline-block;" id="heartCnt${status.count}"><span style="font-weight: bold;">좋아요 ${vo.board_heart}개</span></div> &nbsp;&nbsp;
		<a href="/resns/reportingBoard.re?fk_login_id=${vo.follow_id}&seq_tbl_board=${vo.seq_tbl_board}"> <img style="width: 18px; height: 18px; margin-right: 80px;"  src="<%=request.getContextPath()%>/resources/images/report.png" align="right" /> </a>	
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
        <span id="too${status.count}" style="font-size: 13pt;" class="contents">${vo.title}</span>
        <span style="color: gray;" id="contentView${status.count}" class="readMore" onClick="goVeiwContent('${status.count}');">
        <strong id="thebogi${status.count}" class="conThe">&nbsp;...문구 더 보기</strong></span><input type="hidden" id="contentTagView${status.count}" value="${vo.seq_tbl_board}">
        <div id="displayContent${status.count}" style="padding-top: 10px;" class="descCon"></div>
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
	<strong id="reCnt${status.count}" class="ReReseq">댓글${vo.board_recnt}개</strong>
	
	<%-- <button type="button" id="spreadBtn" class="remore" value="">모두 보기</button> %-->
	<%-- <span id="spreadBtn" class="remore" onClick="goVeiwRe('${status.count}');">&nbsp;&nbsp;모두 보기</span> --%>
	<input type="hidden" id="seq_tbl_board${status.count}" value="${vo.seq_tbl_board}">
	<div id="display${status.count}" style="padding-top: 10px;" class="desc"></div>
	<button type="button" style="background: none; border-style: hidden;" id="spreadBtn${status.count}" onClick="goretheCount('${status.count}');" class='remore' value=''><span style="color: black; font-weight: bold; font-size: 12pt;">댓글 더 보기</span></button>
	<span id="retotalCount${status.count}" class="repleCounthidden">${vo.board_recnt}</span>
	<span id="recount${status.count}" class="repleCounthidden">0</span>
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
        <td width="90%" colspan="2"><div align="center" style=""><input  class="reSubmit form-control" type="text" id="re_content${status.count}" style="width:700px; border:hidden;  background:transparent; border-bottom:1px; border-bottom-style: solid; display: inline;"/>&nbsp;&nbsp;<button  type="button" class="rebutton delete btn btn-danger" onclick="writeRe('${status.count}');">댓글쓰기</button></div></td>
        <td width="5%">&nbsp;</td>
    </tr>
    
        <tr>
     <td width="5%">&nbsp;</td>
      <td width="90%" colspan="2" id="">

      &nbsp;</td>
       <td width="5%">&nbsp;</td> 
    </tr>
    

</table>
<br/>
<br/>


</c:forEach>

</div>


</div>

</body>
</html>