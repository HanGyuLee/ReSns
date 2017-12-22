<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){

	
	   displayNEWAppend("1");//페이지번호 1값부터
	   //$("#btnTotalNEWCountJSON").hide();
	   //$("#btnCountJSON").hide();
	     
	   //더보기... 버튼을 클릭했을 경우 이벤트 등록하기.
	   $("#btnMoreNEW").click(function(){
		   alert("확인4");
		   displayNEWAppend($(this).val());
		   
	   });

});//document


var len = 2;
var lenNEW = 1;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	
	var searchTag = $("#searchTag").val();
	alert("searchTag::"+searchTag);

	//var start = start;
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchTag" : searchTag
										};
	alert(searchTag+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJsonTag.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		alert("테스트1");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					alert("나와나와");
   					var tname = entry.login_name;
   					var tag_content = entry.tag_content;
   					var login_id = entry.login_id;
   					var seq_tbl_board = entry.seq_tbl_board;
   					var bimg_filename = entry.bimg_filename;
   					
					html += bimg_filename+"<br/><br/>"
   					
   				});//end of $.each
   				  
   			       //조회해온 사품의 정보를 출력하기
	   			  $("#displayResultNEW").append(html);
	   		      // >>>>>>>>>!!!! 중요 !!!!! "더보기..."버튼의 value속성에 값을 지정해주기(중요!!!)<<<<<<<<<<<<<<<<<
	   		      $("#btnMoreNEW").val(parseInt(start)+lenNew); 
	   		      
	   		        // 웹브라우저상에 count 출력하기
			    	$("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
			    	
			    	// totalHITCount 와 count 의 값이 일치하는 경우에는 
			    	// "더보기..." 버튼의 비활성화 처리해야 한다.
			    	if ( parseInt($("#totalNEWCount").text()) == parseInt($("#countNEW").text()) ) { 
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
검색어결과뷰단Tag
</head>
<input type="text" value="${search}" id="searchTag" name="searchTag"/>
 ${search}
 <div  align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px;">
		<button type="button" id="btnMoreNEW" value=""> 더보기</button>
		<br/>
		<br/>
	    <button type="button" id="btnTotalNEWCountJSON">jtCnt: <span id="totalNEWCount">${jtCnt}</span></button>
	    <button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button> 
	 </div>

      
<body>
	