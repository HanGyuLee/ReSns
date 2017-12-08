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
	//더보기버튼만들기
	displayNEWAppend("1");
	
	$("#btnTotalNEWCountJSON").hide();
	$("#btnCountJSON").hide();
	
	// 더보기... 버튼을 클릭했을 경우 이벤트 등록하기
	$("#btnMoreNEW").click(function(){
		displayNEWAppend($(this).val());
	});
	
});//document


/*
var lenNEW = 2; // 더보기... 클릭에 보여줄 상품의 갯수 단위 크기


//더보기버튼만들기
 function displayNEWAppend(start) {

    var form_data = { "start" : start
                     ,"len" : lenNEW	                
	                 ,"search" : search
                    };

	$.ajax({
		url: "displayMoreJSON.re",
		type: "GET",
		data: form_data,
		dataType: "JSON",
		success: function(data){
							
			var html = "";
			
			if (data == null || data.length == 0) {
				html += "제품 준비중입니다.. *^__^*"; 
				
				// 상품 결과를 출력하기
				$("#displayResultNEW").html(html);
			}
			
			else {
				$.each(data, function(entryIndex, entry){
					html += "<div style=\"display: inline-block; margin: 30px; border: solid gray 0px;\" align=\"left\">";
		        	html += "<a href=\"/MyMVC/prodView.do?pnum="+entry.pnum+"\">";
		        	html += "<img width=\"110px;\" height=\"120px;\" src=\"images/"+entry.pimage1+"\"><br/>";
		        	html += "</a><br/>";
		        	html += "제품명 : "+entry.pname+"<br/>";
		        	html += "정가 : <span style=\"color: red;\"><del>"+entry.price+" 원</del></span><br/>";
		        	html += "판매가 : <span style=\"color: red; font-weight: bold;\">"+entry.saleprice+" 원</span><br/>";
		        	html += "할인율 : <span style=\"color: blue; font-weight: bold;\">["+entry.percent+"%] 할인</span><br/>";
		        	html += "포인트 : <span style=\"color: orange;\">"+entry.point+" POINT</span><br/>";
		        	html += "</div>";	
				}); // end of $.each()-------------
				
				html += "<div style=\"clear:both;\">&nbsp;</div>";
				
				// 조회해온 상품의 정보를 출력하기
		    	$("#displayResultNEW").append(html);
		    	 
		    	// >>>> !!!! 중요 !!!! "더보기..." 버튼의 value 속성에 값을 지정해주기(중요!!!!) <<<<<
		    	$("#btnMoreNEW").val(parseInt(start)+lenNEW);
		    	 
		    	// 웹브라우저상에 count 출력하기
		    	$("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
		    	
		    	// totalHITCount 와 count 의 값이 일치하는 경우에는 
		    	// "더보기..." 버튼의 비활성화 처리해야 한다.
		    	if ( parseInt($("#totalNEWCount").text()) == parseInt($("#countNEW").text()) ) { 
		    		 $("#btnMoreNEW").attr("disabled", true);
			    	 $("#btnMoreNEW").css("cursor", "not-allowed");
		    	}
				
			}// end of if~else-----------------
		 				
		},// end of success: function(data)----------
		error: function(){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
		    }
	});
*/	
}// end of function displayHitAppend(start)---------	

</script>
<head>
검색어결과뷰단Name
</head>

<body>
								<!-- 검색결과 -->
<div align="center">
<c:forEach var="map" items="${searchName}" >
	 <c:if test="${map.UIMG_PROFILE_FILENAME == null}">
	  <br/><br/>
	
	  <img src="<%=request.getContextPath()%>/resources/images/defaultProfile.png" style="width: 50px; height: 50px;"><br/><br/> 
				         이름 :${map.LOGIN_NAME}  
					게시물 : ${map.USER_BOARDCNT}
					팔로잉 :${map.USER_ING} 
					필로워: ${map.USER_ED}
    			
     <br/><br/>
     
	 </c:if> 
	
	 <c:if test="${map.UIMG_PROFILE_FILENAME != null}">
	    <img src="<%=request.getContextPath()%>/resources/images/${map.UIMG_PROFILE_FILENAME}" style="width: 50px; height: 50px;"><br/><br/>
				 이름 :${map.LOGIN_NAME}  
                                    게시물 : ${map.USER_BOARDCNT}
                                    팔로잉 :${map.USER_ING} 
                                   필로워: ${map.USER_ED}
	  </c:if>
</c:forEach>
</div>
	
	 <div id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px; ">
		<button type="button" id="btnMoreNEW" value="">MORE</button>
		<%-- <button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : <span id="totalNEWCount">${totalNEWCount}</span></button>
		<button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button> --%>
	 </div>
      
</body>
</html>