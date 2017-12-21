<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.InetAddress" %>

<%-- ===== #37.  tiles 중 header 페이지 만들기  ===== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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


/*scroll effect*/
.navbar-trans {
  background-color: transparent;
  border: none;
  transition: top 1s ease;
}
 
/*double row*/
.navbar-doublerow > .navbar{
	display: block;	
	padding: 0px auto;
	margin: 0px auto;
	min-height: 25px;
}
.navbar-doublerow .nav{
	padding: 0px auto;
}
.navbar-doublerow .dividline{
  margin: 5px 100px;
  padding-top: 1px;
  background-color: inherit;
}
/*top nav*/
.navbar-doublerow .navbar-top ul>li>a {
	padding: 10px auto;
	font-size: 12px;
} 
/*down nav*/
.navbar-doublerow .navbar-down .navbar-brand {
	padding: 0px auto;
	float: left;
	color: #fff;
	font-size: 32px;
}
.navbar-doublerow .navbar-down ul>li>a{
	font-size: 16px;
	color: #fff;
	transition: border-bottom .2s ease-in , transform .2s ease-in-out;
}
.navbar-doublerow .navbar-down ul>li>a:hover{
	border-bottom: 1px solid #fff;
	color: #fff;
}/* 
.navbar-doublerow .navbar-down .dropdown{
    padding: 5px;
    color: #000;
}
.navbar-doublerow .navbar-down .dropdown ul>li>a,
.navbar-doublerow .navbar-down .dropdown ul>li>a:hover{
  color: #000;
  border-bottom: none;
} */
.navbar-doublerow.navbar-trans.afterscroll {
}	
.navbar-doublerow.navbar-trans.afterscroll {
   top:-50px;
   background-image: url("<%= request.getContextPath() %>/resources/images/headerback.png");
}	

