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
		frm.action = "<%=request.getContextPath()%>/MemnoticeDetail.re";
		frm.method = "GET";
		frm.submit();		
	}
	
	function input(seq) {
		document.getElementById("seqInput").value = seq;
	}
	
	
	document.title = "회원용 공지사항 메인";
	
</script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h4>공지사항 페이지 테이블</h4>
			
			<!-- <div align="right" style="margin-right: 25pt;">
			<button type="button" onclick="goreginotice()">공지사항 등록하기</button>
			</div> -->
			
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred table-striped">
					<thead>
						<tr>
							<th>seq</th>
							<th>카테고리</th>
							<th>날짜</th>
							<th>제목</th>
							<!-- <th>삭제하기</th> -->
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
										기타
									</c:when>
									<c:when test="${vo.notice_cate eq 1}">
										업데이트
									</c:when>
									<c:when test="${vo.notice_cate eq 2}">
										긴급
									</c:when>
									<c:when test="${vo.notice_cate eq 3}">
										에러(고쳐)
									</c:when>
								</c:choose>
							</td>
							<td>${vo.notice_date}</td>
							<td onClick="goNoticeDetail('${vo.seq_tbl_notice}');">
								
									<span style="cursor: pointer;" >${vo.notice_title}</span>
								
							</td>							
							<%-- <td>${vo.notice_status}</td> --%>
							
							
							
							<%-- <td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
								<button class="btn btn-danger btn-xs" data-title="Delete"
									data-toggle="modal" data-target="#delete" class="btns" onclick="input('${vo.seq_tbl_notice}')" >
									<span class="glyphicon glyphicon-trash"></span>
								</button>
								
							</p></td> --%>
							
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

    <!-- ====  페이지바 보여주기 ==== -->
	<div align="center"	style="width: 70%; margin-left: 50px;">
		${pageBar}
	</div>
    
    
    <!-- <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
    
    
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">삭제</h4>
       	  </div> -->
       	  
       	  
          	<!-- <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> 삭제하시면 복구할 수 없습니다. 그래도 삭제하시겠습니까?</div>
       
      		</div> -->
      		
      	<!-- form name="noticeDel" id="noticeDel">	
        <div class="modal-footer ">
        	<button type="button" class="btn btn-success" name="delyes" onclick="noticeDelete();"><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goreginotice();"><span class="glyphicon glyphicon-remove"></span> 아니오</button>
      	</div>
      	</form> -->
      	
      		 <form id="seq" name="seq">
      		<input type="hidden" id="seq" name="seq" value="${vo.seq_tbl_notice}">
      		 </form>
      	
        </div>
    <!-- /.modal-content --> 
  		</div>
      <!-- /.modal-dialog --> 
    </div>