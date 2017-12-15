<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

table{
    font-family:'Calibri';
    font-size:13px;
    background-color:#fff;
    color:#333; 
}
.table-hover > tbody > tr:hover {
  background-color: #fffedb;
}


.modal-header{
    background-color:#333;
    color:#fff;
}


/* .table-hover > tbody > tr:hover {
  background-color: blue;
}  */

.aaaa:hover {
  background-color: white;
} 

.goQ{
background-color: black;
border: black;
}

.goQ:focus{
background-color: black;
border: black;
}

.goQ:active:hover{
background-color: black;
border: black;
}

.goQ:active:focus{
background-color: black;
border: black;
}

.goQ:hover{
background-color: black;
border: black;
}




.qsearch{
width: 300px;
height: 40px;
font-size: 12px;
color: #555;
background-color: #fff;
background-image: none;
border: 1px solid #ccc;
border-radius: 4px;
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
     -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         
box-shadow:none;
border-color:#eee;      

}
 .qsearch:focus{
box-shadow:none; border-color:black;
outline: 0;
} 
.qsearch-feedback{ line-height:50px;}


.searchbox{
         
box-shadow: 5px 5px 5px 0px lightgray;

border-radius: 4px;

}


</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#displayList").hide();
	searchKeep();

	var fk_login_id = $(".cfk_login_id").val();
	
	
	$("#qsearch").keyup(function(){
	var form_data = {"qsearch":$("#qsearch").val(),
		             "fk_login_id":fk_login_id};
	
	$.ajax({
		url: "<%= request.getContextPath()%>/searchAutoEnd.re",
		type: "GET",
		data: form_data,  
		dataType: "JSON", 
		success: function(data) {
			if(data.length > 0) { // 검색된 데이터가 있는 경우라면
				
				var resultHTML = "<div class='searchbox' align='left' style='margin-bottom: 5px; margin-top:-8px; border: 0px solid black; background-color: #fff;'>";
			
				$.each(data, function(entryIndex, entry){
					var wordstr = entry.word;
					var index = wordstr.toLowerCase().indexOf( $("#qsearch").val().toLowerCase() );
					//  alert("index : " + index);
					var len = $("#qsearch").val().length;
					var result = "";
					
					result = "<span class='first' style='color:gray;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color:black; font-weight:bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color:gray;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";  
					
					resultHTML += "<span style='cursor:pointer;'>"+ result +"</span><br/>"; 
					
				});
				resultHTML += "</div>"
				$("#displayList").html(resultHTML);
				$("#displayList").show();
			}
			else {
				// 검색된 데이터가 존재하지 않는 경우라면
				$("#displayList").hide();
			} // end of if ~ else ----------------
			
		},//end of sucess
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	}); // end of $.ajax()------------------------
	
		
	});//end of keyup
	
	

	$("#displayList").click(function(event){
		
		var $target = $(event.target);
		var word = "";
		
		if ($target.is(".first")){
			word = $target.text() + $target.next().text() + $target.next().next().text();
		}
		
		else if ($target.is(".second")){
			word = $target.prev().text() + $target.text() + $target.next().text();
		}
		
		else if ($target.is(".third")){
			word = $target.prev().prev().text() + $target.prev().text() + $target.text();
		}
		
		$("#qsearch").val(word);
		// 텍스트박스에 검색된 결과의 문자열을 입력해준다.
		
		$("#displayList").hide();
		
	});// end of $("#displayList").click()----------	

 
	}); //end of $(document).ready
	
	
	
	function goqView(seq_tbl_q){	
		var frm = document.qViewFrm;
		//var statuscount = statuscount;
		frm.seq_tbl_q.value = seq_tbl_q;
		
 		frm.method = "get";
		frm.action ="<%= request.getContextPath()%>/questionView.re";
		frm.submit(); 
		//showView(statuscount);
		//alert("순서확인");
		
	
	}//end of goqView

	function goDel(seq_tbl_q,statuscount){
	var frm = document.delFrm;	
	var seq_tbl_q = seq_tbl_q;
	var statuscount = statuscount;
	//alert("확인"+seq_tbl_q);
	if (confirm("선택하신 질문을 삭제하시겠습니까?") == true){    //확인
	   
	frm.seq_tbl_q.value= seq_tbl_q;
	frm.method = "post";
	frm.action = "<%= request.getContextPath()%>/questionDel.re";
	frm.submit(); 
	
	}else{   //취소
	    return;
	}

		
		
	}
	
	
	function goQAdd(){
	var frm = document.wFrm;

	frm.method = "post";
	frm.action = "<%= request.getContextPath()%>/questionBoardAdd.re";
	frm.submit(); 
		
	}
	
	function goSearch(){
		//alert("검색누름!");
	var frm =  document.searchFrm;
	var qsearch = $("#qsearch").val();
	//alert("qsearch확인"+qsearch);
	
	if(qsearch.trim() == ""){
	alert("검색어를 입력하세요");	
	}
	
	frm.submit();
		
		
	}
	
	
	
	function searchKeep(){
		<c:if test="${(qsearch != 'null' && not empty qsearch) }">
		//colname과 search가 비어있지 않다라면 값을 유지시킨다.
		$("#qsearch").val("${qsearch}");//검색에 대한 검색어를 유지시킨다.
		</c:if>
	}
	
	
	
	
