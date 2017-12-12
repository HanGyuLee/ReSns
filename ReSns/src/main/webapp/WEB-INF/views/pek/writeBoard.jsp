<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#latitude").hide();
	$("#longitude").hide();



    $('#board_content').on('keyup', function() {
        if($(this).val().length > 600) {

            $(this).val($(this).val().substring(0, 600));
            alert("공백 포함 600자 까지만 쓸 수 있습니다.");

        }
    });
    
    
    $('#tag_content').on('keyup', function() {
        if($(this).val().length > 60) {

            $(this).val($(this).val().substring(0, 60));
            alert("해시태그는 60자 까지만 가능합니다.");

        }
    });
    
    $("#attach").change(function(){
    	
    	var ext = $(this).val().split(".").pop().toLowerCase();
    	
    	if ($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
    		swal("gif, jpg, jpeg, png 파일만 업로드해주세요.");
    		$(this).val("");
    		return;
    	}
    	
    	var fileSize = this.files[0].size;
    	var maxSize = 1024 * 1024 * 7;
    	
    	if (fileSize > maxSize) {
    		swal("파일용량 7MB를 초과했습니다.");
    		$(this).val("");
    		return;
    	}
    	
    });

    
    $("input[name='loc']:radio").change(function () {
    	
    	var loc = this.value;
    	
    	if (loc == "1") {
    		showMyLoc();
    		
    	}
    	else {
    		
    		$("#latitude").empty();
    		$("#longitude").empty();
    		$("#message").empty();
    		
    	}
    	
    });
    
    
    
   
    $("#board_content").change(function(){
	  
  	 var board_content = $("#board_content").val();
	  
	 if (board_content == "" || $.trim(board_content) == "") {
		  
		swal("글 내용을 입력하셔야 합니다.");
		  
		$("#writeBtn").prop("disabled", true); 
	 }
	 else {
		 
		$("#writeBtn").prop("disabled", false);
		 
	 }
	  
  });
    
    
    $("#writeBtn").click(function(){
    	
    	
    	var frm = document.writeFrm;
		 
		frm.map_we.value = $("#latitude").text();
		frm.map_ky.value = $("#longitude").text();
		frm.map_name.value = $("#message").text();
		
		//alert(frm.map_name.value);
		frm.method = "POST";
		frm.action = "/resns/writeBoardEnd.re";
		frm.submit();
    	
    });
    

});



function showMyLoc() {        
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            $('#latitude').html(pos.coords.latitude);     // 위도
            $('#longitude').html(pos.coords.longitude); // 경도
            
            
            googleapisView();
            
        });
    } else {
        alert("이 브라우저에서는 위치정보 찾기를 지원되지 않습니다.")
    }
}



function googleapisView() {
    var lat = $("#latitude").text();
    var lng = $("#longitude").text();
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&sensor=false";
    jQuery.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
                        var tag = "<br/> "+myJSONResult.results[0].formatted_address+"<br />";
                        
                        document.getElementById("message").innerHTML = tag;
                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                    }
            }
    });
 
}



</script>
</head>
<body>

<div style="background-color: white; width: 55%; height: 800px; margin-left: 400px; border: 1px solid white;">

<form enctype="multipart/form-data" id="writeFrm" name="writeFrm" class="form-horizontal" style="margin-top: 100px; width:100%;">
<fieldset>

<!-- Form Name -->
<legend>글 작성</legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="selectbasic">글 상태</label>
  <div class="col-md-2">
    <select id="board_status" name="board_status" class="form-control">
      <option value="0">전체공개</option>
      <option value="1">비공개</option>
    </select>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="textarea">글 내용</label>
  <div class="col-md-4">                     
    <textarea  placeholder="600자까지 가능합니다." class="form-control" id="board_content" name="board_content" rows="5" cols="300" style="resize: none;"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tag_content">해시태그</label>  
  <div class="col-md-4">
  <input id="tag_content" name="tag_content" type="text" placeholder="60자까지 가능합니다." class="form-control input-md">
    
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="attach">사진</label>
  <div class="col-md-4">
    <input id="attach" name="attach" class="input-file" type="file">
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label">현재 나의 위치</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="locOn">
      <input type="radio" name="loc" id="locOn" value="1">
      켜기
    </label> 
    <label class="radio-inline" for="locOff">
      <input type="radio" name="loc" id="locOff" value="2" checked="checked">
      끄기
    </label>
    <span id="latitude"></span>
    <span id="longitude"></span>
  	<span id="message" style="font-weight: bold; font-size: 8pt;"></span>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="writeBtn"></label>
  <div class="col-md-4">
    <button id="writeBtn" name="writeBtn" class="btn btn-default">작성</button>
  </div>
</div>

<input type="hidden" id="map_we" name="map_we" value=""/>
<input type="hidden" id="map_ky" name="map_ky"  value=""/>
<input type="hidden" id="map_name" name="map_name" value=""/>

</fieldset>
</form>

</div>

</body>
</html>