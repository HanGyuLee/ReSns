<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-ui.js"></script> 

<title>Insert title here</title>
<style type="text/css">


@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1166 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;
  position: relative;
  float: left;
  margin: 10px 1.5%;
  min-width: 400px;
  max-width: 400px;
  min-height: 300px;
  max-height: 300px;
  width: 100%;
  height : 100%;
  background: #ffffff;
  color: #000000;
  text-align: left;
}
figure.snip1166 * {
  -webkit-box-sizing: padding-box;
  box-sizing: padding-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1166 img {
  opacity: 1;
  width: 100%;
  min-width: 400px;
  max-width: 400px;
  min-height: 300px;
  max-height: 300px;
  vertical-align: top;
  -webkit-transition: opacity 0.4s;
  transition: opacity 0.4s;
}
figure.snip1166 figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
figure.snip1166 figcaption > div {
  height: 70%;
  overflow: hidden;
  width: 100%;
  position: absolute;
  bottom: 0;
}
figure.snip1166 h3,
figure.snip1166 p {
  margin: 0;
  position: absolute;
  right: 0;
}
figure.snip1166 h3 {
  padding: 0 30px 0 15px;
  color: #ffffff;
  background-color: #1a1a1a;
  display: inline-block;
  font-weight: 400;
  line-height: 40px;
  text-transform: uppercase;
  top: 30%;
  right: 0;
  left: 30px;
  z-index: 1;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}
figure.snip1166 h3 span {
  font-weight: 400;
}
figure.snip1166 h3:after,
figure.snip1166 h3:before {
  border-style: solid;
  content: '';
  position: absolute;
  left: 100%;
}
figure.snip1166 h3:after {
  border-width: 40px 0 0 12px;
  border-color: transparent transparent transparent #1a1a1a;
  top: 0;
}
figure.snip1166 h3:before {
  border-width: 12px 12px 0 0;
  border-color: #000000 transparent transparent transparent;
  top: 100%;
}
figure.snip1166 p {
  padding: 8px 45px;
  opacity: 0;
  font-size: 0.9em;
  font-weight: 500;
  left: 0;
  -webkit-transform: translate3d(0%, -150%, 0);
  transform: translate3d(0%, -150%, 0);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
figure.snip1166 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
}
figure.snip1166.blue h3 {
  background-color: #2980b9;
}
figure.snip1166.blue h3:after {
  border-color: transparent transparent transparent #2980b9;
}
figure.snip1166.blue h3:before {
  border-color: #123851 transparent transparent transparent;
}
figure.snip1166.red h3 {
  background-color: #c0392b;
}
figure.snip1166.red h3:after {
  border-color: transparent transparent transparent #c0392b;
}
figure.snip1166.red h3:before {
  border-color: #581a14 transparent transparent transparent;
}
figure.snip1166.green h3 {
  background-color: #27ae60;
}
figure.snip1166.green h3:after {
  border-color: transparent transparent transparent #27ae60;
}
figure.snip1166.green h3:before {
  border-color: #104627 transparent transparent transparent;
}
figure.snip1166.orange h3 {
  background-color: #e67e22;
}
figure.snip1166.orange h3:after {
  border-color: transparent transparent transparent #e67e22;
}
figure.snip1166.orange h3:before {
  border-color: #7b410e transparent transparent transparent;
}
figure.snip1166.navy h3 {
  background-color: #34495e;
}
figure.snip1166.navy h3:after {
  border-color: transparent transparent transparent #34495e;
}
figure.snip1166.navy h3:before {
  border-color: #07090c transparent transparent transparent;
}
figure.snip1166:hover img,
figure.snip1166.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}
figure.snip1166:hover figcaption h3,
figure.snip1166.hover figcaption h3 {
  -webkit-transform: translateY(-100%);
  transform: translateY(-100%);
}
figure.snip1166:hover figcaption p,
figure.snip1166.hover figcaption p {
  opacity: 0.8;
  -webkit-transform: translateY(0);
  transform: translateY(0);
}


</style>


<script type="text/javascript">

$(document).ready(function(){
	
	 $(".hover").mouseleave(
			    function () {
			      $(this).removeClass("hover");
			    }
			  );
	
});


