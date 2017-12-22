<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>

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


/* .q_contentbox{
border-radius: 25px;
background-color: skyblue;
}

.a_contentbox{
border-radius: 25px;
background-color: #fffd95;
} */



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
background-color: #343434;
border: black;
}

.goQ:active:hover{
background-color: #343434;
border: black;
}

.goQ:active:focus{
background-color: #343434;
border: black;
}

.goQ:hover{
background-color: #343434;
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
border-color:#dbdbdb;      

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





.triangle-isosceles {
  position:relative;
  padding:15px;
/*   margin:1em 0 3em; */
  color:#000;
  background:#f3961c; /* default background for browsers without gradient support */
  /* css3 */
  background:-webkit-gradient(linear, 0 0, 0 100%, from(#f9d835), to(#f3961c));
  background:-moz-linear-gradient(#f9d835, #f3961c);
  background:-o-linear-gradient(#f9d835, #f3961c);
  background:linear-gradient(#f9d835, #f3961c);
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

.triangle-isosceles:after {
  content:"";
  position:absolute;
  bottom:-15px; /* value = - border-top-width - border-bottom-width */
  left:50px; /* controls horizontal position */
  border-width:15px 15px 0; /* vary these values to change the angle of the vertex */
  border-style:solid;
  border-color:#f3961c transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}





.triangle-obtuse {
  position:relative;
  padding:15px;
/*   margin:1em 0 3em; */
  color:#000;
  background:#8c8c8c; /* default background for browsers without gradient support */
  /* css3 */
  background:-webkit-gradient(linear, 0 0, 0 100%, from(#8c8c8c), to(#000000));
  background:-moz-linear-gradient(#8c8c8c, #000000);
  background:-o-linear-gradient(#8c8c8c, #000000);
  background:linear-gradient(#8c8c8c, #000000);
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

.triangle-obtuse:after {
  content:"";
  position:absolute;
  bottom:-15px; /* value = - border-top-width - border-bottom-width */
  left:600px; /* controls horizontal position */
  border-width:15px 15px 0; /* vary these values to change the angle of the vertex */
  border-style:solid;
  border-color:#000000 transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}




</style>

<script type="text/javascript">
$(document).ready(function(){
    $('#a_contentw').on('keyup', function() {
        if($(this).val().length > 150) {

            $(this).val($(this).val().substring(0, 150));
            alert("공백 포함 150자 까지만 쓸 수 있습니다.");

        }
    });
	
	
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
		
	}); //end of $("#displayList").click()----------	

 
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
	
	

	function goQboardRe(){
		

		var frm =  document.qboardReFrm;
		
		frm.method = "post";
		frm.action ="<%= request.getContextPath()%>/questionReEnd.re";
		frm.submit(); 
		
	}



	function goQReDel(){
		
		var frm =  document.qboardReFrm;
		
		frm.method = "post";
		frm.action ="<%= request.getContextPath()%>/questionReDel.re";
		frm.submit(); 
		
	}
	
	
	
</script>



<title>답변보기</title>
</head>
<body>
<br/>
<br/>
<div style="border: solid 0px skyblue; width: 900px; position: relative; left: 5%;">


	<div class="myrow" style="width:900px; border: 0px solid red; ">
<form name="qboardReFrm">
<span style="margin-top: -10px;"><img src="<%= request.getContextPath()%>/resources/images/q_board_count.png "> ${totalcount}개의 질문이 있습니다.</span>
		<button style="position: relative; left: 53%;" type="button" id="q_ce" class="delete btn btn-danger goQ" onClick="javascript:location.href='<%= request.getContextPath() %>/${gobackURL}'">리스트로 돌아 가기</button>

		<table class="table table-hover table-responsive" style="width: 800px; border:1px solid; border-color: #c2c2c2; margin-top: 10px;">
		    <thead>
		        <tr>
		            <th colspan="5"><span style="margin-left: 45%; font-size: 12pt;">${getques.q_date}</span></th>

		        </tr>
		    </thead>
		    <tbody>
		    	<tr id="d1">
		    	<td></td>
		            <td align="center" id="f1" width="600px" colspan="3">
		           <p class="triangle-isosceles">${getques.q_content}</p>
		            <img style="position: relative; right: 38%;" src="<%=request.getContextPath() %>/resources/images/q_ask_icon.png">
		            <input id="fk_seq_tbl_q" name="fk_seq_tbl_q" type="hidden" value="${getques.seq_tbl_q}"/>
		           <input type="hidden" id="q_askid" name="q_askid" value="${getques.q_askid}"/>
		            </td>   
		            <td></td>
		            
		        </tr>	
		        

		        
		        		        
		        <tr>
		        <td colspan="5" style="border-top-style: hidden; border-bottom-style: hidden;"></td>
		        </tr>      
		        
		        
		        <tr>
		        <td></td>
		        
		        <td colspan="3" width="600px" align="center"> 
		        <c:if test ="${replayMap.a_content == null}" >
		       
				<span style="color: black; font-weight:bold; font-size:15pt;  text-align: center;">아직 답변이 없습니다.</span>
				${replayMap.fk_login_name}
				</c:if>
				
				<c:if test ="${replayMap.a_content != null}">
				<div  align="left">답변날짜:${replayMap.a_date}</div>
				<p class="triangle-obtuse">
				<span style="color: white;  text-align: center;">${replayMap.a_content}</span></p>
				<div style="font-size: 17pt; font-weight:bold; position: relative; left: 38%;">${replayMap.fk_login_name}</div>
				</c:if>        
				</td>
		        <td></td>
		        </tr>  

		
		<c:if test ="${replayMap.a_content != null && getques.fk_login_id == sessionScope.loginUser.login_id}">
			<tr>
		<td colspan="5" align="center" style="border-left-style:hidden; border-right-style:hidden; border-bottom-style: hidden;"> <button type="button" id="q_board_re"  onClick="goQReDel();" class="delete btn btn-danger">답변 삭제</button>
		</td>
		</tr>
		</c:if>
		
		<c:if test ="${replayMap.a_content == null && getques.fk_login_id == sessionScope.loginUser.login_id}">
			<tr>
		<td colspan="5" style="border-left-style:hidden; border-right-style:hidden; border-bottom-style: hidden;">
		<textarea class="a_content" name="a_content" id="a_contentw" placeholder="답변을 작성해주세요." style="border-style:hidden; border-bottom-style:solid; position:relative; right:5px; width:700px; height:40px; resize: none;"></textarea>
		<button style="margin-left: -3px; width: 80px; padding-left: 0px; padding-right: 0px; margin-top: -30px; " type="button" id="q_board_re"  onClick="goQboardRe();" class="delete btn btn-danger">답변 작성</button>
		</td>
		</tr>
		</c:if>


		    </tbody>
		</table>


		<input type="hidden" id="gobackURL" name="gobackURL" value="${gobackURL}"/>
		<input type="hidden" id="fk_login_id" name="fk_login_id" value="${getques.fk_login_id}"/>
		<input type="hidden" id="totalcount" name="totalcount" value="${totalcount}"/>

</form>
		
			</div>
<div style="border:0px solid black; width:900px;">


<form name="searchFrm" action="<%= request.getContextPath() %>/questionList.re" method="get">
<div id ="searchDiv" align="right" style="width:450px; position:relative; left:38%;  border: solid 0px red;">
<input type="hidden" name="fk_login_id" value="${getques.fk_login_id}">
<input type="text" id="qsearch" name="qsearch" class="qsearch" style="margin-bottom: 10px; margin-right: 10px;"/><button type="button" class="delete btn btn-danger goQ" onClick="goSearch()">검색</button>
<div id="display" style="width: 300px; height: border: 0px solid green; position: relative; right: 60px;"></div>
<div style="width: 300px; border: 0px solid black; position: relative; right: 60px;">
<div id="displayList"></div>
</div>
</div>
</form>

</div>		




	

</div>




</body>
</html>