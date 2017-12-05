<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">


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
					
					var result = "<img src='resources/images/"+uimg_profile_filename+"' style='width: 30px; height: 30px;'>&nbsp;&nbsp;"+login_name;
					
					$("#showUser"+statuscount).html(result);
					
				}, error: function() {
					
				}
				
			});
		
	}
	
	 function showRe(statuscount) {
		
		/* var data = $("#seq_tbl_board"+statuscount).val();
		alert(data); */
		
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
								result += "<img src='/resources/images/"+uimg_profile_filename+"' style='width: 30px; height: 30px;'/>";
								result += "<span style='font-weight: bold;'>"+login_name+"<br/><br/>"+re_content+"</span>";	
							}
							else if (re_depthno == 1) {
							
								result += "<div style='margin-left: 30px;'>";
								result += "<img src='/resources/images/"+uimg_profile_filename+"' style='width: 30px; height: 30px;' />";
								result += "<span style='font-weight: bold;'>"+login_name+"<br/><br/>"+re_content+"</span>";
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
							
							result += "<span style='font-weight: bold;'>"+tag_content+"</span>";	

							
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
					
					var result = "<span style='font-weight: bold; font-size: 9pt;'>"+data.map_name+"</span>";
				
					
					$("#showLoc"+statuscount).html(result);
					
				}, error: function() {
					
				}
				
			});
		
	}
	 
	 
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
			
				
			}, error : function () {
				
			}
			
			
		});
		
		
	}
	
	function deleteHeart(statuscount) {
		
		swal({
		    title: "좋아요를 취소하시겠습니까?",
		    text: "취소 후 다시 좋아요를 누를 수 있습니다.",
		    type: "warning",
		    showCancelButton: true,
		    confirmButtonColor: '#DD6B55',
		    confirmButtonText: '취소하기',
		    cancelButtonText: "뒤로가기",
		    closeOnConfirm: false,
		    closeOnCancel: false
		 },
		 function(isConfirm){

		   if (isConfirm){
			   
			 /* $.ajax ({
				 
				 url: "/resns/deleteHeart.re",
				 type: "GET",
				 data: form_data,
				 dataType: "JSON",
				success: function(data) {
					
				$("#heart"+statuscount).hide();
				$("#hearted"+statuscount).show();
						
				swal(data.msg);
				
					
				}, error : function () {
					
				}
				 
			 }); */
			 
			   
		     swal("취소되었습니다!", "하트가 정상적으로 취소되었습니다.", "success");

		    } else {
		      swal("하트가 취소되지 않았습니다.", "", "error");
		    }
		 });
		
	}
	 


</script>
</head>
<body>

	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<section> <c:forEach items="${boardList}" var="map"
		varStatus="status">

		<div class="container gal-container">
			<div class="col-md-8 col-sm-12 co-xs-12 gal-item">
				<div class="box">
					<a href="#" data-toggle="modal" data-target="#${status.count}">
						<img id="popBoard${status.count}"
						src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}"
						style="width: 300px; height: 300px;"
						onclick="showDetail('${status.count}');">
					</a>
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
										<span style="font-weight: bold;">댓글 ${map.BOARD_RECNT}개</span>
										<div id="reList${status.count}"></div>
									</div>
									<div
										style="border: 1px solid green; width: 68%; height: 120px; float: left;">

										<img
											src="<%=request.getContextPath()%>/resources/images/user_location_black.png"
											style="width: 16px; height: 16px;" /> 
										<span id="showLoc${status.count}"></span>
										<c:if test="${loginUser.login_id == map.FK_LOGIN_ID}">
										<img 
											src="<%=request.getContextPath()%>/resources/images/delete.png" 
											style="width: 18px; height: 18px;" 
											align="right"/>
										</c:if>
										<img 
											src="<%=request.getContextPath()%>/resources/images/report.png" 
											style="width: 18px; height: 18px;" 
											align="right"/>
									
										<img 
											src="<%=request.getContextPath()%>/resources/images/hearted.png" id="hearted${status.count}"
											style="width: 18px; height: 18px; cursor: pointer;" 
											align="right"
											onclick="deleteHeart('${status.count}');"/>
										<img 
											src="<%=request.getContextPath()%>/resources/images/heart.png" id="heart${status.count}" 
											style="width: 18px; height: 18px; cursor: pointer;" 
											align="right"
											onclick="addHeart('${status.count}');"/>
										
										<span style="font-size: 9pt; text-align: right;">좋아요 ${map.BOARD_HEART}개</span>
											<br /> <span
											style="line-height: 180%;">${map.BOARD_CONTENT}</span><br />
										<br />
										<div id="tagList${status.count}"></div>
									</div>
									<div
										style="border: 1px solid purple; width: 30%; height: 120px; float: right;">

										<form id="writeReFrm${status.count}" method="post"
											action="/resns/writeReply.re">

											<button>입력</button>
											<input type="text" />

										</form>
									</div>
								</div>
								<div class="col-md-12 description"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="seq_tbl_board${status.count}"
			value="${map.SEQ_TBL_BOARD}" />
		<input type="hidden" id="fk_login_id${status.count}"
			value="${map.FK_LOGIN_ID}" />
		<input type="hidden" id="login_id${status.count}"
			value="${loginUser.login_id}" />
	</c:forEach> </section>
</body>
</html>