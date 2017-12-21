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
	

});//document



</script>
<head>
검색어결과뷰단Map
</head>

<%-- ****** 매장위치 찾기 Modal ******* --%> 
 <div class="modal fade" id="searchStore" role="dialog">
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

</c:forEach>



<form name="moreResults">
	<div align="center">
		<button type="button" >더보기</button>
	</div>
</form>
      
</body>
</html>