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

</style>


<script type="text/javascript">

$(document).ready(function(){
/* 	$(document).on("click","#ekerl", function(event) {	

		var desc = $(".desc");
		desc.slideUp();	

	}); */
	
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
		
	 }//end of  if hearts not null
	});//end of heart each
	
 
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
				   
				   resultHTML += "<span>"+content+"</span>";
										
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
  
  

	function VeiwRe(statuscount){

		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()}
		
		$.ajax({
			url: "<%= request.getContextPath()%>/followmainre.re",
			type: "GET",
			data: form_data,
			dataType: "JSON", 
			success: function(data) {
			
				
				var resultHTML = "";
				
				if(data.length != null) { 
					
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
							re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							re += "<a href='/resns/reportingBoard.re?re_id="+re_id+"'>";
							re += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' />"; //신고 아직 안됨
							re += "</a>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){//원댓글 아이디가 로그인 아이디이면
								re +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+")' style='width: 15px; height: 15px; cursor: pointer;' align='right' />";
							}//원 댓글이 로그인한 회원과 같으면	
							
						
							re += "<img src='resources/images/reoption.png' align='right' style='width: 15px; height: 15px; cursor: pointer;' onclick='runEffect("+entryIndex+")' /><br/>";
							re += re_content;
							re += "<div style='display: none' id='reReply"+entryIndex+"'>";
							re += "<input type='text' id='reReValue"+entryIndex+"' />";
							re += "<button onclick='writeReRe("+entryIndex+","+statuscount+","+re_groupno+","+re_seq+")'>입력</button>";
							re += "</div>";
							
						}//원 댓글 끝
						
						
						
						
						else if (re_depthno == 1){//대댓글이라면
							
							re += "<div style='margin-left: 15px;'>";
							re += "<img src='resources/images/rere.png' style='width: 10px; height: 10px;' />";
							re += "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;' />";
							re += "<a href='/resns/otherspage.re?fk_login_id="+re_id+"'><span style='font-weight: bold;'>"+login_name+"</span></a>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								re +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+")' style='width: 15px; height: 15px;' align='right' />";
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

					var test ="<span id='ekerl' class='closeEnd' onClick='reclose("+statuscount+");' >댓글 닫기</span>";		
					resultHTML += "<br/>"+test;				
					$("#display"+statuscount).html(resultHTML);
					$("#display"+statuscount).show();	
					
				}//end of data>0
				
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

	function runEffect(entryIndex) {

	    // Most effect types need no options passed by default
	    var options = {};
	    
	    // Run the effect

	   $( "#reReply"+entryIndex ).toggle("blind", options, 500 ); 

	    
	    
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
		
		
		if (${sessionScope.loginUser != null}) {
			
			var form_data = {"re_content" : $("#re_content"+statuscount).val(),
							 "seq_tbl_board" : $("#seq_tbl_board"+statuscount).val() };

			$.ajax({
				
				url: "/resns/writeReply.re",
				type: "GET",
				data: form_data,
				dataType: "JSON",
				success: function(data) {
					
					swal(data.msg);
					
					$("#re_content"+statuscount).val("");
					
					VeiwRe(statuscount);
					reCounting(statuscount);
				}, error: function() {
					
				}
				
			});
		}
		else if (${sessionScope.loginUser == null}) {
			location.href="/resns/writeReply.re";
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
				
				//alert(board_heart);
				
				var result = "댓글 "+board_recnt+" 개";
				
				$("#reCnt"+statuscount).html(result);
				
			}, error : function() {
				
			}
			
		});
		
	}
	
	
	function deleteRe(re_seq, re_groupno, re_depthno, statuscount) {
		
		form_data = {"re_seq" : re_seq, "re_groupno" : re_groupno, "re_depthno" : re_depthno, 
				"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};
		
		$.ajax({
			
			url: "/resns/deleteReply.re",
			data: form_data,
			type: "GET",
			dataType: "JSON",
			success: function(data) {
				
				swal(data.msg);
				
				VeiwRe(statuscount);
				reCounting(statuscount);
				
			}, error: function() {
				
			}
			
		});
		
	}
	
	
	
	function writeReRe(entryIndex, statuscount, re_groupno, re_seq) {
		
		var rereValue = $("#reReValue"+entryIndex).val();
		
		if (${sessionScope.loginUser == null}) {
			
			location.href="/resns/writeReRe.re";
			
		}
		
		
		if ($.trim(rereValue) == "") {
			
			swal("내용을 입력하세요.");
			
			event.preventDefault();
			
		}
		

		var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val(),
					"re_groupno" : re_groupno, "re_seq" : re_seq, "re_content" : rereValue
					};
		  
		  $.ajax({
			  
			  url: "/resns/writeReRe.re",
			  type: "GET",
			  data: form_data,
			  dataType: "JSON",
			  success: function(data) {
				  
				swal(data.msg);
				  
				VeiwRe(statuscount);
				reCounting(statuscount);
				  
			  }, error: function() {
				  
			  }
			  
			  
		  }); 
	}

	

</script>


</head>
<body>
<br/>
<br/>
<div style="padding-left: 10%;">


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



<c:forEach var="vo" items="${followBoard}" varStatus="status">
<table style="width: 800px; border: solid 0px red; background-color: #EAE7E7;" >   
 
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>

    
    <tr>
		<td width="30px" height="50px">&nbsp;</td>
        <td colspan ="2" width="740px" height="50px"><img width="50px" height="50px" class=" img-circle" style="margin-right: 10px;" src="<%= request.getContextPath() %>/resources/images/${vo.follow_proile_image}"/>
        <a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${vo.follow_id}">${vo.follow_name}</a>
        <input type="hidden" id="seq_tbl_board${status.count}" name="seq_tbl_board" value="${vo.seq_tbl_board}">
        <input type="hidden" id="fk_login_id${status.count}" name="fk_login_id" value="${vo.follow_id}">
        <input type="hidden" id="login_id${status.count}" name="login_id" value="${loginUser.login_id}">
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
        <td width="320px" height="40px" style="text-align: right;"><img
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
	<strong id="reCnt${status.count}">댓글${vo.board_recnt}개</strong>
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
        <td width="740px" colspan="2"><input class="reSubmit" type="text" id="re_content${status.count}"/>&nbsp;&nbsp;<button  type="button" class="rebutton" onclick="writeRe('${status.count}');">댓글쓰기</button></td>
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


<c:if test="${followBoard != null && not empty followBoard}">
<div style="position: relative; left: 30%; ">
${pagebar}
</div>
</c:if>


<br/>
<br/>

</body>
</html>