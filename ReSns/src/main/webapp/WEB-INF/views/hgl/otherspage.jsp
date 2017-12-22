<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Someone's PAGE</title>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-ui.js"></script> 


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Ribeye">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/resources/style/hglStyle.css">

<style type="text/css">


.banner-section {
	
	background-image: 
		url("<%=request.getContextPath()%>/resources/images/${profile.uimg_header_filename}");
	 
	background-size: cover;
	height: 380px;
	left: 0;
	position: absolute;
	top: 8px;
	background-position: 0;
	
}



.th{
	background-color:lightgrey;
    padding:13px;
    font-size:17pt;
    text-align:center;
}
.table {
	margin-top:30px;
	width:350px;
    border-bottom: 1px solid lightgrey;
    border-collapse:collapse;
    
}
.td{
	padding:13px;
    text-align:center;
    font-size:20pt;
    font-weight:bold;
}


</style>


<script type="text/javascript">

$(function(){
	
	
	
	
	
	/* ------------------------------------------------------------------------------------ */
	
	
	
	
	
	
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
	
 

	
	
	
	/* ------------------------------------------------------------------------------------ */
	
	
	
	
	$(".clickhide").click(function(){
		$(".hidemodal").modal('hide');
		
	});
	
	

	

	


	
    /* BOOTSNIPP FULLSCREEN FIX */
    if (window.location == window.parent.location) {
        $('#back-to-bootsnipp').removeClass('hide');
    }
    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
    });
    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
        event.preventDefault();
        $('#cant-do-all-the-work-for-you').modal('show');
    })
    
    $('[data-command="toggle-search"]').on('click', function(event) {
        event.preventDefault();
        $(this).toggleClass('hide-search');
        
        if ($(this).hasClass('hide-search')) {        
            $('.c-search').closest('.row').slideUp(100);
        }else{   
            $('.c-search').closest('.row').slideDown(100);
        }
    })
    
    $('#contact-list').searchable({
        searchField: '#contact-list-search',
        selector: 'li',
        childSelector: '.col-xs-12',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
    
    $('#back-to-top').tooltip('show');
});


	

function goFollower(num,followId){
	
	alert("확인");
	var frm = document.follower;

	frm.followId.value=followId;
	frm.method = "post";
	frm.action = "/resns/followAddEnd.re";
	frm.submit();
	
}

function goFollowing(num,followId){
	
	alert("확인");
	var frm = document.following;

	frm.followId.value=followId;
	frm.method = "post";
	frm.action = "/resns/followAddEnd.re";
	frm.submit();
	
}

/* ------------------------------------------------------------------- */





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
							re += "<span style='font-weight: bold;'>"+login_name+"</span>";
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
							re += "<span style='font-weight: bold;'>"+login_name+"</span>";
							
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

	
	
	
	
	












/* ------------------------------------------------------------------- */


</script>


</head>

