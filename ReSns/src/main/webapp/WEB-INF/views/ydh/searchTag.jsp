<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>검색어결과뷰단Tag</title>
<style type="text/css">


.modal-dialog.modal-80size {
  width: 35%;
  height: 0%; 
  margin: 50 auto;
  padding: 0;
}

.modal-content.modal-80size {
  height: 80%;
  min-height: 50%;
  width: 110%;
} 

#simplemodal-overlay {background-color:#000;}
/* #modal_content{display:none;margin:50 auto; width:100px; height:100px;background:blue;color:#fff} */



@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1166 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;
  position: relative;
  float: left;
  margin: 10px 1.5%;
  min-width: 400px;
  max-width: 400px;
  min-height: 300px;
  max-height: 300px;
  width: 100%;
  height : 100%;
  background: #ffffff;
  color: #000000;
  text-align: left;
  border-radius: 10px;
  box-shadow: 5px 5px 5px 0px lightgray;
}
figure.snip1166 * {
  -webkit-box-sizing: padding-box;
  box-sizing: padding-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1166 img {
  opacity: 1;
  width: 100%;
  min-width: 400px;
  max-width: 400px;
  min-height: 300px;
  max-height: 300px;
  vertical-align: top;
  -webkit-transition: opacity 0.4s;
  transition: opacity 0.4s;
  border-radius: 10px;
}
figure.snip1166 figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
figure.snip1166 figcaption > div {
  height: 70%;
  overflow: hidden;
  width: 100%;
  position: absolute;
  bottom: 0;
}
figure.snip1166 h3,
figure.snip1166 p {
  margin: 0;
  position: absolute;
  right: 0;
}
figure.snip1166 h3 {
  padding: 0 30px 0 15px;
  color: #ffffff;
  background-color: #1a1a1a;
  display: inline-block;
  font-weight: 400;
  line-height: 40px;
  text-transform: uppercase;
  top: 30%;
  right: 0;
  left: 30px;
  z-index: 1;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}
figure.snip1166 h3 span {
  font-weight: 400;
}
figure.snip1166 h3:after,
figure.snip1166 h3:before {
  border-style: solid;
  content: '';
  position: absolute;
  left: 100%;
}
figure.snip1166 h3:after {
  border-width: 40px 0 0 12px;
  border-color: transparent transparent transparent #1a1a1a;
  top: 0;
}
figure.snip1166 h3:before {
  border-width: 12px 12px 0 0;
  border-color: #000000 transparent transparent transparent;
  top: 100%;
}
figure.snip1166 p {
  padding: 8px 45px;
  opacity: 0;
  font-size: 0.9em;
  font-weight: 500;
  left: 0;
  -webkit-transform: translate3d(0%, -150%, 0);
  transform: translate3d(0%, -150%, 0);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
figure.snip1166 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
}
figure.snip1166.blue h3 {
  background-color: #2980b9;
}
figure.snip1166.blue h3:after {
  border-color: transparent transparent transparent #2980b9;
}
figure.snip1166.blue h3:before {
  border-color: #123851 transparent transparent transparent;
}
figure.snip1166.red h3 {
  background-color: #c0392b;
}
figure.snip1166.red h3:after {
  border-color: transparent transparent transparent #c0392b;
}
figure.snip1166.red h3:before {
  border-color: #581a14 transparent transparent transparent;
}
figure.snip1166.green h3 {
  background-color: #27ae60;
}
figure.snip1166.green h3:after {
  border-color: transparent transparent transparent #27ae60;
}
figure.snip1166.green h3:before {
  border-color: #104627 transparent transparent transparent;
}
figure.snip1166.orange h3 {
  background-color: #e67e22;
}
figure.snip1166.orange h3:after {
  border-color: transparent transparent transparent #e67e22;
}
figure.snip1166.orange h3:before {
  border-color: #7b410e transparent transparent transparent;
}
figure.snip1166.navy h3 {
  background-color: #34495e;
}
figure.snip1166.navy h3:after {
  border-color: transparent transparent transparent #34495e;
}
figure.snip1166.navy h3:before {
  border-color: #07090c transparent transparent transparent;
}
figure.snip1166:hover img,
figure.snip1166.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}
figure.snip1166:hover figcaption h3,
figure.snip1166.hover figcaption h3 {
  -webkit-transform: translateY(-100%);
  transform: translateY(-100%);
}
figure.snip1166:hover figcaption p,
figure.snip1166.hover figcaption p {
  opacity: 0.8;
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.fallowmain{
border-radius: 10px;
box-shadow: 5px 5px 5px 0px lightgray;
}


a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}


</style>


<script type="text/javascript">
$(document).ready(function(){
	
	   $("#count").hide();
	
	   displayNEWAppend("1");//페이지번호 1값부터
	     
	   //더보기... 버튼을 클릭했을 경우 이벤트 등록하기.
	   $("#btnMoreNEW").click(function(){
		  // alert("확인7");
		   displayNEWAppend($(this).val());
	   });
	   


});//document

