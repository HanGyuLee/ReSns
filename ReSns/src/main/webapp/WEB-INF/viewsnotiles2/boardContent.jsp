<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function goDel(seq) {
		var con = confirm("정말 이 게시물을 비활성화 하시겠습니까?");
		if (con == true) {
			var frm = document.getElementById("seqFrm");
			frm.action = "/resns/delBoardContents.re";
			frm.method = "post";
			frm.submit();
		}
		else {
			return;
		}
		
	}// end of function goDel(seq)--------------
	
	function goAct(seq) {
		var con = confirm("선택한 게시물을 활성화 하시겠습니까?");
		if (con == true) {
			var frm = document.getElementById("seqFrm");
			frm.action = "/resns/actBoardContents.re";
			frm.method = "post";
			frm.submit();
		}
		else {
			return;
		}
		
	}
</script>

<div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">게시물 상세</h4>
      </div>
      <!-- body -->
      <div class="modal-body" id="modalbody">
      	
      	<div id="imageandcontentboby">
      	 <div><img src="<%=request.getContextPath()%>/resources/images/${bivo.bimg_filename}" width="300px" height="250px">
      	 </div>
      	 <div>
      	 	신고글번호: ${bvo.seq_tbl_board}<br>
      	 	글쓴이: ${bvo.fk_login_id}<br>
      	 	본문내용: ${bvo.board_content}<br>
      	 	작성날짜: ${bvo.board_time}<br>
      	 </div>  
      	</div>
			<br>
		<div id="replybody">
			리플내용<br> 
		   <c:forEach var="re" items="${rvoList}">
		   
		   		<c:if test="${re.re_depthno == 0}">
		   		    작성자: ${re.re_id}&nbsp;&nbsp;리플내용: ${re.re_content}&nbsp;&nbsp;작성날짜: ${re.re_date}<br>
		   		</c:if>
		   		<c:if test="${re.re_depthno > 0}">
		   			<span style="padding-left: ${re.re_depthno*10}px; color: blue;">└Re 작성자: ${re.re_id}&nbsp;&nbsp;리플내용: ${re.re_content}&nbsp;&nbsp;작성날짜: ${re.re_date}</span><br>
		   		</c:if>
		         
		   </c:forEach>
		</div>            
         
      </div>
      <!-- Footer -->
      <div class="modal-footer">
      <div style="display: inline;">
	      <c:if test="${bvo.board_status eq 0 || bvo.board_status eq 1}">
	      	  <button type="button" class="btn btn-danger" style="float: left;" onclick="goDel('${bvo.seq_tbl_board}');">비활성화</button>
	      </c:if>
	      <c:if test="${bvo.board_status eq 2 || bvo.board_status eq 3}">
	      	  <button type="button" class="btn btn-success" style="float: left;" onclick="goAct('${bvo.seq_tbl_board}');">활성화</button>
	      </c:if>
      	  <button type="button" class="btn btn-default" data-dismiss="modal" style="float: right;">닫기</button>
      </div>
      
  </div>
</div>

<form id="seqFrm">
	<input type="hidden" id="seq" name="seq" value="${bvo.seq_tbl_board}">
</form>