<body>

	<section class="banner-section" style="border:1px solid transparent; margin-top:-8px;"> </section>
	<section class="post-content-section">
	<div class="container" style="border:1px solid transparent; ">

		<!--  <div class="row" style="border:1px solid green"> -->
			<div class="col-lg-12 col-md-12 col-sm-12 post-title-block">

				<h1 class="text-center tangerine" >${mypage.textinput}</h1>
				<ul class="list-inline text-center" style="font-size:20pt; font-weight:bold;">
					
				</ul>
			</div>
			
			<div style="width:100%; border:1px solid transparent;">	
			<div class="col-lg-9 col-md-9 col-sm-12" style="margin-top:70px; width:40%; height:150px;border:1px solid transparent;">
				<h4>${mypage.textarea}</h4>
			
		
			</div>	
			
			<div class="col-lg-9 col-md-9 col-sm-12 tangerine" align="center" style="margin-top:150px; width:23%; height:70px;border:1px solid transparent;">
				<h2>${username}</h2>
			</div>	
			<div  class="col-lg-9 col-md-9 col-sm-12 " align="center" style="float:right; margin-top:70px; width:30%; height:130px;border:1px solid transparent;">
				
				<table class="table">
				  <tr>
				    <th class="th">게시물</th>
				    <th class="th">팔로워</th>
				    <th class="th">팔로잉</th>
				  </tr>
				  <tr>
				    <td class="td">${myBoardCnt}</td>
				    <td class="td"><button type="button" class="mybutton" data-toggle="modal" data-target="#follower">${myFollowerCnt}</button></td>
				    <td class="td"> <button type="button" class="mybutton" data-toggle="modal" data-target="#following">${myFollowingCnt}</button></td>
				  </tr>
				  
				</table>	
				
			</div>	
		</div>
		<%-- <div style="width:80%; border:1px solid transparent;">	
			<div class="col-lg-9 col-md-9 col-sm-12 " style="margin-top:70px; width:50%; height:150px;border:1px solid transparent;">
				<h4>${mypage.textarea}</h4>
			
		
			</div>	
			
			<div class="col-lg-9 col-md-9 col-sm-12 ribeye" align="center" style="margin-top:150px; width:30%; height:70px;border:1px solid transparent;">
				<h2>${username}</h2>
			</div>	
				<div  class="col-lg-9 col-md-9 col-sm-12 " align="center" style="float:right; margin-top:70px; width:30%; height:130px;border:1px solid transparent;">
				
				<table class="table">
				  <tr>
				    <th class="th">게시물</th>
				    <th class="th">팔로워</th>
				    <th class="th">팔로잉</th>
				  </tr>
				  <tr>
				    <td class="td">${myBoardCnt}</td>
				    <td class="td"><button type="button" class="mybutton" data-toggle="modal" data-target="#follower">${myFollowerCnt}</button></td>
				    <td class="td"> <button type="button" class="mybutton" data-toggle="modal" data-target="#following">${myFollowingCnt}</button></td>
				  </tr>
				  
				</table>	
				
			</div>	
			
			
		</div> --%>
			
			
  
   <div style="margin-top:270px;margin-left:43%; border:1px solid transparent" >
	  
	   <img  style="position:absolute; border:4px solid white; width:200px; height:200px;" src="<%=request.getContextPath()%>/resources/images/${profile.uimg_profile_filename}" alt="Debbie Schmidt" class="img-responsive img-circle" />
	  
   </div>
  
  
 
    
   
     <div class="container gal-container" style="border:1px solid transparent;margin-top:300px;">
   
   
   <div style=" margin-top:-80px;float: left; width:100%; border:1px solid transparent; background-color:white;">
   <div data-spy="scroll" class="tabbable-panel" style="display:inline; border:1px solid transparent;">
        <div class="tabbable-line">
          <ul class="nav nav-tabs ">
            <li class="active">
              <a href="#tab_default_1" data-toggle="tab">
             	 게시물  </a>
            </li>
           
            <li>
              <a href="#tab_default_2" data-toggle="tab">
           		게시물(일자로)</a>
            </li>
           
            <li>
              <a href="#tab_default_3" data-toggle="tab">
           		  유투브</a>
            </li>
             <li>
              <a href="#tab_default_4" data-toggle="tab">
            	 문답</a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab_default_1">
 
   <c:if test="${not empty myBoardList}">
   
   <c:forEach var="board" items="${myBoardList}" varStatus="status" >
   <c:if test="${board.board_status.equals('0')}">
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box" style="height:280px;">
        <a href="#" data-toggle="modal" data-target="#bimg_filename${status.count}">
          <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}" >
        </a>
        <div class="modal fade" id="bimg_filename${status.count}" tabindex="-1" role="dialog"  >
          <div class="modal-dialog" role="document">
            <div class="modal-content" style="margin-top:170px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body" >
                <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
              </div>
                <div class="col-md-12 description" style="margin-top:-40px; height:80px;">
                  <h5>♡ 좋아요 ${board.board_heart}개<br/><br/>${board.board_content}</h5>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:if>
    </c:forEach>
    
    </c:if>
    
    <c:if test="${empty myBoardList}">
    
    
    <br/>
    <div align="left">
    	<span style="color:black; font-style:italic; font-weight:bold; font-size:16pt;">등록된 게시물이 없습니다.</span>
    	</div>
    <br/>
    <br/>
    
    
    </c:if>
   
            </div>
            <div class="tab-pane" id="tab_default_2">
              




   <c:if test="${not empty myBoardList}">
   