function goDetail(seq_tbl_board)
	{
	
		var url = "/resns/alaramBoard.re?seq_tbl_board="+seq_tbl_board;
		
/* 		window.open(url, "tag",
				"width=1000px, height=1000px, top=1000px, left=1000px " 
		); */
		var theFrame = document.getElementById('test001');
		theFrame.src = url;

	
	
	
	
	
	}
//var len = 3;
var lenNEW = 3;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	var searchTag = $("#searchTag").val();
	//alert("searchTag::"+searchTag);

	var start = start;
	//alert("시작확인:"+start)
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchTag" : searchTag
				
										};
	//alert(searchTag+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJsonTag.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		//alert("테스트1");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					//alert("나와나와");
   				    
   					var tname = entry.login_name;
   					var tag_content = entry.tag_content;
   					var login_id = entry.login_id;
   					var seq_tbl_board = entry.seq_tbl_board;
   					var bimg_filename = entry.bimg_filename;
   		
   					
   				   // html+="<a href='/resns/alaramBoard.re?seq_tbl_board="+seq_tbl_board+"'><img src='resources/images/"+bimg_filename+"'style='width: 500px; height: 500px;'/></a><br/><br/>";
   				 
   				 html += "<figure class='snip1166'>";
   				// html +=    "<span style='cursor: pointer;'><a data-toggle='modal' data-target='#userlogin' data-dismiss='modal' onClick=\"goDetail('"+seq_tbl_board+"');\"><img src='resources/images/"+bimg_filename+"'style='width: 250px; height: 250px;'/></a></span>";
   				 html +=    "<figcaption>";
   				 html +=    "<h3>social net service :: re</h3>";
   				 html +=    "<span style='cursor: pointer; '><a data-toggle='modal' data-target='#userlogin'  data-dismiss='modal' onClick=\"goDetail('"+seq_tbl_board+"');\"><img src='resources/images/"+bimg_filename+"'style='width: 250px; height: 300px;'/></a></span>";
   				 html +=    "</figcaption>";
   				 html += "</figure>";

   				});//end of $.each
   			
   			      
   			       //조회해온 사품의 정보를 출력하기
	   			  $("#displayResultNEW").append(html);
	   		        
   				
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
<input type="hidden" value="${search}" id="searchTag" name="searchTag"/>

<div align="center">
  <span style="font-weight:bold; font-size:25pt; color:navy; ">[&nbsp;${search}&nbsp;]</span><span style="font-weight:bold; font-size:20pt;">&nbsp;검색 결과입니다.</span>
</div>
<div style="margin-top:20px; margin-bottom:20px;">

 <div  align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;" ></div>
	 <div style=" margin-top: 20xp; margin-bottom: 20px; align="center">
<!-- 		<button type="button" id="btnMoreNEW" value="">더보기</button> -->
		<div style="position: fixed; left: 70%;">
		<button type="button" id="btnMoreNEW" value="">더보기</button>
		</div>
		<div id="count">
	    <input type="hidden" id="btnTotalNEWCountJSON"/><span id="totalNEWCount" style="color:white;">${jtCnt}</span>
	    <input type="hidden" id="btnCountJSON"/><span id="countNEW" style="color:white;">0</span>
	    </div>
	 </div>
</div>

<body>
<!-- ///////////////////////////////// -->

<%-- 
<div class="modal fade" id="userlogin" role="dialog"  style="width: 130%;" >
   <div class="modal-dialog modal-80size ">
      Modal content
        <div class="modal-content " align="center" >
          <div class="modal-header">
            <button type="button" class="close myclose" data-dismiss="modal" style="width: 130%;">&times;</button>
            
            <h4 class="modal-title">♥Remeber E.member♥</h4>
            
            </div>
               <div class="modal-body modal-80size" style="width: 100%; height: 1008px;">
               <div id="login" style="width: 98%;">
                <iframe id="test001" style="border: none; width: 100%; height: 1008px;" src=""></iframe>
               </div>
             </div>
          
          <div class="modal-footer">
             <button type="button" class="btn btn-default myclose" data-dismiss="modal" >Close</button>
          </div>
          
          
        </div>

   </div>
</div> --%>


<div class="modal fade" id="userlogin" role="dialog"  style="width: 130%;" >
   <div class="modal-dialog modal-80size ">
      <%-- Modal content --%>
        <div class="modal-content " >
          <div align="center" class="modal-header"  style="height:0px;">
          <!--   <button type="button" class="close myclose" data-dismiss="modal" style="width: 130%;">&times;</button> -->
            <button type="button" class="btn btn-default myclose" data-dismiss="modal"><h17 class="modal-title">♥Remeber E.member♥</h17></button>
            
            </div>
               <div class="modal-body modal-80size" style="width: 100%; height: 1008px;">
               <div id="login" style="width: 98%;">
                <iframe id="test001" style="border: none; width: 100%; height: 1008px;" src=""></iframe>
               </div>
             </div>
          
          <div class="modal-footer" >
            <!--  <button type="button" class="btn btn-default myclose" data-dismiss="modal" >Close</button> -->
          </div>
          
          
        </div>

   </div>
</div>



</html>	