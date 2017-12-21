<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.InetAddress" %>

<%-- ===== #37.  tiles 중 header 페이지 만들기  ===== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/webapp/resources/js/json2.js"></script>


<%  
    // === 서버 IP 주소 알아오기 === //
	InetAddress inet = InetAddress.getLocalHost();
	String serverIP = inet.getHostAddress(); 
	int portnumber = request.getServerPort();
	
	String serverName = "http://"+serverIP+":"+portnumber;

%>


<style type="text/css">
.nav-tabs{
	border-bottom:0px;
}

</style>
<script type="text/javascript">



$(document).ready(function(){
	
	
	//SEARCHNAME
	$("#displayList").hide();

	$("#search").keyup(function() {
		
		var form_data = { "search"  : $("#search").val() };
		 
		$.ajax({
			url: "/resns/searchJsonName.re",
			type: "GET",
			data: form_data, 
			dataType: "JSON", 
			success: function(data) {
				
				
				if(data.length > 0) { // 검색된 데이터가 있는 경우라면
					
					
					
					var resultHTML = "";
				
					$.each(data, function(entryIndex, entry){
						var jsonName = entry.jresult[entryIndex].loginName;
						var sname = entry.sname;
						var jnameCnt = entry.jnameCnt
						
						
						resultHTML += "<span style='color:navy; font-weight:bold; margin-left: -300px;'>별명검색</span> "+"<span style='cursor:pointer;'><a href='searchEndName.re?search="+sname+"'>"+"&nbsp;&nbsp;"+sname +"</a>"+jnameCnt+"</span><br/>"; 
						
					});
					
					$("#displayList").html(resultHTML);
					$("#displayList").show();
				}
				else {
					// 검색된 데이터가 존재하지 않는 경우라면
					$("#displayList").hide();
					
				} // end of if ~ else ----------------
				
			}, // end of success: function()----------
			
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
		
	}); // end of keyup(function(){})-----------------
	
	$("#displayList").click(function(event){
		alert("Test");
		var jName = "";
		var $target = $(event.target);

		if($target.is(".first")) {
			jName = $target.text() + $target.next().text() + $target.next().next().text();
			
		}
		else if($target.is(".second")) {
			jName = $target.prev().text() + $target.text() + $target.next().text();
			
		}
		else if($target.is(".third")) {
			jName = $target.prev().prev().text() + $target.prev().text() + $target.text();	
		}
		
		$("#search").val(jName); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		$("#displayList").hide();
	});
	
	// SEARCHTAG
	$("#displayListTag").hide();

	$("#search").keyup(function() {
		
		var form_data = { "search"  : $("#search").val() };
		 
		$.ajax({
			url: "/resns/searchJsonTag.re",
			type: "GET",
			data: form_data, 
			dataType: "JSON", 
			success: function(data) {
				
				
				if(data.length > 0) { // 검색된 데이터가 있는 경우라면
					
					
					
					var resultHTML = "";
				
					$.each(data, function(entryIndex, entry){
						var jtag = entry.jTagList;
						var stag = entry.stag;
						var jtagCnt = entry.jtagCnt
						
						
						resultHTML += "<span style='color:navy; font-weight:bold; margin-left: -50px;'>#</span>"+"<span style='cursor:pointer;'><a href='searchEndTag.re?search="+stag+"'>"+"&nbsp;&nbsp;"+stag+"</a>"+"&nbsp;&nbsp;"+jtagCnt+"</span><br/>"; 
						
					});
					
					$("#displayListTag").html(resultHTML);
					$("#displayListTag").show();
				}
				else {
					// 검색된 데이터가 존재하지 않는 경우라면
					$("#displayListTag").hide();
					
				} // end of if ~ else ----------------
				
			}, // end of success: function()----------
			
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
		
	}); // end of keyup(function(){})-----------------
	

	$("#displayListTag").click(function(event){
		var jTagList = "";
		var $target = $(event.target);
		
		if($target.is(".first")) {
			jTagList = $target.text() + $target.next().text() + $target.next().next().text();
		}
		else if($target.is(".second")) {
			jTagList = $target.prev().text() + $target.text() + $target.next().text();
		}
		else if($target.is(".third")) {
			jTagList = $target.prev().prev().text() + $target.prev().text() + $target.text();
		}
		
		$("#search").val(jTagList); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		$("#displayListTag").hide();
	});

	
	// SEARCHMAP
	$("#displayListMap").hide();

	$("#search").keyup(function() {
		
		var form_data = { "search"  : $("#search").val() };
		 
		$.ajax({
			url: "/resns/searchJsonMap.re",
			type: "GET",
			data: form_data, 
			dataType: "JSON", 
			success: function(data) {
				
				
				if(data.length > 0) { // 검색된 데이터가 있는 경우라면
					
					
					
					var resultHTML = "";
				
					$.each(data, function(entryIndex, entry){
						var jmaplist = entry.jMapList[entryIndex].mapName;
						var smap = entry.smap;
						var jMapCnt = entry.jMapCnt
						
						resultHTML += "<span style='color:navy; font-weight:bold; margin-left: -120px;'>지도검색</span>"+"<span style='cursor:pointer;'><a href='searchEndMap.re?search="+smap+"'>"+"&nbsp;&nbsp;"+smap+"&nbsp;&nbsp;"+"</a>"+"&nbsp;&nbsp;"+jMapCnt+"</span><br/>"; 
					
					});
					
					$("#displayListMap").html(resultHTML);
					$("#displayListMap").show();
				}
				else {
					// 검색된 데이터가 존재하지 않는 경우라면
					$("#displayListMap").hide();
					
				} // end of if ~ else ----------------
				
			}, // end of success: function()----------
			
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
		
	}); // end of keyup(function(){})-----------------
	

	$("#displayListMap").click(function(event){
		var jmap = "";
		var $target = $(event.target);
		
		if($target.is(".first")) {
			jmap = $target.text() + $target.next().text() + $target.next().next().text();
		}
		else if($target.is(".second")) {
			jmap = $target.prev().text() + $target.text() + $target.next().text();
		}
		else if($target.is(".third")) {
			jmap = $target.prev().prev().text() + $target.prev().text() + $target.text();
		}
		
		$("#search").val(jmap); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		$("#displayListMap").hide();
	});
	
	
	////////////////////////////////////////////////////////////////////////////
	// SEARCH ALL NAMEs (WHEN YOU SELECT ONE PERSON ON LIST!)
	$("#displayListAllName").hide();

	$("#search").keyup(function() {
		
		var form_data = { "search"  : $("#search").val() };
		 
		$.ajax({
			url: "/resns/searchJsonNameOne.re",
			type: "GET",
			data: form_data, 
			dataType: "JSON", 
			success: function(data) {
				
				
				if(data.length > 0) { // 검색된 데이터가 있는 경우라면
					
					
					
					var resultHTML = "";
				
					$.each(data, function(entryIndex, entry){
						var jnone = entry.jnone;
						
						resultHTML += "<span style='color:navy; font-weight:bold; margin-left: -120px;'>별명검색</span>"+"<span style='cursor:pointer;'><a href='searchEndNameOne.re?search="+jnone+"'>"+jnone+"</a>"+"</span><br/>"; 
					
					});
					
					$("#displayListAllName").html(resultHTML);
					$("#displayListAllName").show();
				}
				else {
					// 검색된 데이터가 존재하지 않는 경우라면
					$("#displayListAllName").hide();
					
				} // end of if ~ else ----------------
				
			}, // end of success: function()----------
			
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); // end of $.ajax()------------------------
		
	}); // end of keyup(function(){})-----------------
	

	$("#displayListAllName").click(function(event){
		var jmap = "";
		var $target = $(event.target);
		
		if($target.is(".first")) {
			jmap = $target.text() + $target.next().text() + $target.next().next().text();
		}
		else if($target.is(".second")) {
			jmap = $target.prev().text() + $target.text() + $target.next().text();
		}
		else if($target.is(".third")) {
			jmap = $target.prev().prev().text() + $target.prev().text() + $target.text();
		}
		
		$("#search").val(jmap); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		$("#displayListAllName").hide();
	});
	
	


});//document






</script>
<form name ="searchFrm">
<div align="center" >
	<ul class="nav nav-tabs mynav">
		
	
		<li style="margin-left:3%; "><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/home.png"></a></li>
		
		
		<li style="margin-left:34%; margin-top:10px; "><img src="<%=request.getContextPath()%>/resources/images/search.png"><input name="search" id="search" type="text" placeholder="검색해주세요:)" value="" /></li>
	   <!-- ===== #147. Ajax로 검색어 입력시 자동글 완성하기 관련 추가하기 1 ===== -->
	   
	   <div style="padding-top: 49px ">
         <div id="displayList" style="width:312px; margin-left:70px; border-top: 0px; border: solid gray 0px;">
		</div>
		<div id="displayListTag" style="width:312px; margin-left:57px; border-top: 0px; border: solid gray 0px;">
		</div>
		<div id="displayListMap" style="width:312px; margin-left:-100px; border-top: 0px; border: solid gray 0px;">
		</div>
		<div id="displayListAllName" style="width:312px; margin-left:-100px; border-top: 0px; border: solid gray 0px;">
		</div>
      </div>
<!-- <span style="margin-left: -10"></span> -->

		<li class="dropdown" style="margin-left:85%; margin-top:-50px; display:inline;"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png"> <span class="caret"></span></a>
			<ul class="dropdown-menu">
			
			<c:if test="${sessionScope.loginuser != null && not empty alarmList}">
				<c:forEach var="alarmvo" items="alarmList">
					<li><a href="<%=request.getContextPath()%>/alarm/alarmList.re">${alarmList}</a></li>
				</c:forEach>
						</c:if>	
				<li><img src="<%=request.getContextPath()%>/resources/images/user_black.png">친구가 팔로우함 </li>
				<li><img src="<%=request.getContextPath()%>/resources/images/follow_black.png">새로운팔로워</li>
			 
		</ul></li>
		<li style="margin-left:85%;margin-top:10px; margin-top:-60px; display:inline;"><a href="<%=request.getContextPath()%>/mypage.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png"></a></li>
		
		<!-- ===== #52. 로그인 성공한 사용자 성명 출력하기. ===== -->
		<c:if test="${sessionScope.loginuser.status < 9 }">
		<li style="margin-left: 35%; margin-top: 1%;">
		♥ 환영합니다~ <span style="color: navy; font-weight: bold;">${sessionScope.loginuser.login_name}</span> 님  ♥
		</li>
		</c:if>
		
		<c:if test="${sessionScope.loginuser.status >= 9}">
		<li style="margin-left: 15%; margin-top: 1%;">
		♥ 환영합니다~ <span style="color: navy; font-weight: bold;">${sessionScope.loginuser.login_name}</span> 님 ♥
		</li>
		</c:if>
		
	</ul>
		
</div>


</form>