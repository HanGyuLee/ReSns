<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	${demo.css}
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/highcharts.js"></script>        <!-- 차트그리기 --> 
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modules/data.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modules/drilldown.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		loopshowNowTime();
		showRank();
	}); // end of ready(); ---------------------------------

	function showNowTime() {
		
		var now = new Date();
	
		var strNow = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		
		var hour = "";
		if(now.getHours() > 12) {
			hour = " 오후 " + (now.getHours() - 12);
		} else if(now.getHours() < 12) {
			hour = " 오전 " + now.getHours();
		} else {
			hour = " 정오 " + now.getHours();
		}
		
		var minute = "";
		if(now.getMinutes() < 10) {
			minute = "0"+now.getMinutes();
		} else {
			minute = ""+now.getMinutes();
		}
		
		var second = "";
		if(now.getSeconds() < 10) {
			second = "0"+now.getSeconds();
		} else {
			second = ""+now.getSeconds();
		}
		
		strNow += hour + ":" + minute + ":" + second;
		
		$("#clock").html("<span style='color:green; font-weight:bold;'>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------


	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						loopshowNowTime();	
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------
	
	

</script>


<div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
</div>
	
	
	
	
	