<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">


	$(document).ready(function(){
		
	});
	
	function goNoticeDetail(num) {
		var frm = document.getElementById("seqFrm");
		// alert(num);
		document.getElementById("seqInput").value = num;
		frm.action = "<%=request.getContextPath()%>/noticeDetail.re";
		frm.method = "GET";
		frm.submit();		
	}
	
	function goreginotice() {
		location.href = "<%= request.getContextPath() %>/noticeregister.re";
	}
	
	function goBackPage() {
		location.href = "<%= request.getContextPath() %>/noticeAdmMain.re";
	}
	
	
	function noticeDelete() {
		
		var frm = document.getElementById("seqFrm");
		
		frm.action = "<%= request.getContextPath() %>/noticeDelete.re";
		frm.method = "POST";
		frm.submit();
		
	}
	
	function input(seq) {
		document.getElementById("seqInput").value = seq;
	}
	
	
	document.title = "관리자 공지사항 메인";
	
</script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h4><span style="font-size: x-large; font-style: oblique; font-weight: bold; color: fuchsia;;">관리자용 공지사항 페이지</span></h4>
			
			<div align="right" style="margin-right: 25pt;">
			<button type="button" onclick="goreginotice()" style="background-color: highlight; font-style: inherit; font-weight: bold;">공지사항 등록하기</button>
			</div>
			
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred table-striped">
					<thead>
						<tr>
							<th></th>
							<th>카테고리</th>
							<th>날짜</th>
							<th>제목</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					
					<tbody>					
						<c:if test="${not empty noticeList}">
						<c:forEach var="vo" items="${noticeList}" varStatus="status">
						<tr>
							<td>${vo.seq_tbl_notice}</td>
							<td>
								<c:choose>
									<c:when test="${vo.notice_cate eq 0}">
										<span style="color: teal; font-weight: bold; font-style: italic;">기타</span>
									</c:when>
									<c:when test="${vo.notice_cate eq 1}">
										<span style="color: orange; font-weight: bold; font-style: italic;">업데이트</span>
									</c:when>
									<c:when test="${vo.notice_cate eq 2}">
										<span style="color: red; font-weight: bold; font-style: italic;">긴급</span>
									</c:when>
									
								</c:choose>
							</td>
							<td>${vo.notice_date}</td>
							<td onClick="goNoticeDetail('${vo.seq_tbl_notice}');">
								<%-- <c:if test="${vo.ask_depthno eq 0}"> --%>
									<span style="cursor: pointer;" >${vo.notice_title}</span>
								<%-- </c:if> --%>
							</td>							
							<%-- <td>${vo.notice_status}</td> --%>
							
							
							
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
								<button class="btn btn-danger btn-xs" data-title="Delete"
									data-toggle="modal" data-target="#delete" class="btns" onclick="input('${vo.seq_tbl_notice}')" >
									<span class="glyphicon glyphicon-trash"></span>
								</button>
								
							</p></td>
							
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<form id="seqFrm">
					<input type="hidden" name="seq" id="seqInput">
				</form>
			</div>
		</div>
	</div>
</div>

    <!-- ==== #115. 페이지바 보여주기 ==== -->
	<div align="center"	style="width: 70%; margin-left: 50px;">
		${pageBar}
	</div>
    
    <!-- 삭제모달 -->
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
    
    
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">삭제</h4>
       	  </div>
       	  
       	  
          	<div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> 삭제하시면 복구할 수 없습니다. 그래도 삭제하시겠습니까?</div>
       
      		</div>
      		
      	<form name="noticeDel" id="noticeDel">	
        <div class="modal-footer ">
        	<button type="button" class="btn btn-success" name="delyes" onclick="noticeDelete();"><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goBackPage();"><span class="glyphicon glyphicon-remove"></span> 아니오</button>
      	</div>
      	</form>
      	
      	<%-- <form id="seq" name="seq">
      		<input type="hidden" id="seq" name="seq" value="${vo.seq_tbl_notice}">
      	</form> --%>
      	
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    