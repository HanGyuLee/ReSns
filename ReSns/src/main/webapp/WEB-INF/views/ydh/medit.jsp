<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

   
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
	
	a{text-decoration: none;}	

</style>

<script type="text/javascript">

$(document).ready(function(){
	
	
});//document


	function goUpdate() {
		
	<c:if test="${sessionScope.loginUser.login_name != null}">	

			var link = $("#music_link").val();
			var content = $("#music_content").val();
			var subject = $("#music_name").val();
			
			if(link=="" || content=="" || subject==""){
				alert("내용을 입력해주세요:D");
			}else{
				var editFrm = document.editFrm;
				
				editFrm.action = "/resns/meditEnd.re";
				editFrm.method = "post";
				editFrm.submit();
			}
	</c:if>	

	<c:if test="${sessionScope.loginUser.login_name == null}">	
	   alert("로그인해주세요.");
	   location.href="/resns/login.re"; 
	</c:if>
	
	}//goUpdate()
	
	
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>글수정</h1>
	<form name="editFrm">     
		<table id="table">
		
			<tr>
				<th>글번호</th>
				<td><input type="hidden" name="seq_tbl_music" value="${seq_tbl_music}"/>${mvo.seq_tbl_music}
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="hidden" name="fk_login_id" value="${fk_login_id}"/>${sessionScope.loginUser.login_id}</td>
				
			</tr>
			<tr>
	           	<th>제목</th>
	           	<td><input type="text" name="music_name" id="music_name" value="${mvo.music_name}" style="width: 300px;" /></td>
	        	</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="music_content" id="music_content" class="long" style="height: 200px;">${mvo.music_content}</textarea></td>
			</tr>
			<tr>
				<th>YOUTUBE-LINK</th>
				<td>
				<input name="music_link" id="music_link" class="long" value="${mvo.music_link}" >
				</td>
			</tr>
		    
		     
		       
		</table>
		
		<br/>
			<button type="button" onClick="goUpdate();">완료</button>
		    <button type="button" onClick="javascript:history.back();">취소</button>
	
	</form>	
		
</div>