function showDetail(statuscount) {
	
	$("#hearted"+statuscount).hide();
	$("#heart"+statuscount).show();
	
	 if (${sessionScope.loginUser != null}) {	// 로그인 했을 때
	
		var form_data = {"login_id" : $("#login_id"+statuscount).val(), "seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};
		
		
		$.ajax({
			
			url: "/resns/heartCheck.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
				
				if (data.fk_login_id == null) {	// 데이터가 없으면 흰 하트
					$("#hearted"+statuscount).hide();
					$("#heart"+statuscount).show();
					
				}
				else if (data.fk_login_id != null) {	// 하트 찍은 적이 있으면 까만 하트
					$("#heart"+statuscount).hide();
					$("#hearted"+statuscount).show();
				
					
				}
			
			
			}, error: function() {
				
			}
		});
	}
	

	showUser(statuscount);
	showRe(statuscount);
	showTag(statuscount);
	showLoc(statuscount);
	heartCounting(statuscount);
	reCounting(statuscount);
	
	
}


 function showUser(statuscount) {
	
	var form_data = {"fk_login_id" : $("#fk_login_id"+statuscount).val()};

		$.ajax({
			
			url: "/resns/showUser.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
				
				var login_name = data.login_name;
				var uimg_profile_filename = data.uimg_profile_filename;
				
				var result = "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 30px; height: 30px;'>&nbsp;&nbsp;"+login_name;
				
				$("#showUser"+statuscount).html (result);
				
			}, error: function() {
				
			}
			
		});
	
}

 function showRe(statuscount) {
	
	var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};

		$.ajax({
			
			url: "/resns/reList.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
				
				if (data.length != null) {
					
					var result = "";
					
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
					
						
						result += "<div>";
						
						if(re_depthno == 0) {
							result += "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;'/>";
							result += "<span style='font-weight: bold;'>"+login_name+"</span>";
							result += "<a href='/resns/reportingBoard.re?re_id="+re_id+"'>";
							result += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' />";
							result += "</a>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								result +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+")' style='width: 15px; height: 15px; cursor: pointer;' align='right' />";
							}
							
							result += "<img src='resources/images/reoption.png' align='right' style='width: 15px; height: 15px; cursor: pointer;' onclick='runEffect("+entryIndex+")' /><br/>";
							result += "<div id='reReply"+entryIndex+"'>";
							result += "<input type='text' id='reReValue"+entryIndex+"' />";
							result += "<button onclick='writeReRe("+entryIndex+","+statuscount+","+re_groupno+","+re_seq+")'>입력</button>";
							result += "</div>";
							result += re_content;
						}
						else if (re_depthno == 1) {
						
							result += "<div style='margin-left: 15px;'>";
							result += "<img src='resources/images/rere.png' style='width: 20px; height: 20px;' />";
							result += "<img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 25px; height: 25px;' />";
							result += "<span style='font-weight: bold;'>"+login_name+"</span>";
							
							if ('${sessionScope.loginUser.login_id}' == re_id){
								result +="<img src='resources/images/delete.png' onclick='deleteRe("+re_seq+","+re_groupno+","+re_depthno+","+statuscount+")' style='width: 15px; height: 15px;' align='right' />";
							}
							
							result += "<a href='/resns/reportingBoard.re?re_id="+re_id+"'>";
							result += "<img src='resources/images/report.png' align='right' style='width: 15px; height: 15px;' /><br/>";
							result += "</a>";
							result += "<div style='margin-left: 20px;'>"+re_content+"</div>";
							result += "</div>";
							
						}
						result += "</div>";
						
					});
				}
				
				$("#reList"+statuscount).html(result);
			
			
				
			}, error: function() {
				
				
				alert(".");
				
			}
			
		});
	
}

function showTag(statuscount) {
	
	var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};

		$.ajax({
			
			url: "/resns/tagList.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
			
				if (data.length != null) {

					var result = "";
					
					$.each(data, function(entryIndex, entry){
						
						var seq_tbl_tag = entry.seq_tbl_tag;
						var tag_content = entry.tag_content;
						
						var sub_tag_content = tag_content.substring(1);

						result += "<a href='/resns/searchEndTag.re?search="+sub_tag_content+"'>";
						result += "<span style='font-weight: bold;'>"+tag_content+"</span>";
						result += "</a>";

						
					});
				}
					
				$("#tagList"+statuscount).html(result);
				
			}, error: function() {
				
			}
			
		});
	
}  

 function showLoc(statuscount) {
	 
	
	var form_data = {"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};

		$.ajax({
			
			url: "/resns/showLoc.re",
			type: "GET",
			data: form_data,  
			dataType: "JSON", 
			success: function(data) {
							
				var map_name = data.map_name;
				
				
				var result = "<span style='font-weight: bold; font-size: 9pt;'>"+map_name+"</span>";
			
				
				$("#showLoc"+statuscount).html(result);
				
			}, error: function() {
				
			}
			
		});
	
}
 
 
function addHeart(statuscount) {
	
	
	var form_data = {"fk_login_id" : $("#fk_login_id"+statuscount).val(),
					"seq_tbl_board" : $("#seq_tbl_board"+statuscount).val()};
	
	if (${sessionScope.loginUser == null}) {
		
		location.href="/resns/addHeart.re";
		
	}
	
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
	
	if (${sessionScope.loginUser == null}) {
		
		location.href="/resns/deleteHeart.re";
		
	}
	 
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
				
				showRe(statuscount);
				reCounting(statuscount);
			}, error: function() {
				
			}
			
		});
	}
	else if (${sessionScope.loginUser == null}) {
		location.href="/resns/writeReply.re";
	}
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
			  
			showRe(statuscount);
			reCounting(statuscount);
			  
		  }, error: function() {
			  
		  }
		  
		  
	  }); 
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
			
			showRe(statuscount);
			reCounting(statuscount);
			
		}, error: function() {
			
		}
		
	});
	
}


