<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-ui.js"></script> 



<title>검색어결과뷰단Name</title>

<style type="text/css">




</style>


<script type="text/javascript">
$(document).ready(function(){
	
	   $("#count").hide();
	   //alert("검색: "+$("#searchNames").val());
	
	   displayNEWAppend("1");//페이지번호 1값부터

	   $("#btnMoreNEW").click(function(){
		   //alert("확인names");
		   displayNEWAppend($(this).val());
		   
	   });
	
});//document

//var len = 2;
var lenNEW = 1;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	
	var searchNames = $("#searchNames").val();
	//alert("searchNames::"+searchNames);

	//var start = start;
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchNames" : searchNames
										};
	//alert(searchNames+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJName.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		//alert("테스트names");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					//alert("나와나와names");
   					var login_name = entry.login_name;
   					var login_id = entry.login_id;
   					var user_ed = entry.user_ed;
   					var user_ing = entry.user_ing;
   					//var user_boardcnt = entry.user_boardcnt;
   					var uimg_profile_filename = entry.uimg_profile_filename;
   					
   					html += "<div align='center'>"
   					html += "<a href='/resns/otherspage.re?fk_login_id="+login_id+"'><img src='resources/images/"+uimg_profile_filename+"' class='img-circle' style='width: 150px; height: 150px;'/></a><br/>";
   					html += "<a href='/resns/otherspage.re?fk_login_id="+login_id+"'><span style='font-size:25pt; cursor:pointer; font-weight:bold;'>별명:&nbsp;"+login_name+"</span></a><br/>"; 
   					html += "<span style='font-weight:bold; font-size:20pt;'>"+"팔로워"+user_ed+"&nbsp;"+ "팔로잉"+user_ing+"&nbsp;</span>"
   									
   										
   				});//end of $.each
   				          html +="</div>"+"<br/><br/>"
   				  
   			   //조회해온 사품의 정보를 출력하기
	   			  $("#displayResultNEW").append(html);
	   		      // >>>>>>>>>!!!! 중요 !!!!! "더보기..."버튼의 value속성에 값을 지정해주기(중요!!!)<<<<<<<<<<<<<<<<<

	   		       $("#btnMoreNEW").val(parseInt(start)+lenNEW);
	 
	   		        // 웹브라우저상에 count 출력하기
			    	$("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
			    	
			    	// totalHITCount 와 count 의 값이 일치하는 경우에는 
			    	// "더보기..." 버튼의 비활성화 처리해야 한다.
			    	if ( parseInt($("#totalNEWCount").text()) == parseInt($("#countNEW").text()) ) { 
			    		 // alert("dd");
			    		
			    		 $("#btnMoreNEW").attr("disabled", true);
				    	 $("#btnMoreNEW").css("cursor", "not-allowed");
			    	} 
	   			
	   			},//end of success
			error: function(){
	   			   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	   		}
	   			
});//ajax 
   

}

</script>
<head>

</head>

<body>
								<!-- 검색결과 -->


	
<input type="hidden" value="${search}" id="searchNames" name="searchNames"/>
<div align="center">
  <span style="font-weight:bold; font-size:25pt; color:navy; ">[&nbsp;${search}&nbsp;]</span><span style="font-weight:bold; font-size:20pt;">&nbsp;검색 결과입니다.</span>
</div><br/><br/>

 <div align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px;"align="center">
		<button type="button" id="btnMoreNEW" value="" > 더보기</button>
		<br/>
		<br/> 
		<div id="count">
	    <input type="hidden" id="btnTotalNEWCountJSON"/><span id="totalNEWCount" style="color:white;">${jNCnt}</span>
	    <input type="hidden" id="btnCountJSON"/><span id="countNEW" style="color:white;">0</span>
		</div>
	 </div>

</body>
</html>