</script>



<title>백문백답</title>
</head>
<body>
<br/>
<br/>
<div style="border: solid 0px; black; width: 1200px;">

<div style="float:left; margin-top: 22px; margin-right: 15px;">
<form name="searchFrm" action="<%= request.getContextPath()%>/questionList.re" method="get">
<div align="right" style="border: solid 0px red;">
<input type="hidden" name="fk_login_id" value="${fk_login_id}">
<input type="text" id="qsearch" name="qsearch" class="qsearch" style="margin-bottom: 10px; margin-right: 10px;"/><button type="button" class="delete btn btn-danger goQ" onClick="goSearch()">검색</button>
<div id="display" style="width: 300px; height: border: 0px solid green; position: relative; right: 60px;"></div>
<div style="width: 300px; border: 0px solid black; position: relative; right: 60px;">
<div id="displayList"></div>
</div>
</div>
</form>
</div>

<div class="container"">
	<div class="row">
<span style="margin-top: -10px;"><img src="<%= request.getContextPath()%>/resources/images/q_board_count.png "> ${totalcount}개의 질문이 있습니다.</span>
	
		<table class="table table-hover table-responsive" style="width: 800px">
		    <thead>
		        <tr>
		          <%--  <th><span style="margin-left: 30%;">번호</span></th> --%>
		            <th><span style="margin-left: 50%; text-align: center;">질문내용</span></th>
		            <th><span style="margin-left: 10%;">질문날짜</span>
		            </th>
<!-- 		            <th>시퀀스</th>
		            <th>상태값</th>
		            <th>수정</th>
		            <th>삭제</th> -->
		        </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="qvo" items="${queBoardList}" varStatus="status">
		    	<tr id="d1">
		          <%--  <td width="50px"><span style="margin-left: 50%;">${status.count}</span></td>--%>
		            <td id="f1" width="400px"><span style="cursor: pointer;" onClick="goqView('${qvo.seq_tbl_q}');">${qvo.q_content}</span>
		            <c:if test="${qvo.q_status == 1}">
		            <img  src="<%= request.getContextPath() %>/resources/images/qboard_c.png"/>
 					<span style="font-size: 9pt; color: gray;">답변이 달려있어요.</span>
 					</c:if>
		            </td>
		            <td id="l1" width="110px" style="margin-right: 0%;">${qvo.q_date}
		            <input type="hidden" id="review${status.count}" value="${qvo.seq_tbl_q}"/>
		            <input type="hidden"  class="cfk_login_id" value="${qvo.fk_login_id}"/>
		            <input type="hidden" value="${qvo.q_askid}"/>
		            <input type="hidden" value="${qvo.q_status}"/>
 					<c:if test="${qvo.fk_login_id == sessionScope.loginUser.login_id}">
 					<!-- <button type="button" data-toggle="modal" data-target="#edit" data-uid="1" class="update btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span></button> -->
 					<button style="margin-left: 20%;" type="button" class="delete btn btn-danger" onClick="goDel('${qvo.seq_tbl_q}','${status.count}');">Delete<%-- <span class="glyphicon glyphicon-trash"></span> --%></button>
 					</c:if>

		            
		            </td>  
		            
		        </tr>	        

		    </c:forEach>
		    </tbody>
		</table>
		<div align="right" style="margin-right: 20px;"><button style="" type="button" class="delete btn btn-danger goQ" onClick="goQAdd();">질문하기</button>
		<button style="" type="button" class="delete btn btn-danger goQ" onClick="javascript:location.href='<%= request.getContextPath() %>/questionList.re?fk_login_id=${fk_login_id}'">전체목록</button>
		</div>
	</div>
	
</div>
	
	
<div style="position: relative; left: 60%; ">
${pagebar}
</div>

</div>
<form name="qViewFrm">
<input type="hidden" name="seq_tbl_q"/>
<input type="hidden" id="gobackURL" name="gobackURL" value="${gobackURL}"/>
</form>

<form name="delFrm">
<input type="hidden" name="seq_tbl_q"/>
<input type="hidden" name="fk_login_id" value="${fk_login_id}"/>
<input type="hidden" id="gobackURL" name="gobackURL" value="${gobackURL}"/>
</form>

<form name="wFrm">
<input type="hidden" name="fk_login_id" value="${fk_login_id}"/>
<input type="hidden" name="q_askid" value="${sessionScope.loginUser.login_id}"/>
<input type="hidden" id="gobackURL" name="gobackURL" value="${gobackURL}"/>
</form>


</body>
</html>