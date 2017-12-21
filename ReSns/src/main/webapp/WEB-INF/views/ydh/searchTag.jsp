<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/webapp/resources/js/json2.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	
	   displayNEWAppend("0");//페이지번호 1값부터
	   //$("#btnTotalNEWCountJSON").hide();
	  // $("#btnCountJSON").hide();
	     
	   //더보기... 버튼을 클릭했을 경우 이벤트 등록하기.
	   $("#btnMoreNEW").click(function(){
		   alert("확인");
		   displayNEWAppend($(this).val());
		   
	   });

});//document

var lenNEW = 1;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	   //display할 HIT상품정보 추가해주는 함수(Ajax로 처리)
			var from_data={
		   				     "start": start
				            ,"lenNEW" : lenNEW //페이지당 보여줄상품갯수
		   					
	   };  
	   
	   $.ajax({
		   		url:"/resns/displaymoreJsonTag.re",
		   		type:"get",
		   		data: from_data,
		   		dataType: "JSON",
		   		success: function(data){
		   		
		   			var html ="";
		   			if(data== null || data.length == 0 ){
		   				
		   				html+="게시물이 없습니다.";
		   				
		   				//결과를 출력하기
		   				$("#displayResultNEW").html(html);
		   				
		   			}
		   			else{
		   				$.each(data, function(entryIndex,entry){
		   					
		   					var jtag = entry.jTagList;
					
		   					
							html += "<div style=\"display: inline-block; margin: 30px; border: solid gray 0px;\" align=\"left\">";
						        	  html += "<a href='searchEndTag.re?search="+jtag+"'></a>";
						        	
						        	  html += "</div>";
		   					
		   				});//end of $.each
		   				  html += "<div style='clear:both;'>&nbsp;</div>";
		   				  
		   			       //조회해온 사품의 정보를 출력하기
			   			  $("#displayResultNEW").append(html);
			   		      // >>>>>>>>>!!!! 중요 !!!!! "더보기..."버튼의 value속성에 값을 지정해주기(중요!!!)<<<<<<<<<<<<<<<<<
			   		      $("#btnMoreNEW").val(parseInt(start)+lenNew);
		   			
		   			},//end of success
		   		
				error: function(){
		   			   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
		   		}
	   });//ajax
	   
}



</script>
<head>
검색어결과뷰단Tag
</head>
<c:forEach var="map" items="${searchTag}" >
<c:if test="${map.BIMG_FILENAME != null}">
	<img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"><br/><br/>	   

</c:if> 

<c:if test="${map.BIMG_FILENAME == null}">
	<img src="<%=request.getContextPath()%>/resources/images/default0.png" style="width: 400px; height: 300px;"><br/><br/>    
</c:if>
</c:forEach>	

 
 <div  align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px;">
		<button type="button" id="btnMoreNEW" value=""> 더보기</button>
		<%-- <button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : <span id="totalNEWCount">${totalNEWCount}</span></button> --%>
		<!-- <button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button> -->
	 </div>

      
<body>
	