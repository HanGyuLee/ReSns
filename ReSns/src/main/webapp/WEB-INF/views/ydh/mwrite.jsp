<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	function goWrite() {
		//유효성검사
		var writeFrm = document.writeFrm;
		writeFrm.action = "<%= request.getContextPath() %>/mwriteEnd.re";
		writeFrm.method = "post";
		writeFrm.submit(); 
	}
</script>


<body>

<!-- 글쓰기폼 -->

<div style="margin-top:100px; padding-left: 10%; border: solid 0px red; ">
  <h2>♥MAKE YOUR OWN COLLECTION♥</h2>
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
				<td><input type="text" name="music_name" class="long" /></td>
			</tr>
			<tr>
            	<th>내용</th>
            	<td><textarea name="music_content" class="long" style="height: 200px;"></textarea></td>
         	</tr>
         	
         	<!-- 유튭링크 -->
         	<tr>
         		<th>youtube-URL</th>
         		<td><input name="music_link" class="long"/></td>
         		
         	</tr>
         	
         	
			<!--     암호걸어주기
			<tr>   
				<th>암호</th>
				<td><input type="password" name="pw" class="short" /></td>
			</tr>
			 -->
		</table>
		<br/>
	    <!-- 댓글쓰기있음 -->
		<input type="hidden" name="seq_remusic" value="${seq_remusic}"/>
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