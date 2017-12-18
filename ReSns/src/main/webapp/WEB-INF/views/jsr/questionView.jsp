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
  background-color: #fff;
}


.modal-header{
    background-color:#333;
    color:#fff;
}



.a_content:focus{
box-shadow:none; border-color:black;
outline: 0;
}
.a_content-feedback{ line-height:50px;}


.q_contentbox{
border-radius: 25px;
background-color: skyblue;
}

.a_contentbox{
border-radius: 25px;
background-color: #fffd95;
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

	var fk_login_id = $("#fk_login_id").val();
	
	
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



<title>답변보기</title>
</head>
<body>
<br/>
<br/>
<div style="border: solid 0px; black; width: 1200px;">

<div style="float:left; margin-top: 22px; margin-right: 15px;">
<form name="searchFrm" action="<%= request.getContextPath()%>/questionList.re" method="get">
<div align="right" style="border: solid 0px red;">
<input type="hidden" name="fk_login_id" value="${getques.fk_login_id}">
<input type="text" id="qsearch" name="qsearch" class="qsearch" style="margin-bottom: 10px; margin-right: 10px;"/><button type="button" class="delete btn btn-danger goQ" onClick="goSearch()">검색</button>
<div id="display" style="width: 300px; height: border: 0px solid green; position: relative; right: 60px;"></div>
<div style="width: 300px; border: 0px solid black; position: relative; right: 60px;">
<div id="displayList"></div>
</div>
</div>
</form>
</div>



<div class="container">
	<div class="row">
	<form name="qboardReFrm">
<span style="margin-top: -10px;"><img src="<%= request.getContextPath()%>/resources/images/q_board_count.png "> ${totalcount}개의 질문이 있습니다.</span>
	
		<table class="table table-hover table-responsive" style="width: 800px">
		    <thead>
		        <tr>
		            <th><span style="margin-left: 50%; text-align: center;">${getques.q_date}</span></th>

		        </tr>
		    </thead>
		    <tbody>
		    	<tr id="d1">
		            <td id="f1" width="400px">
		            <img src="<%=request.getContextPath() %>/resources/images/q_ask_icon.png">
		            <div class="q_contentbox" style=" width: 400px;" ><div style="margin-left: 20px; margin-right: 15px;">${getques.q_content}</div></div>
		            <input id="fk_seq_tbl_q" name="fk_seq_tbl_q" type="hidden" value="${getques.seq_tbl_q}"/>
		           <input type="hidden" id="q_askid" name="q_askid" value="${getques.q_askid}"/>
		            </td>   
		            
		        </tr>	
		        
		        <tr>
		        <td></td>
		        </tr>      
		        
		        
		        <tr>
		        <td>
		        
		        <div style="margin-left: 10px;"><img src="<%=request.getContextPath() %>/resources/images/a_board_login_id.png"></div>
		       <div class="a_contentbox">
		        <c:if test ="${replay.a_content == null}" >
				<div style="text-align:right; margin-right: 15px;">아직 답변이 없습니다.</div>
				</c:if>
				 <c:if test ="${replay.a_content != null}" >
				<div style="text-align:right; margin-left:10px; margin-right: 15px;">${replay.a_content}</div>
				</c:if>        
				</div>
		        </td>
		        </tr>  

				<tr>
				<td>
		<c:if test ="${replay.a_content != null && getques.fk_login_id == sessionScope.loginUser.login_id}">
		<td colspan="5" align="center"> <button type="button" id="q_board_re"  onClick="goQReDel();" class="delete btn btn-danger">답변 삭제</button></td>
		
		</c:if>
		
		<c:if test ="${replay.a_content == null && getques.fk_login_id == sessionScope.loginUser.login_id}">
		<div style="margin-left: 10px;"><textarea class="a_content" name="a_content" id="a_contentw" placeholder="답변을 작성해주세요." style=" height:100px; resize: none;"></textarea>
		<button type="button" id="q_board_re"  onClick="goQboardRe();" class="delete btn btn-danger">답변 작성</button>
		</div>
		</c:if>
		</td>
		
				</tr>


		    </tbody>
		</table>

		<div align="right">
		<button type="button" id="q_ce" class="delete btn btn-danger goQ" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">리스트로 돌아 가기</button>
	</div>
	
		<input type="hidden" id="gobackURL" name="gobackURL" value="${gobackURL}"/>
		<input type="hidden" id="fk_login_id" name="fk_login_id" value="${getques.fk_login_id}"/>

</form>
	
	
		</div>
	</div>
	
</div>



</body>
</html>