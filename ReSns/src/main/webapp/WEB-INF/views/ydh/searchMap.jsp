<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>검색어결과뷰단Map</title>

<style type="text/css">


.modal-dialog.modal-80size {
  width: 50%;
  height: 80%;
  margin: 50 auto;
  padding: 0;
}

.modal-content.modal-80size {
  height: 80%;
  min-height: 50%;
  width: 110%;
}


#simplemodal-overlay {background-color:#000;}
/* #modal_content{display:none;margin:50 auto; width:50px; height:50px;background:blue;color:#fff} */



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
	   //alert("검색: "+$("#searchMap").val());
	
	   displayNEWAppend("1");//페이지번호 1값부터

	   //더보기... 버튼을 클릭했을 경우 이벤트 등록하기.
	   $("#btnMoreNEW").click(function(){
		   //alert("확인4");
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

var len = 2;
var lenNEW = 3;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	
	var searchMap = $("#searchMap").val();
	//alert("searchMap::"+searchMap);

	//var start = start;
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchMap" : searchMap
										};
	   //alert(searchMap+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJsonMap.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		//alert("테스트2");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					//alert("나와나와");
   					var tname = entry.login_name;
   					var login_id = entry.login_id;
   					var seq_tbl_board = entry.seq_tbl_board;
   					var bimg_filename = entry.bimg_filename;
   					var board_time = entry.board_time;
   					var board_content = entry.board_content;
   					var map_ky = entry.map_ky;
   					var map_we = entry.map_we;
   					var map_name = entry.map_name;
   					
   					//html += "<span style='cursor: pointer;'><a data-toggle='modal' data-target='#userlogin' data-dismiss='modal' onClick=\"goDetail('"+seq_tbl_board+"');\"><img src='resources/images/"+bimg_filename+"'style='width: 500px; height: 500px;'/></a></span><br/><br/>";
					//html += tname+login_id+seq_tbl_board+bimg_filename+board_time+board_content+map_ky+map_we+map_name+"<br/><br/>"
   					
   				     html += "<figure class='snip1166'>";
    				 html += "<figcaption>";
    				 html += "<h3>social net service :: re</h3>";
    				 html += "<span style='cursor: pointer;'><a data-toggle='modal' data-target='#userlogin' data-dismiss='modal' onClick=\"goDetail('"+seq_tbl_board+"');\"><img src='resources/images/"+bimg_filename+"'style='width: 250px; height: 250px;'/></a></span><br/><br/>";
    				 html +=  "</figcaption>";
    				 html += "</figure>";
					
   				});//end of $.each
   			
	   			  $("#displayResultNEW").append(html);
	   		     
	   		      $("#btnMoreNEW").val(parseInt(start)+lenNEW);
	  
			      $("#countNEW").text( parseInt($("#countNEW").text()) + data.length );
		
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

</head>

<%-- ****** 매장위치 찾기 Modal ******* --%> 
<%--  <div class="modal fade" id="searchStore" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" align="center">
        <div class="modal-header">
          <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">MAP</h4>
        </div>
        <div class="modal-body" style="width: 100%; height: 400px">
          <div id="idFind">
          	<iframe style="border: none; width: 100%; height: 380px;" src="<%= request.getContextPath() %>/searchEndMap.re">
          	</iframe>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
<c:forEach var="map" items="${searchMap}" >
	<c:if test="${map.BIMG_FILENAME != null}">
		 게시물번호 : ${map.SEQ_TBL_BOARD}<br/>
		 지역이름 : ${map.MAP_NAME}<br/>
		  위도 : ${map.MAP_WE}<br/>
		  경도 : ${map.MAP_KY}<br/> 
	  
	   <a data-toggle="modal" data-target="#searchStore" data-dismiss="modal"><img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;"></a><br/><br/>
	</c:if>
	<c:if test="${map.BIMG_FILENAME == null}">
	        게시물번호 : ${map.SEQ_TBL_BOARD}<br/>
		지역이름 : ${map.MAP_NAME}<br/>
		위도 : ${map.MAP_WE}<br/>
		경도 : ${map.MAP_KY}<br/> 
		
	   <a data-toggle="modal" data-target="#searchStore" data-dismiss="modal"><img src="<%=request.getContextPath()%>/resources/images/default0.png" style="width: 400px; height: 300px;"></a><br/><br/>
	</c:if>

</c:forEach> --%>

<input type="hidden" value="${search}" id="searchMap" name="searchMap"/>
<div style="margin-top:20px; margin-bottom:20px;">
<div  align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;" ></div>
	 <div style=" margin-top: 20xp; margin-bottom: 20px; align="center">
<!-- 		<button type="button" id="btnMoreNEW" value="">더보기</button> -->
		<div style="position: fixed; left: 70%;">
		<button type="button" id="btnMoreNEW" value="">더보기</button>
		</div>
		<div id="count">
	    <input type="hidden" id="btnTotalNEWCountJSON"/><span id="totalNEWCount" style="color:white;">${jMCnt}</span>
	    <input type="hidden" id="btnCountJSON"/><span id="countNEW" style="color:white;">0</span>
	    </div>
	 </div>
</div>
</body>

<!-- ////////////////////////////////////// -->
<%-- <div class="modal fade" id="userlogin" role="dialog">
   <div class="modal-dialog ">
   
      Modal content
        <div class="modal-content " align="center" style=" height: 900px;">
          <div class="modal-header">
            <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
            
            <h4 class="modal-title">♥Remeber E.member♥</h4>            
            </div>
          <div class="modal-body" style="width: 100%;"> 
                <iframe id="test001" style="border: none; width: 100%; height: 700px; zoom:50%;" src="" ></iframe>
          </div>
          <div class="modal-footer" style="margin-bottom: 0px;">
             <button type="button"class="btn btn-default myclose" data-dismiss="modal">Close</button>
          </div> 
        </div>

   </div>
</div> --%>

<div class="modal fade" id="userlogin" role="dialog">
   <div class="modal-dialog  modal-80size">
   
      <%-- Modal content --%>
        <div class="modal-content  modal-80size" align="center">
          <div class="modal-header">
            <button type="button" class="close myclose" data-dismiss="modal">&times;</button>
            
            <h4 class="modal-title">♥Remeber E.member♥</h4>
            
            </div>
          <div class="modal-body modal-80size" style="width: 100%; height: 500px;">
             <div id="login">
                <iframe id="test001" style="border: none; width: 100%; height: 450px;" src=""></iframe>
             </div>
          </div>
          <div class="modal-footer">
             <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
          </div>
        </div>

   </div>
</div>

</html>