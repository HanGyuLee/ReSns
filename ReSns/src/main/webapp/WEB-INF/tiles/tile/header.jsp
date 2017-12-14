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
}
.navbar-doublerow .navbar-down .dropdown{
    padding: 5px;
    color: #000;
}
.navbar-doublerow .navbar-down .dropdown ul>li>a,
.navbar-doublerow .navbar-down .dropdown ul>li>a:hover{
  color: #000;
  border-bottom: none;
}
.navbar-doublerow.navbar-trans.afterscroll {
}	
.navbar-doublerow.navbar-trans.afterscroll {
   top:-50px;
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


</style>

<script type="text/javascript">

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


</script>

<nav class="navbar navbar-default navbar-doublerow navbar-trans navbar-fixed-top">
  
  
  <!-- top nav -->
  <nav class="navbar navbar-top hidden-xs">
   
   <c:if test="${sessionScope.loginUser != null}">
   
	    <div class="container">
	      <!-- left nav top -->
	      <ul class="nav navbar-nav pull-left">
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-thumbs-up text-white"></span></a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-globe text-white"></span></a></li> -->
	        <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png" class="menuicon"></a></li>
	        <li><a href="#"><span class="text-white">${sessionScope.loginUser.login_name} 님 환영합니다.</span></a></li>
	      </ul>
	      <!-- right nav top -->
	      <!-- <ul class="nav navbar-nav pull-right">
	        <li><a href="#" class="text-white">About Us</a></li>
	        <li><a href="#" class="text-white">Contact Us</a></li> 
	      </ul> -->
	    </div>
	    
    </c:if>
    <c:if test="${sessionScope.loginUser == null}">
    
    	<div class="container">
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
    <div class="container">
      <div class="flex-container">  
        <div class="navbar-header flex-item">
          <div class="navbar-brand" onclick="show();" style="cursor: pointer;">Remeber Eemember</div>
        </div>
        <!-- <ul class="nav navbar-nav flex-item hidden-xs">
          <li><a href="#">Projects</a></li>
          <li><a href="#">Pricing</a></li> 
          <li><a href="#">TheTeam</a></li> 
        </ul> -->
        
        <c:if test="${sessionScope.loginUser == null}">
        
        <ul class="nav navbar-nav flex-item hidden-xs pull-right">
          <li><a href="<%=request.getContextPath()%>/login.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png" class="menuicon"></a></li>
          <li><a href="<%=request.getContextPath()%>/reRegister.re"><img src="<%=request.getContextPath()%>/resources/images/register.png" class="menuicon"></a></li> 
        </ul>
        
        </c:if>
        <c:if test="${sessionScope.loginUser.login_status eq 1}">
        	
        	<ul class="nav navbar-nav flex-item hidden-xs pull-right">
        		<li><a href="<%=request.getContextPath()%>/followmain.re"><img src="<%=request.getContextPath()%>/resources/images/home.png" class="menuicon"></a></li>
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

