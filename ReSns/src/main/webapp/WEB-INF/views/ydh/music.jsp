<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style type="text/css">
	table, th, td {border: solid gray 1px;}
	/* #table {border-collapse: collapse; width: 750px;} */
	
	.subjectstyle {font-weight: bold;
    	           color: navy;
    	           cursor: pointer; }
	    
   /* === #142. 파일 첨부가 되었으므로 테이블의 가로폭 늘이기 ===  */
   #table { border-collapse: collapse; width:920px;}
   #table th, #table td {padding:5px;}
   #table th {background-color:#DDDDDD;}
   
</style>

 
<script type="text/javascript">
	$(document).ready(function(){
		
		//전체삭제
		$("#allCheckbox").click(function(){
			
			$(".delChkbox").prop("checked", $(this).is(":checked"));
			
		});
		
		searchKeeping();
		
		// Ajax로 검색어 입력시 자동글 완성하기
		$("#displayList").hide();
		
		$("#search").keyup(function() {
			
			var form_data = { "colname" : $("#colname").val(),   // 키값 : 밸류값 
							  "search"  : $("#search").val()     // 키값 : 밸류값
							};
			
			$.ajax({
				url: "/resns/msearchJson.re",
				type: "GET",
				data: form_data,  
				dataType: "JSON", 
				success: function(data) {
					if(data.length > 0) { // 검색된 데이터가 있는 경우라면
						
						var resultHTML = "";
					
						$.each(data, function(entryIndex, entry){
							var wordstr = entry.word;
							var index = wordstr.toLowerCase().indexOf( $("#search").val().toLowerCase() );
							//alert("index : " + index);
							var len = $("#search").val().length;
							var result = "";
							
							result = "<span class='first' style='color:blue;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color:red; font-weight:bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color:blue;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";  
							
							resultHTML += "<span style='cursor:pointer;' color:blue;>"+ result +"</span><br/>"; 
						});
						
						$("#displayList").html(resultHTML);
						$("#displayList").show();
					}
					else {
						
						$("#displayList").hide();
					} // end of if ~ else 
				}, // end of success: function()
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); // end of $.ajax()
			
		}); // end of keyup(function(){})
		

		$("#displayList").click(function(event){
			//alert("test");
			var wordd = "";
		  
			var $target = $(event.target);
			//alert("targettest::"+wordd);
			//alert("targettest2::"+ $target);
			  
			if($target.is(".first")) {
				wordd = $target.text() + $target.next().text() + $target.next().next().text();
				//alert("wordtest1::"+wordd)
			}
			else if($target.is(".second")) {
				wordd = $target.prev().text() + $target.text() + $target.next().text();
				//alert("wordtest2::"+wordd)
			}
			else if($target.is(".third")) {
				wordd = $target.prev().prev().text() + $target.prev().text() + $target.text();
				//alert("wordtest3::"+wordd)
			}
			
			$("#search").val(wordd); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			//alert("word search:::"+wordd);
			$("#displayList").hide();
			
		});
	
	});// end of $(document).ready()----------------------
	
	function goView(seq_tbl_music){
		
		var frm = document.seqFrm;
		frm.seq_tbl_music.value = seq_tbl_music;
		//frm.gobackURL.value=gobackURL;
		
		frm.method="get";
		frm.action="/resns/mview.re";
		frm.submit();
	
	}//goView
	
	function mDel(){
		
		var frm = document.delfrm;
		frm.method ="POST";
		frm.action ="/resns/mdelChckbox.re";
		frm.submit();
		
	}//mdel
	
	function searchKeeping(){
		<c:if test="${(colname != 'null' && not empty colname) && (search != 'null' && not empty search)}" >
		
			$("#colname").val("${colname}");
			$("#search").val("${search}");
		</c:if>
	}
	
	
	function goSearch(){
  		var frm = document.searchFrm;
  		var search = $("#search").val();
  		alert("searchtest::"+search);
  		//frm.method ="get";
  		//frm.action = "/resns/music.re";
  		
  		
  		if(search.trim() == ""){
  			alert("검색어를 입력하세요.");
  			return;
  		}else{
  			alert("searchtest222::"+search);
  			frm.submit();
  		}

  	}	
	
	
</script>

<div align="center" style="padding-left: 10%; border: solid 0px red;">
	<h1>YOUTUBE-LIST</h1><br/><br/>
	
	 
	<!-- ==== 테이블 보여주기 ==== -->
	 <!-- ====  글검색 폼 추가하기 : 글제목, 내용, 글쓴이로 검색하도록 한다. -->
	<form name="searchFrm" action="<%=request.getContextPath() %>/music.re" method="get" >
		<select name="colname" id="colname"> 
			<option value="music_name">제목</option>
			<option value="music_content">내용</option>
		</select>
			<input type="text" name="search" id="search" size="40px"/>
			<button type="button" onClick="goSearch();">검색</button> 
			<!-- ===== Ajax로 검색어 입력시 자동글 완성하기 ===== -->
		   <div id="displayList" style="width:312px; margin-left: 57px; border-top: 0px; border: solid gray 1px;">
		   </div>
	</form>

<table id="table">
	
	<thead>
		<div style="margin-left:750px; margin-bottom:5px;">
			<button onClick="javascript:location.href='/resns/mwrite.re'">글쓰기</button>&nbsp;
			<button type="button" style=" margin-top:20px; margin-bottom:10px;" onClick="mDel();">삭제</button>&nbsp;
		</div>
			<tr align="center">
			<th style="width: 70px;">글번호</th>
			<th style="width: 360px;">제목</th>
			<th style="width: 70px;">날짜</th>
			<th style="width: 70px;"><span style="font-size:9pt; color:red;"><label for ="allCheckbox">전체선택&nbsp;</label></span>&nbsp;<input type="checkbox" id="allCheckbox" /></th>
		</tr>
	 </thead>	
 	
	<tbody>
	
	<c:if test="${mlist == null || empty mlist }">
	 <tr>
	   <td align="center" colspan="4"><span style="color:red; font-weight:bold;">등록된 게시물이 없습니다.</span></td>
	 </tr>
	</c:if>

	<form name="delfrm">

	 <c:forEach var="m" items="${mlist}" varStatus="status"> 
			<tr>
			<td align="center" style="width: 70px;">${m.RNO}</td>
			<c:if test="${m.MUSIC_COMMENTCOUNT != 0}">
			<td align="center" style="width: 360px;"><span style="cursor: pointer;"  class="music_name" onClick="goView('${m.SEQ_TBL_MUSIC}');">${m.MUSIC_NAME}&nbsp;<span style="font-style: italic; color:red;">[${m.MUSIC_COMMENTCOUNT}]</span></span></td>
			</c:if>
			<c:if test="${m.MUSIC_COMMENTCOUNT == 0}">
			<td align="center" style="width: 360px;"><span style="cursor: pointer;"  class="music_name" onClick="goView('${m.SEQ_TBL_MUSIC}');">${m.MUSIC_NAME}</span></td>
			</c:if>
			<td align="center" style="width: 70px;">${m.MUSIC_DATE}</td>
			<td align="center" style="width: 70px;">&nbsp;&nbsp;<input type="checkbox" class="delChkbox" name="delChkbox" value="${m.SEQ_TBL_MUSIC}"    /></td>
			</tr>
     </c:forEach>
    </form>	
    
    
	</tbody>
</table> 
	<br/>

	<form name="seqFrm">
		<input type="hidden" name="seq_tbl_music" />
		<input type="hidden" name="gobackURL" />
	</form>
	<br/>

	<!-- ===  페이지바 보여주기 -->
	<div align="center" style="width:70%; margin-left: 50px;" >
		${pagebar} 
	</div>
	<br/>
	
	
	
			
			
	   
			
		
	</form>

</div>







