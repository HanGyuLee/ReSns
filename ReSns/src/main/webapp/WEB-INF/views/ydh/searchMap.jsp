<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	alert("검색: "+$("#searchMap").val());
	
	   displayNEWAppend("1");//페이지번호 1값부터

	   //더보기... 버튼을 클릭했을 경우 이벤트 등록하기.
	   $("#btnMoreNEW").click(function(){
		   alert("확인4");
		   displayNEWAppend($(this).val());
		   
	   });
	
	
	
	
});//document

var len = 2;
var lenNEW = 1;//더보기... 클릭에 보여줄 상품의 갯수 단위크기

function displayNEWAppend(start){
	
	var searchMap = $("#searchMap").val();
	alert("searchMap::"+searchMap);

	//var start = start;
	
	
	var form_data = { "start" : start
					  ,"lenNEW" : lenNEW
					  ,"searchMap" : searchMap
										};
	alert(searchMap+"나와라1");
	   $.ajax({
	   		url:"/resns/displaymoreJsonMap.re",
	   		type:"get",
	   		data: form_data,
	   		dataType: "JSON",
	   		success: function(data){
	   		alert("테스트2");
	   		
	   			var html ="";
	
   			
   				$.each(data, function(entryIndex,entry){
   					alert("나와나와");
   					var tname = entry.login_name;
   					var login_id = entry.login_id;
   					var seq_tbl_board = entry.seq_tbl_board;
   					var bimg_filename = entry.bimg_filename;
   					var board_time = entry.board_time;
   					var board_content = entry.board_content;
   					var map_ky = entry.map_ky;
   					var map_we = entry.map_we;
   					var map_name = entry.map_name;
   					
   					
					html += tname+login_id+seq_tbl_board+bimg_filename+board_time+board_content+map_ky+map_we+map_name+"<br/><br/>"
   					
   				});//end of $.each
   				alert("테스트3");
   			       //조회해온 사품의 정보를 출력하기
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
검색어결과뷰단Map
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

 <input type="text" value="${search}" id="searchMap" name="searchMap"/>
 ${search}
 <div  align="center" id="displayResultNEW" style="margin: auto; border: solid 0px red;"></div>
	 <div style="margin-top: 20px; margin-bottom: 20px;">
		<button type="button" id="btnMoreNEW" value=""> 더보기</button>
		<br/>
		<br/>
		<%-- <button type="button" id="btnTotalNEWCountJSON">TotalNEWCount : <span id="totalNEWCount">${totalNEWCount}</span></button> --%>
		<!-- <button type="button" id="btnCountJSON">Count : <span id="countNEW">0</span></button> -->
	 </div>
</body>
</html>