.flex-container {
    display: flex;
    justify-content: space-between;
}
.flex-item {
}
/*text*/
.text-white,.text-white-hover:hover{color:#fff!important}
/*fontcolor*/
.light-grey {color:#000!important;background-color:#E6E9ED!important}


.menuicon {

	width: 20px;
	height: 20px;

}




.nav>li>a:hover, .nav>li>a:focus, .nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
    background: transparent;
}
.dropdown {
    background:#fff;
    border:1px solid #ccc;
    border-radius:4px;
    width:300px ;    
}
.dropdown-menu>li>a {
    color:#428bca;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
    margin-top:20px;
    width:300px ;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #fff;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -10px;
    right: 16px;
    z-index: 10;
}
.dropdown ul.dropdown-menu:after {
    content: "";
    border-bottom: 12px solid #ccc;
    border-right: 12px solid transparent;
    border-left: 12px solid transparent;
    position: absolute;
    top: -12px;
    right: 14px;
    z-index: 9;
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





//toggle class scroll 
$(window).scroll(function() {
    if($(this).scrollTop() > 50)
    {
        $('.navbar-trans').addClass('afterscroll');
    } else
    {
        $('.navbar-trans').removeClass('afterscroll');
    }  

});

function show() {
	location.href="/resns/index.re";
	
}


function goAlarm(userid){
	   
    var form_data = {"userid" : userid};
    
  $.ajax({
        
        url: "/resns/myalarm.re",
        type: "GET",
        data: form_data,  
        dataType: "JSON", 
        success: function(data) {
        
           if (data.length != null) {

              var result = "";
              
              $.each(data, function(entryIndex, entry){
                 
                 
            	  var fk_login_id = entry.fk_login_id;
                  var alarm_type = entry.alarm_type;
                  var alarm_time = entry.alarm_time;
                  var url = entry.url;
                  var login_name = entry.login_name;
                  var imgsrc = entry.imgsrc;
                 
                 
                 
                 result += "<li><a href='"+url+"' style='text-decoration:none;'>";
                 result += "<img src='resources/images/profile0.png' style='width: 30px; height: 30px; display: inline;' class='img-responsive img-circle'/><span style='font-weight: bold;'>"+login_name+"님이 "+alarm_type+"</span></span><br/>";
                 result += alarm_time +"</a> </li><li class='divider'></li>";

                 
              });
           }
              
           $("#alarm").html(result);
           $("#alarm").show();   
           
        }, error: function() {
           
        }
        
     });
 
    
 }



</script>

<nav class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
  
  
  <!-- top nav -->
  <nav class="navbar navbar-top hidden-xs">
   
   <c:if test="${sessionScope.loginUser != null}">
   
	    <div class="header container">
	    
	     <ul class="nav  navbar-nav pull-left">
        <li>
          <a href="#" onClick="goAlarm('${sessionScope.loginUser.login_id}')" class="dropdown-toggle" data-toggle="dropdown">
          <img src="<%=request.getContextPath()%>/resources/images/alarm_white.png" class="menuicon">
          </a>
          
          <ul class="dropdown-menu dropdown">
          <li id="alarm">
          
          
          </li>
          
          </ul>
        </li>
         <li><a href="#"><span class="text-white">${sessionScope.loginUser.login_name} 님 환영합니다.</span></a></li>
      </ul>
	   
	    
	      <%-- <!-- left nav top -->
	      <ul class="nav navbar-nav pull-left">
	       <ul class="nav  navbar-nav">
        <li class="dropdown">
	        <li><a href="#" onClick="goAlarm('${sessionScope.loginUser.login_id}')" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png" class="menuicon"></a></li>
	       <ul class="dropdown-menu">
          <li id="alarm">
          </li>
          </ul>
        </li>
      </ul>
	        <li><a href="#"><span class="text-white">${sessionScope.loginUser.login_name} 님 환영합니다.</span></a></li>
	      </ul> --%>
	      <!-- right nav top -->
	      <!-- <ul class="nav navbar-nav pull-right">
	        <li><a href="#" class="text-white">About Us</a></li>
	        <li><a href="#" class="text-white">Contact Us</a></li> 
	      </ul> -->
	    </div>
	    
    </c:if>
    <c:if test="${sessionScope.loginUser == null}">
    
    	<div class="header container">
	      <!-- left nav top -->
	      <ul class="nav navbar-nav pull-left">
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-thumbs-up text-white"></span></a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-globe text-white"></span></a></li>
	        <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png" class="menuicon"></a></li>-->
	        <li><a href="#"><span class="text-white">환영합니다.</span></a></li>
	      </ul>
	      <!-- right nav top -->
	      <!-- <ul class="nav navbar-nav pull-right">
	        <li><a href="#" class="text-white">About Us</a></li>
	        <li><a href="#" class="text-white">Contact Us</a></li> 
	      </ul> -->
	    </div>
	    
    </c:if>
    <div class="dividline light-grey"></div>
  </nav>
  <!-- down nav -->
  <nav class="navbar navbar-down">
    <div class="header container">
      <div class="flex-container">  
        <div class="navbar-header flex-item">
          <div class="navbar-brand" onclick="show();" style="cursor: pointer;">Remeber Eemember</div>
        </div>
        <ul class="nav navbar-nav flex-item">
          <li><a><img src="<%=request.getContextPath()%>/resources/images/search.png" class="menuicon" />
          	<input name="search" id="search" style="background-color:transparent; border: 0px;"></a></li>
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
        </ul>
        
        <c:if test="${sessionScope.loginUser == null}">
        
        <ul class="nav navbar-nav flex-item hidden-xs pull-right">
          <li><a href="<%=request.getContextPath()%>/login.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png" class="menuicon"></a></li>
          <li><a href="<%=request.getContextPath()%>/reRegister.re"><img src="<%=request.getContextPath()%>/resources/images/register.png" class="menuicon"></a></li> 
        </ul>
        
        </c:if>
        <c:if test="${sessionScope.loginUser.login_status eq 1}">
        	
        	<ul class="nav navbar-nav flex-item hidden-xs pull-right">
        		<li><a href="<%=request.getContextPath()%>/followmain.re"><img src="<%=request.getContextPath()%>/resources/images/home.png" class="menuicon"></a></li>
        		<li><a href="<%=request.getContextPath()%>/writeBoard.re"><img src="<%=request.getContextPath()%>/resources/images/write.png" class="menuicon"></a></li>
        		<li><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/friends.png" class="menuicon"></a></li>
        		<li><a href="<%=request.getContextPath()%>/mypage.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png" class="menuicon"></a></li>
        		<li><a href="#" onclick="window.open('<%=request.getContextPath()%>/message.re', 'message', 'top=100px, left=100px, height=800px, width=800px')"><img src="<%=request.getContextPath()%>/resources/images/chatting_white.png" class="menuicon"></a></li>
          		<li><a href="<%=request.getContextPath()%>/logout.re"><img src="<%=request.getContextPath()%>/resources/images/logout.png" class="menuicon"></a></li> 
        	</ul>
        	
        </c:if>
        <c:if test="${sessionScope.loginUser.login_status eq 9}">
        
        	<ul class="nav navbar-nav flex-item hidden-xs pull-right">
        		<li><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/home.png" class="menuicon"></a></li>
        		<li><a href="<%=request.getContextPath()%>/report.re"><img src="<%=request.getContextPath()%>/resources/images/admin.png" class="menuicon"></a></li>
          		<li><a href="<%=request.getContextPath()%>/logout.re"><img src="<%=request.getContextPath()%>/resources/images/logout.png" class="menuicon"></a></li>  
        	</ul>
        
        </c:if>
        
        <!-- dropdown only moblie -->
          <div class="dropdown visible-xs pull-right">
            <button class="btn btn-default dropdown-toggle " type="button" id="dropdownmenu" data-toggle="dropdown">
              <span class="glyphicon glyphicon-align-justify"></span> 
            </button>
            <ul class="dropdown-menu">
              <li><a href="#">Projects</a></li>
              <li><a href="#">Pricing</a></li> 
              <li><a href="#">TheTeam</a></li> 
              <li role="separator" class="divider"></li>
              <li><a href="#">contact us</a></li>
            </ul>
          </div>
        </div>  
      </div>
    </nav>
  </nav> 
<!--bg img  -->
<header>
</header>    





	<%-- <ul class="nav nav-tabs mynav">
		
		<li style="margin-left:3%; "><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/home.png"></a></li>
		
		<li style="margin-left:34%;margin-top:10px; "><img src="<%=request.getContextPath()%>/resources/images/search.png"><input/></li>
		
		
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">제품정보 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath()%>/product/listProduct.re">제품목록</a></li>
			</ul></li>
		
		<c:if test="${sessionScope.loginuser.gradelevel >= 10 }">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">제품등록(다중파일첨부) <span class="caret"></span></a>
			<ul class="dropdown-menu">
			    <li><a href="<%=request.getContextPath()%>/product/addProduct.action">제품등록</a></li>
				<li><a href="<%=request.getContextPath()%>/product/productStore.action">제품입고</a></li>
			</ul></li>
		</c:if>	
		
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">로그인 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<c:if test="${sessionScope.loginuser == null}">
				<li><a href="#">회원가입</a></li>
				<li><a href="<%=request.getContextPath()%>/login.action">로그인</a></li>
				</c:if>
				
				<c:if test="${sessionScope.loginuser != null}">
				<li><a href="<%=request.getContextPath()%>/logout.action">로그아웃</a></li>
				</c:if>
			</ul></li>		
			<li style="margin-left:90%; margin-top:-70px;display:inline;"><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png"></a></li>
		
		<li class="dropdown" style="margin-left:85%; margin-top:-50px; display:inline;"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png"> <span class="caret"></span></a>
			<ul class="dropdown-menu">
			
			<c:if test="${sessionScope.loginuser != null && not empty alarmList}">
				<c:forEach var="alarmvo" items="alarmList">
					<li><a href="<%=request.getContextPath()%>/alarm/alarmList.re">${alarmList }</a></li>
				</c:forEach>
						</c:if>	
				<li><img src="<%=request.getContextPath()%>/resources/images/user_black.png">(예시)친구가 팔로우함 </li>
				<li><img src="<%=request.getContextPath()%>/resources/images/follow_black.png">(예시)새로운팔로워</li>
			
		</ul></li>
		
		
		<c:if test="${sessionScope.loginUser == null}">
		
		<li style="margin-left:85%;margin-top:10px; margin-top:-60px; display:inline;"><a href="<%=request.getContextPath()%>/login.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png"></a></li>
		</c:if>
		<c:if test="${sessionScope.loginUser!= null}">
		<li style="margin-left:85%;margin-top:10px; margin-top:-60px; display:inline;"><a href="<%=request.getContextPath()%>/mypage.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png"></a></li>
		</c:if>
		
		
		
		<!-- ===== #52. 로그인 성공한 사용자 성명 출력하기. ===== -->
		<c:if test="${sessionScope.loginUser.login_status eq 1}">
		<li style="margin-left: 35%; margin-top: 1%;">
		♥ 환영합니다~ <span style="color: navy; font-weight: bold;">${sessionScope.loginUser.login_name}</span> 님  ♥
		</li>
		<br/>
		<div><button type="button" id="logout" name="logout" class="btn btn-primary" onclick="gologout();">로그아웃</button></div>
		</c:if>
		
		<c:if test="${sessionScope.loginUser.login_status eq 9}">
		<li style="margin-left: 15%; margin-top: 1%;">
		♥ 환영합니다~ 관리자  <span style="color: navy; font-weight: bold;">${sessionScope.loginUser.login_name}</span> 님 ♥
		</li>
		<br/>
		<br/><div><button type="button" id="logout" name="logout" class="btn btn-primary" onclick="gologout();">로그아웃</button></div>
		</c:if>
		
	</ul> --%>

