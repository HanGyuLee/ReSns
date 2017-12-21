<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.trash { color:rgb(209, 91, 71); }
.flag { color:rgb(248, 148, 6); }
.panel-body { padding:0px; }
.panel-footer .pagination { margin: 0; }
.panel .glyphicon,.list-group-item .glyphicon { margin-right:5px; }
.panel-body .radio, .checkbox { display:inline-block;margin:0px; }
.panel-body input[type=checkbox]:checked + label { text-decoration: line-through;color: rgb(128, 144, 160); }
.list-group-item:hover, a.list-group-item:focus {text-decoration: none;background-color: rgb(245, 245, 245);}
.list-group { margin-bottom:0px; }

</style>
    
<script type="text/javascript">

	function memberDelete() {
		
		var frm = document.getElementById("idFrm");
		
		frm.action = "<%= request.getContextPath() %>/memberDelete.re";
		frm.method = "post";
		frm.submit();		
		}
	
	
	function memRestorate() {
		
		var frm = document.getElementById("idFrm");
		
		frm.action = "<%= request.getContextPath() %>/memberRestore.re";
		frm.method = "post";
		frm.submit();
		}
	
	function goEditLoginName() {
		
		var frm = document.getElementById("editLoginName");
		   
		  frm.action = "<%= request.getContextPath() %>/memberEdit.re";
		  frm.method = "POST";
		  frm.submit();
		
	}
	
	function input(id) {
		document.getElementById("idInput").value = id;
		}
	
	function goBack() {
		location.href = "<%= request.getContextPath() %>/memberSupervise.re";
		}

	function goInput(id) {
		document.getElementById("login_id1").value = id;
	}
	
	
	function searchKeep() {
	<c:if test="${ (colname != 'null' && not empty colname) && (search != 'null' && not empty search)}"> // colname과 search가 비어있지 않다라면
		$("#colname").val("${colname}"); // 검색에 대한 컬럼명을 유지시킨다.
		$("#search").val("${search}"); // 검색에 대한 검색어를 유지시킨다.
	</c:if>
	}
	
	
	function goSearch() {
		var frm = document.searchFrm;
		var search = $("#search").val();
		if (search.trim() == ""){
			alert("검색어를 입력하세요!!");
			return;
		}
		else {
			frm.submit();
		}
	}
	
	
</script>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h4>공지사항 페이지 테이블</h4>
			
			
			
			<!-- ==== #102. 글검색 폼 추가하기 : 글제목, 내용, 글쓴이로 검색하도록 한다. ==== -->
	<form name="searchFrm" action="<%= request.getContextPath() %>/memberSupervise.re" method="get">
		<select name="colname" id="colname">
			<option value="subject">회원 아이디</option>
			<option value="content">이메일</option>
			<option value="name">별명</option>
		</select>
		<input type="text" name="search" id="search" size="40pt">
		<button type="button" onClick="goSearch();">검색</button>
	</form>

	<form id="idFrm" method="post">
		<input type="hidden" name="id" id="idInput">
	</form>
	
	
			
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred table-striped">
					<thead>
						<tr>							
							<th>회원 아이디</th>
							<th>이메일</th>
							<th>별명</th>							
							<th>신고당한 횟수</th>
							<th>상태</th>
							<th>회원정보 수정</th>
							<th>삭제</th>
							<th>복원</th>
						</tr>
					</thead>
					
					<tbody>
					
					<c:if test="${not empty memList}">
					
					<c:forEach var="mvo" items="${memList}" varStatus="status">
					
					 <tr>
					
						<td>${mvo.fk_login_id}</td>
						
						<td>${mvo.user_email}</td>
						
						<td>${mvo.login_name}</td>
						
						<td align="center">${mvo.user_report}</td>
						
						<td>${mvo.login_status}</td>
						
	
						
						
						<!-- 수정 -->
						
						<!-- <a href="http://www.jquery2dotnet.com" class="glyphicon glyphicon-pencil"></a> -->
						<td>
						
						<button class="btn btn-danger btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#Edit" class="btns" onclick="goInput('${mvo.fk_login_id}');"> 
							 <span class="glyphicon glyphicon-pencil"></span> 
						</button>
						
						</td>
						
						<!-- 삭제  -->
					<td>
					<!--
					<p data-placement="top" data-toggle="tooltip"
									title="Delete"> -->
						<button class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete" class="btns" onclick="input('${mvo.fk_login_id}')"> 
							 <span class="glyphicon glyphicon-trash"></span> 
						</button>
					<!--</p> -->
					
					</td>
					
						<!-- 복원 -->
					<td><p data-placement="top" data-toggle="tooltip"
									title="Restore">
						<button class="btn btn-danger btn-xs" data-title="Restore"
							data-toggle="modal" data-target="#Restore" class="btns" onclick="input('${mvo.fk_login_id}')" >
							<span class="glyphicon glyphicon-flag"></span>
						</button>
								
					</p></td>
						
						<!-- <td><a href="http://www.jquery2dotnet.com" class="glyphicon glyphicon-flag"></a></td> -->
						
					</tr>
					
					</c:forEach>
					</c:if>
					
					</tbody>
					
				</table>
				
			</div>
		</div>
	</div>
</div>


	
	
	<!-- 수정모달 -->
    
   <!--  <div class="container" > -->
	<!-- <div class="row"> -->
        <div class="modal fade" id="Edit">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                 <h4 class="modal-title">회원 별명수정</h4>
              </div>
              
              
              <div class="col-md-12"> <br> 
                  <h5 class="modal-title">변경하실 별명을 입력하세요.</h5>
              <br>  <form id="editLoginName" name="editLoginName"> <input type="text" name="login_name" />
              								<input type="hidden" name="login_id" id="login_id1">
              		</form>
              </div>
              
              
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onClick="goEditLoginName();">수정</button>
              </div>
              
            </div> <!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
	<!-- </div> -->
	<!-- </div> -->
	
	<!-- <textarea _ngcontent-c9="edit" name="justificativa" pinputtextarea="" required="" ng-reflect-required="" ng-reflect-name="justificativa" ng-reflect-rows="5" class="ui-inputtext ui-corner-all ui-state-default ui-widget ng-dirty ng-touched ng-invalid" rows="5"></textarea> -->

<!-- 삭제 모달-->	
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
    
    
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">삭제</h4>
       	  </div>
       	  
          	<div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> 삭제 하시겠습니까?</div>
       
      		</div>
      		
      	<div class="modal-footer ">
        	<button type="button" class="btn btn-success" name="delyes" onclick="memberDelete();"><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goBack();"><span class="glyphicon glyphicon-remove"></span> 아니오</button>
      	</div>
      	      	
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>

     
	<!-- 복원 모달 -->
  <div class="modal fade" id="Restore" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
    
    
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">복원</h4>
       	  </div>
       	  
       	  
          	<div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-flag"></span> 복구하시겠습니까?</div>
       
      		</div>
      		<div class="modal-footer ">
	        	<button type="button" class="btn btn-success" name="delyes" onclick="memRestorate();"><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goBack();"><span class="glyphicon glyphicon-remove"></span> 아니오</button>
	      	</div> 
      
      	
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    <div align="center"	style="width: 70%; margin-left: 50px;">
		${pagebar}
	</div>
    
    