<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>

<head>
<meta charset="UTF-8" />
<title>글쓰기페이지</title>
</head>

<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 600px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 		

</style>
<script type="text/javascript">
$(document).ready(function(){
	

	
});


	//글자수 제한 체크 
	function len_chk(){  
	  var frm = document.writeFrm.music_content; 
	    
	  if(frm.value.length > 500){  
	       alert("글자수는 영문500, 한글500자로 제한됩니다.!");  
	       frm.value = frm.value.substring(0,500);  
	       frm.focus();  
	  } 
	
	} 
	
    //글쓰기
	function goWrite() {

		var link = $("#music_link").val();
		var content = $("#music_content").val();
		var subject = $("#music_name").val();
		if(link=="" || content=="" || subject==""){
			alert("내용을 입력해주세요:D");
			
		}else{
			var writeFrm = document.writeFrm;
			writeFrm.action = "<%= request.getContextPath() %>/mwriteEnd.re";
			writeFrm.method = "POST";
			writeFrm.submit(); 
		
		}
	}
	
	
	
</script>


<body>

<!-- 글쓰기폼 -->

<div style="margin-top:100px; padding-left: 10%; border: solid 0px red; ">
  <h2>♥MAKE YOUR OWN COLLECTION♥</h2>
  <div style="margin-top:20px; margin-bottom:20px; ">
      <a href="http://www.youtube.com/" target="_blank">LINK TO YOUTUBE</a>
  </div>
  <form name="writeFrm" enctype="multipart/form-data" >
		<table id="table">
			<tr>
				<th>성명</th>
				<td>
				   <input type="text" name="fk_login_id" id="userid" value="${sessionScope.loginUser.login_id}" readonly /> 
					<input type="text" name="login_name" value="${sessionScope.loginUser.login_name}" class="short" readonly />
				</td> 
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="music_name" id="music_name" class="long" /></td>
			</tr>
			<tr>
            	<th>내용</th>
            	<td><textarea   onKeyup="len_chk()" name="music_content" id="music_content" class="long" style="height: 200px; "></textarea></td>
         	</tr>
         	<!-- 유튭링크 -->
         	<tr>
         		<th>youtube-URL</th>
         		<td>
         		   <input name="music_link" id="music_link" class="long"  />
         		</td>
         		
         	</tr>
         	
		</table>
		<br/>
	    <!-- 댓글쓰기있음 -->
	    <input type="hidden" name="seq_tbl_remusic" value="${seq_tbl_remusic}"/>
		<input type="hidden" name="seq_tbl_music" value="${seq_tbl_music}"/>
		<input type="hidden" name="re_ycontent" value="${re_ycontent}"/>
		<input type="hidden" name="re_login_id" value="${re_login_id}"/>
		
		<div style="margin-left:200px;">
		    <button type="button" onClick="goWrite();">완료</button>
		    <button type="button" onClick="javascript:history.back();">취소</button>
		</div>
           <!-- 	<div style="display: inline-block;">
	       <iframe></iframe>
	     </div>	 -->
	
  </form>
</div>
</body>
</html>