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

</style>

<script type="text/javascript">

function gologout(){
	location.href="/resns/logout.re";
}

</script>




<div align="center" style="background-color: black;">
	<ul class="nav nav-tabs mynav">
		
		<li style="margin-left:3%; "><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/home.png"></a></li>
		
		<li style="margin-left:34%;margin-top:10px; "><img src="<%=request.getContextPath()%>/resources/images/search.png"><input/></li>
		
		
		<%-- <li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">제품정보 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath()%>/product/listProduct.re">제품목록</a></li>
			</ul></li> --%>
		<%-- 
		<c:if test="${sessionScope.loginuser.gradelevel >= 10 }">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">제품등록(다중파일첨부) <span class="caret"></span></a>
			<ul class="dropdown-menu">
			    <li><a href="<%=request.getContextPath()%>/product/addProduct.action">제품등록</a></li>
				<li><a href="<%=request.getContextPath()%>/product/productStore.action">제품입고</a></li>
			</ul></li>
		</c:if>	
		 --%>
		<%-- <li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">로그인 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<c:if test="${sessionScope.loginuser == null}">
				<li><a href="#">회원가입</a></li>
				<li><a href="<%=request.getContextPath()%>/login.action">로그인</a></li>
				</c:if>
				
				<c:if test="${sessionScope.loginuser != null}">
				<li><a href="<%=request.getContextPath()%>/logout.action">로그아웃</a></li>
				</c:if>
			</ul></li>	 --%>	
			<%-- <li style="margin-left:90%; margin-top:-70px;display:inline;"><a href="<%=request.getContextPath()%>/index.re"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png"></a></li> --%>
		
		<li class="dropdown" style="margin-left:85%; margin-top:-50px; display:inline;"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/resources/images/alarm_white.png"> <span class="caret"></span></a>
			<ul class="dropdown-menu">
			
			<c:if test="${sessionScope.loginuser != null && not empty alarmList}">
				<c:forEach var="alarmvo" items="alarmList">
					<li><a href="<%=request.getContextPath()%>/alarm/alarmList.re">${alarmList }</a></li>
				</c:forEach>
						</c:if>	
				<li><img src="<%=request.getContextPath()%>/resources/images/user_black.png">친구가 팔로우함 </li>
				<li><img src="<%=request.getContextPath()%>/resources/images/follow_black.png">새로운팔로워</li>
			
		</ul></li>
		<li style="margin-left:85%;margin-top:10px; margin-top:-60px; display:inline;"><a href="<%=request.getContextPath()%>/login.re"><img src="<%=request.getContextPath()%>/resources/images/user_white.png"></a></li>
		
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
		♥ 환영합니다~ <span style="color: navy; font-weight: bold;">${sessionScope.loginUser.login_name}</span> 님 ♥
		</li>
		</c:if>
		
	</ul>
</div>
