<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	${demo.css}
</style>

<script src="<%= request.getContextPath() %>/resources/highcharts/code/highcharts.js"></script>        <!-- 차트그리기 --> 
<script src="<%= request.getContextPath() %>/resources/highcharts/code/modules/wordcloud.js"></script>
<style type="text/css">

#container {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto;
}

</style>

<script type="text/javascript">

	$(document).ready(function() {
		loopshowNowTime();
		/* showRank(); */
		
		$("#tagList").hide();
		
		$.ajax({
			url: "/resns/showAllTag.re",
			type: "GET",
			dataType: "JSON",
			success: function(data) {
				
				var result = "";
				
				$.each(data, function(entryIndex, entry){
					
					var tag_content = entry.tag_content;
					
					result += tag_content+",";
					
				});
				
				$("#tagList").html(result);
				
				popHash();
				
			}, error: function() {
				
			}
		});
		
		
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
	
	
	
	function popHash() {
		var text = $("#tagList").text();
		var lines = text.split(/[,\. ]+/g),
		    data = Highcharts.reduce(lines, function (arr, word) {
		        var obj = Highcharts.find(arr, function (obj) {
		            return obj.name === word;
		        });
		        if (obj) {
		            obj.weight += 1;
		        } else {
		            obj = {
		                name: word,
		                weight: 1
		            };
		            arr.push(obj);
		        }
		        return arr;
		    }, []);

		Highcharts.chart('container', {
		    series: [{
		        type: 'wordcloud',
		        data: data,
		        name: '태그를 사용한 게시물'
		    }],
		    title: {
		        text: '인기 해시 태그'
		    }
		});
		
	}
</script>


<!-- <div style="margin: 0 auto;" align="center">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
</div> -->

<body>

<span id="tagList"></span>
<div id="container"></div>



</body>
	
	
	
	
	