<c:forEach var="vo" items="${myBoardList}" varStatus="status">
<c:if test="${vo.board_status.equals('0')}">
<table align="center" style="width: 90%; border: solid 1px transparent; background-color: #F3F3F3;" >   
 
     <tr>
     <td width="30px">&nbsp;</td>
      <td width="740px" colspan="2" id="redisplay">&nbsp;</td>
       <td width="30px">&nbsp;</td> 
    </tr>

    
    <tr>
		<td width="30px" height="50px">&nbsp;</td>
         <td colspan ="2" width="740px" height="50px">
        <input type="hidden" id="seq_tbl_board${status.count}" name="seq_tbl_board" value="${vo.seq_tbl_board}">
        <input type="hidden" id="fk_login_id${status.count}" name="fk_login_id" value="${userid}">
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
        <td width="740px" colspan="2" height="500px" style="text-align: center;"><img style="max-height:550px;max-width:850px ;" src ="<%= request.getContextPath() %>/resources/images/${vo.bimg_filename}"/></td>
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
												class="heart"  class="heart" onclick="addHeart('${status.count}');" />
												<div style="display: inline-block;" id="heartCnt${status.count}"><span style="font-weight: bold;">좋아요 ${vo.board_heart}개</span></div> &nbsp;&nbsp;
		<%-- <a href="/resns/reportingBoard.re?fk_login_id=${vo.follow_id}&seq_tbl_board=${vo.seq_tbl_board}"> <img style="width: 18px; height: 18px; margin-right: 80px;"  src="<%=request.getContextPath()%>/resources/images/report.png" align="right" /> </a> --%>	
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

</c:if>
</c:forEach>

<div style="position: relative; left: 30%; ">
${pagebar}
</div>


  </c:if>
    
    <c:if test="${empty myBoardList}">
    
    
    <br/>
    <div align="left">
    	<span style="color:black; font-style:italic; font-weight:bold; font-size:16pt;">등록된 게시물이 없습니다.</span>
    	</div>
    <br/>
    <br/>
    
    
    </c:if>


            
                        </div>
            <div class="tab-pane" id="tab_default_3">
              <div id="music">
              <iframe style="border-style:none; width: 100%; height: 800px;" src="music.re?fk_login_id=${userid}"></iframe>
              
              </div>
             
            </div>
             <div class="tab-pane" id="tab_default_4" >
              <div id="question">
              <iframe style="border-style:hidden; width: 100%; height: 800px;" src="questionList.re?fk_login_id=${userid}"></iframe>
              
              </div>
            </div>
          </div>
        </div>
      </div>
  
 
  <div class="col-sm-4">
   <div class="panel panel-default">
   
</div>

 </div>
  
   
   
   </div>
 
  <div class="col-sm-4">
   <div class="panel panel-default">
   
