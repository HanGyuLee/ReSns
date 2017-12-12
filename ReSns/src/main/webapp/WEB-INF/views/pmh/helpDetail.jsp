<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 상세</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">

<style>
	div.main { margin-left: 50px;
	}
	div.content { margin-left: 50px;
	}
	div.btn_area { display: inline-block;
	}
</style>
</head>
<body>


<!-- 디자인 참고용  -->
<div class="main">
         <div class="content">
                    <div class="sub_title_info">
                        <h3>문의게시판</h3>
                    </div>
                    <!-- sub content s -->
                    <div class="sub_content">
                  <!-- 게시판 검색폼 -->
                        <br>
<!-- board s -->
<div class="tbl_ask">
    <table summary="제목, 작성자, 작성일, 내용 정보 제공">
        
        <colgroup>
            <col width="74" />
            <col width="200" />
            <col width="72" />
            <col width="200" />
        </colgroup>
        <thead>
            <tr>
                <td colspan="4" class="title freeboard">
                    <p>
                       [${avo.ask_cate}] ${avo.ask_title}
                    </p>
                </td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td class="tl">
                    ${login_name} (${avo.fk_login_id})</td>
                <th scope="row">작성일</th>
                <td>
                    ${avo.ask_date1}</td>
                </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="4">
                    <div>
   ${avo.ask_content}
   <br>
   
   <c:if test="${aivo ne null}">
<img src="<%= request.getContextPath() %>/resources/files/${aivo.aimg_filename}" width="300px">
</c:if>
                    </div>
                </td>
            </tr>
        </tbody>
        
    </table>
</div>

<br>
<div class="btn_area">
        <a onclick="goBack();">목록</a>
        <a style="margin-left: 350px" onclick="goModi();">수정</a>
        <a style="margin-left: 20px" onclick="goDel();">삭제</a>
        
</div>

</div>

</div>

</div>         
            <!--//container -->

<!-- 디자인 참고용 -->

<form id="seqFrm">
	<input type="hidden" id="seq" name="seq" value="${avo.seq_tbl_ask}">
	<input type="hidden" id="loginid" name="loginid" value="${avo.fk_login_id}">
</form>

<script type="text/javascript">
	
	function goModi() {
		var frm = document.getElementById("seqFrm");
		frm.method = "post";
		frm.action = "helpModify.re";
		frm.submit();
	}
	
	function goDel() {
		var bool = confirm("정말 삭제하시겠습니까?");
		
		if (bool) {
			var frm = document.getElementById("seqFrm");
			frm.method = "post";
			frm.action = "helpDelete.re";
			frm.submit();
		}
		else {
			return;
		}
	}
	
	function goBack() {
		location.href="/resns/help.re";
	}	

	document.title = "문의게시판 상세";
</script>
</body>
</html>