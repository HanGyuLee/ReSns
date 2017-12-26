<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<%= request.getContextPath() %>/resources/highcharts/code/highcharts.js"></script>        <!-- 차트그리기 --> 
<script src="<%= request.getContextPath() %>/resources/highcharts/code/modules/wordcloud.js"></script>
<style type="text/css">

#container {
	min-width: 310px;
	max-width: 450px;
	min-height: 1200px;
	margin: 0 auto;
}

</style>

<script type="text/javascript">

	$(document).ready(function() {
		loopshowNowTime();

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

	function loopshowNowTime() {
		
		setTimeout(function() {
						loopshowNowTime();	
					}, 10000);
		
	}// end of loopshowNowTime() --------------------------
	
	function searchTagGo(tag){
		location.href="/resns/searchEndTag.re?search="+tag;
	}
	
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
		        name: '태그를 사용한 게시물',
		        events: {
	                click: function (event) {
	                	console.log(event.point.name);
						var tag_content = event.point.name;
	                	var sub_tag_content = tag_content.substring(1);
	  /*               	result += "<a href='/resns/searchEndTag.re?search="+sub_tag_content+"'>";
						result += "<span style='font-weight: bold;'>"+tag_content+"</span>";
						result += "</a>";
	                	 */
	                	searchTagGo(sub_tag_content);
	                	 
/*                 	alert(
	                		sub_tag_content + ' clicked\n'
	                    );  */
     
	                }
	            }
		    }],
		    title: {
		        text: '인기 해시 태그'
		    },
		    credits:{
		    	enabled: false
		    },
		    chart:{
		    	backgroundColor: 'transparent'
		    },
		    
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
	
	
	
	
	