function runEffect(entryIndex) {

    // Most effect types need no options passed by default
    var options = {};
    
    // Run the effect
   $( "#reReply"+entryIndex ).toggle( "blind", options, 500 ); 
  };
  
</script>

</head>
<body>

	<!-- <section> --> <c:forEach items="${boardList}" var="map"
		varStatus="status">

		<%-- <div class="container gal-container">
			<div class="col-md-8 col-sm-12 co-xs-12 gal-item">
				<div class="box">
					<a href="#" data-toggle="modal" data-target="#${status.count}">
						<img id="popBoard${status.count}"
						src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}"
						style="width: 300px; height: 300px;"
						onclick="showDetail('${status.count}');">
					</a> --%>

					<figure class="snip1166">
					  <img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" id="popBoard${status.count}"/>
					  <figcaption>
					    <h3>social net service :: re</h3>
					    <div>
					      <p>좋아요 ${map.BOARD_HEART}개</p>
					    </div><a href="#" data-toggle="modal" data-target="#${status.count}" onclick="showDetail('${status.count}');"></a>
					  </figcaption>
					</figure>

					<div class="modal fade" id="${status.count}" tabindex="-1"
						role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content" style="width: 800px; height: 500px;">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<div class="modal-body">
									<div
										style="width: 68%; height: 350px; border: 1px solid blue; float: left;">
										<div id="showUser${status.count}" align="right"></div>
										<img
											src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}"
											style="width: 400px; height: 300px;">


									</div>
									<div
										style="border: 1px solid red; width: 30%; height: 350px; float: right;">
										<span style="font-weight: bold;" id="reCnt${status.count}"></span>
										<div id="reList${status.count}" style="overflow-y:scroll; height: 300px;"></div>
									</div>
									<div
										style="border: 1px solid green; width: 68%; height: 120px; float: left;">

										<img
											src="<%=request.getContextPath()%>/resources/images/user_location_black.png"
											style="width: 16px; height: 16px;" /> <span
											id="showLoc${status.count}"></span>
										<c:if test="${loginUser.login_id == map.FK_LOGIN_ID}">
											<a href="/resns/deleteBoard.re?seq_tbl_board=${map.SEQ_TBL_BOARD}">
											<img
												src="<%=request.getContextPath()%>/resources/images/delete.png"
												style="width: 18px; height: 18px;" align="right" />
											</a>	
										</c:if>
										<%-- <c:if test="${loginUser.login_id != null}"> --%>
											<a href="/resns/reportingBoard.re?fk_login_id=${map.FK_LOGIN_ID}&seq_tbl_board=${map.SEQ_TBL_BOARD}">
												<img
													src="<%=request.getContextPath()%>/resources/images/report.png"
													style="width: 18px; height: 18px;" align="right" /> 
											</a>	
											<img
												src="<%=request.getContextPath()%>/resources/images/hearted.png"
												id="hearted${status.count}"
												style="width: 18px; height: 18px; cursor: pointer;"
												align="right" onclick="deleteHeart('${status.count}');" /> 
											<img
												src="<%=request.getContextPath()%>/resources/images/heart.png"
												id="heart${status.count}"
												style="width: 18px; height: 18px; cursor: pointer;"
												align="right" onclick="addHeart('${status.count}');" />
										<%-- </c:if>		 --%>
										<span id="heartCnt${status.count}" style="font-weight: bold; font-size: 9pt;"></span>
										<br /> <span style="line-height: 180%;">${map.BOARD_CONTENT}</span><br />
										<br />
										<div id="tagList${status.count}"></div>
									</div>
									<div
										style="border: 1px solid purple; width: 30%; height: 120px; float: right;">
									<%-- <c:if test="${loginUser.login_id != null}"> --%>
										<button onclick="writeRe('${status.count}');">입력</button>
										<input type="text" id="re_content${status.count}" />
									<%-- </c:if> --%>	

									</div>
									
								</div>
								<div class="col-md-12 description"></div>
							</div>
						</div>
					</div>
			<!-- 	</div>
			</div>
		</div> -->
		<input type="hidden" id="seq_tbl_board${status.count}"
			value="${map.SEQ_TBL_BOARD}" />
		<input type="hidden" id="fk_login_id${status.count}"
			value="${map.FK_LOGIN_ID}" />
		<input type="hidden" id="login_id${status.count}"
			value="${loginUser.login_id}" />
	</c:forEach><!-- </section> -->
</body>
</html>