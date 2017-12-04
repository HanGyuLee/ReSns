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
	
/* 	$("#follow").click(function(){
		var follow_id = $("#followId").val();
		alert("확인::"+follow_id);
		
	});
	 */
	
});

function goFollow(){
	alert("확인");
	var frm = document.follow;
	
	frm.method = "post";
	frm.action = "<%= request.getContextPath()%>/followAdd.re";
	frm.submit();
	
}





function goUnFollow(){
	alert("언팔 ㅋ");
	var frm = document.unfollow;
	
	frm.method = "post";
	frm.action = "<%= request.getContextPath()%>/unFollowAdd.re";
	frm.submit();
	
}


</script>

</head>



<body>

j
팔로우 테스트 위한 팔로우할 아이디: gyuri   /    noname     /      chamgrain
<form name="follow">
팔로:<input type="text" id="followId" name="followId"/><br/>
</form>

<form name="unfollow">
언팔:<input type="text" id="unFollowId" name="unFollowId"/><br/>
</form>

<button type="button" id="follow" onClick="goFollow();">팔로우 하기</button><br/>
<button type="button" id="unfollow" onClick="goUnFollow();">언팔로우 하기</button><br/>


 <c:forEach var="list" items="${followList}">
팔로우 당하는 사람 아이디: ${list.follow_id} <br/>
팔루우 당하는 사람 이름 : ${list.follow_name}<br/>
팔로우 당하는 사람 프로필 사진 : ${list.follow_pimage}<br/>
</c:forEach>


<c:forEach var="list1" items="${followerList}">
나를 팔로우 하는 사람 아이디:${list1.follower_id}<br/>
나를 팔로우 하는 사람 이름 : ${list1.follower_name}<br/>
나를 팔로우 하는 사람 프로필 사진 : ${list1.follower_pimage}<br/>
</c:forEach>

</body>
</html>