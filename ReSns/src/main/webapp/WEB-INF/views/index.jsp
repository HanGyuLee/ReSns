<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#popBoard").click(function(){
			
			var form_data = {"seq_tbl_board" : $("#seq_tbl_board").val(),
							"fk_login_id" : $("#fk_login_id").val()
							};
			
			
			$.ajax({
				
				url: "/resns/detailBoard.re",
				type: "GET",
				data: form_data,  
				dataType: "JSON", 
				success: function(data) {
				
					alert(".");
					
				}, error: function() {
					
				}
				
			});
			
		});
		
		
	});

</script>
</head>
<body>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<section>
	
	 <c:forEach items="${boardList}" var="map" varStatus="status">

		  <div class="container gal-container">
		    <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
		      <div class="box">
		        <a href="#" data-toggle="modal" data-target="#${status.count}">
		          <img id="popBoard" src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 300px; height: 300px;">
		        
		        </a>
		        <div class="modal fade" id="${status.count}" tabindex="-1" role="dialog">
		          <div class="modal-dialog" role="document">
		            <div class="modal-content" style="width: 800px; height: 500px;">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		              <div class="modal-body">
		              <div style="width: 68%; height: 350px; border: 1px solid blue; float: left;">
		                <img src="<%=request.getContextPath()%>/resources/images/${map.BIMG_FILENAME}" style="width: 400px; height: 300px;">
		               </div>
		                <div style="border: 1px solid red; width: 30%; height: 350px; float: right;">
		                </div>
		                <div style="border: 1px solid green; width: 68%; height: 120px; float: left;">
		                </div>
		                <div style="border: 1px solid purple; width: 30%; height: 120px; float: right;">
		                </div>
		              </div>
		                <div class="col-md-12 description">
		                </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		</div>
		<input type="hidden" id="seq_tbl_board" value="${map.SEQ_TBL_BOARD}"/>
		<input type="hidden" id="fk_login_id" value="${map.FK_LOGIN_ID}"/>
	 </c:forEach>
	</section>
</body>
</html>