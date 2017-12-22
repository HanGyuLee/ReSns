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
	   
	   alert("검색: "+$("#searchNames").val());
	
	   displayNEWAppend("1");//페이지번호 1값부터

	   $("#btnMoreNEW").click(function(){
		   alert("확인names");
		   displayNEWAppend($(this).val());
		   
	   });
	
});//document

var len = 2;
var lenNEW = 1;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	
	var searchNames = $("#searchNames").val();
	alert("searchNames::"+searchNames);

	//var start = start;
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchNames" : searchNames
										};
	alert(searchNames+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJName.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		alert("테스트names");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					alert("나와나와names");
   					var login_name = entry.login_name;
   					var login_id = entry.login_id;
   					var user_ed = entry.user_ed;
   					var user_ing = entry.user_ing;
   					var user_boardcnt = entry.user_boardcnt;
   					var uimg_profile_filename = entry.uimg_profile_filename;
   					
   					html += login_name+login_id+"<br/><br/>"
   					
   				});//end of $.each
   				  
	   			  $("#displayResultNEW").append(html);
	   		      $("#btnMoreNEW").val(parseInt(start)+lenNew); 
	   		      
		   		      
	   			},//end of success
			error: function(){
	   			   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	   		}
  });//ajax 
   

}


</script>
<head>
검색어결과뷰단Name
</head>

<body>
								<!-- 검색결과 -->
<%-- <div align="center">
<c:forEach var="map" items="${searchName}" >

	    <img src="<%=request.getContextPath()%>/resources/images/${map.UIMG_PROFILE_FILENAME}" style="width: 50px; height: 50px;"><br/><br/>
				 이름 :${map.LOGIN_NAME}  
                                    게시물 : ${map.USER_BOARDCNT}
                                    팔로잉 :${map.USER_ING} 
                                   필로워: ${map.USER_ED}
                                   
                                   
                              
</c:forEach>
</div> --%>
	
<input type="text" value="${search}" id="searchNames" name="searchNames"/>
 ${search}
 <div align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px;">
		<button type="button" id="btnMoreNEW" value=""> 더보기</button>
		<br/>
		<br/>
		<%-- <button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : <span id="totalNEWCount">${totalNEWCount}</span></button> --%>
		<!-- <button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button> -->
	 </div>
	 
      
</body>
</html>