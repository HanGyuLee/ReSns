<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 페이지</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.fittext.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/assets/jquery.lettering.js"></script>
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/textillate-master/jquery.textillate.js"></script>
<link href="<%= request.getContextPath() %>/resources/textillate-master/assets/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/highcharts/code/highcharts.js"></script>
<script src="<%= request.getContextPath() %>/resources/highcharts/code/modules/data.js"></script>
<script src="<%= request.getContextPath() %>/resources/highcharts/code/modules/drilldown.js"></script>
</head>

<body>
<br>
<br>
<br>
<br>
<div style="width: 310px; height: 400px;">
<div id="age-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>

<div style="width: 310px; height: 400px;">
<div id="gender-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>

<div style="width: 1500px; height: 800px;">
<div id="boardCount-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>

<c:forEach var="ages" items="${ageList}">
	<c:out value="${ages.ageline}" />
</c:forEach>


<script type="text/javascript">
	
	function ageChart() {
		//Create the chart
		Highcharts.chart('age-container', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '회원 나이대별 통계'
		    },
		    subtitle: {
		        text: ''
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: '회원비율'
		        }
		
		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true,
		                format: '{point.y:.1f}%'
		            }
		        }
		    },
		
		    tooltip: {
		        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b><br/>'
		    },
		
		    series: [{
		        name: '나이대',
		        colorByPoint: true,
		        data: [ 
		        	<c:forEach var="agep" items="${agelinePct.agelinePctList}" varStatus="status">
		        		{
							name: '${agep.ageline}대',
							y: Number(${agep.pct}),
							drilldown: '${agep.ageline}'
		        		}
		        		<c:if test="${status.count < agelinePct.agelinePctList.size()}">
		        			,
		        		</c:if>
		        	</c:forEach>
		        ]
		    }]
		});
	}
	
	function genderChart() {
		$.getJSON("getGenderChartJson.re", function(data) {
			
			var genderArr = [];
			
			$.each(data, function(index, entry) {
				genderArr.push(
					[entry.gendername, Number(entry.cnt)]					
				);
			});// end of each()-----
			
			Highcharts.chart('gender-container', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: '가입된 회원 성별 현황'
			    },
			    subtitle: {
			        text: ''
			    },
			    xAxis: {
			        type: 'category',
			        labels: {
			            rotation: -45,
			            style: {
			                fontSize: '13px',
			                fontFamily: 'Verdana, sans-serif'
			            }
			        }
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: '인원수'
			        }
			    },
			    legend: {
			        enabled: false
			    },
			    tooltip: {
			        pointFormat: '인원수: <b>{point.y:.0f} 명</b>'
			    },
			    series: [{
			        name: '인원수',
			        data: genderArr,
			        dataLabels: {
			            enabled: true,
			            rotation: -90,
			            color: '#FFFFFF',
			            align: 'right',
			            format: '{point.y:.0f}', // one decimal
			            y: 10, // 10 pixels down from the top
			            style: {
			                fontSize: '13px',
			                fontFamily: 'Verdana, sans-serif'
			            }
			        }
			    }]
			});
			
			
		}); // end of $.getJSON("getGenderChartJson.re", function(data)-----------
	}// end of genderChart()----------
	
	function boardCountChart() {
		
		var loginid = "<c:out value='${loginUser.login_id}'/>";
		
		if (loginid != null && loginid.length > 0) {
			var weekInfo = [];
			var preWeekInfo = [];
			var weekdate = [];
			$.getJSON("getBoardCountChartWeekJson.re", {"loginid" : loginid}, function(data) {
				$.each(data, function(index, entry) {
					weekInfo.push(
						parseFloat(entry.cnt)
					);
				});
				$.each(data, function(index, entry) {
					weekdate.push(
						entry.weekdate
					);
				});
			}); // end of getJSON1
			$.getJSON("getBoardCountChartPreWeekJson.re", {"loginid" : loginid}, function(data) {
				$.each(data, function(index, entry) {
					preWeekInfo.push(
						parseFloat(entry.cnt)
					);
				});
			}); // end of getJSON2
			console.log(weekInfo);
			console.log(preWeekInfo);
			console.log(weekdate);
			
			Highcharts.chart('boardCount-container', {
			    chart: {
			        type: 'line'
			    },
			    title: {
			        text: 'Monthly Average Temperature'
			    },
			    subtitle: {
			        text: 'Source: WorldClimate.com'
			    },
			    xAxis: {
			        categories: weekdate
			    },
			    yAxis: {
			        title: {
			            text: 'Temperature (°C)'
			        }
			    },
			    plotOptions: {
			        line: {
			            dataLabels: {
			                enabled: true
			            },
			            enableMouseTracking: false
			        }
			    },
			    series: [{
			        name: '저번주',
			        data: weekInfo
			    }, {
			        name: '저저번주',
			        data: preWeekInfo
			    }]
			});
		}// end of if
				
	}// end of boardCountChart()-----
	
	window.onload = function() {
		ageChart();
		genderChart();
		boardCountChart();
	}
		
	document.title = "통계 페이지";
</script>


</body>
</html>