</div>

 </div>
  
   
   
   </div>
   
   
   
    <div style="margin-top:-250px;float: right; width:26%; border:1px solid transparent;">
    
    
    
    <div class="col-lg-3  col-md-3 col-sm-12">
				
				
				<!-- 클릭하면 페이지로 이동하도록. -->

		 <div id="follower" class="modal fade bs-example-modal-sm hidemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-m">
               
        <div class="modal-body" style="padding:10px;padding-top:30px;">
            <div class="container" style="margin-top:100px;">

			
    <div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followers</span>
                   <ul class="pull-right c-controls">
                       
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->

                
                <c:if test="${not empty myFollowerList }">
                	<%-- 
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                                                
                            <span class="name">${follower.login_name}</span>
                            
                            <button type="button" id="btnFollow"  onClick="goFollow();" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${follower.fk_login_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                        </div>
                    </a> --%>
                  
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${follower.login_name}</span>
                      </a>          
                    <%--  <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                    <a class="btn icon-btn btn-success" id="btnFollower" onClick="goFollower('${status.count}','${follower.fk_login_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                    
                    
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                     <br/><span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                          
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                   
                  
                    </div>
                        <div class="clearfix"></div>
                          
                    </li>
                 
                    
                    
                    </c:forEach>
                    <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowerList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">아직 팔로워가 없습니다.^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                </ul>
            </div>
        </div>
	</div>


        </div>
          
            </div>
        </div>
    </div>
	



 <div id="following" class="modal fade bs-example-modal-sm hidemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-m">
               
        <div class="modal-body" style="padding:10px;padding-top:30px;">
            <div class="container" style="margin-top:100px;">
            
            
         
	<div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followings</span>
                   <ul class="pull-right c-controls">
                        
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->
                
                <c:if test="${not empty myFollowingList }">
                	  
                	<c:forEach var="following" items="${myFollowingList }" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                    <li class="list-group-item">
                    <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                     
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${following.uimg_profile_filename}" alt="${following.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${following.login_name}</span>
                            </a>
                     <%--  <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                    <a class="btn icon-btn btn-success" id="btnFollowing${status.count}" onClick="goFollowing('${status.count}','${following.follow_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                            
                    <%-- <button type="button" id="btnFollowing${status.count}"  onClick="goFollowing('${status.count}','${following.follow_id}');" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                     <input type="hidden" id="followingId" name="followId" value="${following.follow_id}"/>       
                         <br/>   <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${following.follow_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>

                        </div>
                       
                        
                        <div class="clearfix"></div>
                    </li>
                    </c:forEach>
                     <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowingList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;"> 다른 사람을 팔로잉 해보세요^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                    
                     
                </ul>
            </div>
        </div>
	</div>
	
	
	
            
            
            
            
            
</div></div></div></div>

	





<%-- 



<div class="container" style="margin-left:-330px;">

    <div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followers</span>
                   <ul class="pull-right c-controls">
                       
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->

                
                <c:if test="${not empty myFollowerList }">
                	
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                                                
                            <span class="name">${follower.login_name}</span>
                            
                            <button type="button" id="btnFollow"  onClick="goFollow();" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${follower.fk_login_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                        </div>
                    </a>
                  
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${follower.login_name}</span>
                      </a>          
                     <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                    <a class="btn icon-btn btn-success" id="btnFollower" onClick="goFollower('${status.count}','${follower.fk_login_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                    
                    
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                     <br/><span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                          
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                   
                  
                    </div>
                        <div class="clearfix"></div>
                          
                    </li>
                 
                    
                    
                    </c:forEach>
                    <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowerList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">아직 팔로워가 없습니다.^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                </ul>
            </div>
        </div>
	</div>
	
	
	<div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followings</span>
                   <ul class="pull-right c-controls">
                        
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->
                
                <c:if test="${not empty myFollowingList }">
                	  
                	<c:forEach var="following" items="${myFollowingList }" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                    <li class="list-group-item">
                    <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                     
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${following.uimg_profile_filename}" alt="${following.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${following.login_name}</span>
                            </a>
                      <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                    <a class="btn icon-btn btn-success" id="btnFollowing${status.count}" onClick="goFollowing('${status.count}','${following.follow_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                            
                    <button type="button" id="btnFollowing${status.count}"  onClick="goFollowing('${status.count}','${following.follow_id}');" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                     <input type="hidden" id="followingId" name="followId" value="${following.follow_id}"/>       
                         <br/>   <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${following.follow_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>

                        </div>
                       
                        
                        <div class="clearfix"></div>
                    </li>
                    </c:forEach>
                     <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowingList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;"> 다른 사람을 팔로잉 해보세요^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                    
                     
                </ul>
            </div>
        </div>
	</div>
	
	 --%>
	
    
    	<!-- JavaScrip Search Plugin -->
    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
 
   		   
	</div>
		
			
					
	</div>
    
    
    </div>
   
   
 
			
	
	<!-- /container --> </section>


<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" ><span class="glyphicon glyphicon-chevron-up"></span></a>

  <form name="follower">
  <input type="hidden" name="followId"/>	
  </form>
  <form name="following">
  <input type="hidden" name="followId"/>	
  </form>
</body>
</html>

