<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.min.css">
<script src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>


<style type="text/css">

body{
	width:100%;
	height:100%;
	font-family: 'Roboto Condensed', sans-serif;
	
}


h1,h2,h3 {
	margin:0 0 35px 0;
	font-family: 'Patua One', cursive;
	text-transform: uppercase;
	letter-spacing:1px;
}

p{
	margin:0 0 25px;
	font-size:18px;
	line-height:1.6em;
}
a{
	color:#26a5d3;
}
a:hover,a:focus{
	text-decoration:none;
	color:#26a5d3;
}

#contact{
	background:#333333;
	color:#f4f4f4;
	padding-bottom:80px;
}

textarea.form-control{
    height:100px;
}

</style>
   
   
   <script type="text/javascript">
   
   function goBack() {
		location.href="/resns/noticeMemMain.re";
	}	

	document.title = "관리자 공지사항 상세";
   
   </script>
   
    <div class="container">
     <form class="well span8" id="noticeDetail" name="noticeDetail">
     
     	<input type="hidden" id="seq" name="seq" value="${vo.seq_tbl_notice}">  
     	
        <div class="row">
            <div class="span3">
                <th>제목<input class="span3" type="text" value="${vo.notice_title}" readonly style="width: 50%;"></th>&nbsp;
                <th>게시날짜<input class="span3" type="text" value="${vo.notice_date}" readonly></th>&nbsp;
                <th>분류
                <select>
                	<option value="0">기타</option>
	                <option value="1">업데이트</option>
    	            <option value="2">긴급</option>
                </select></th>&nbsp;
                
            </div>
   
   			<br/><br/>
            <div class="span5">
                <label>내용</label>
               
                  <textarea class="input-xlarge span5" id="message" name="message"
                              rows="10" readonly style="width: 90%;">${vo.notice_content}
                  </textarea> 
                 
            </div>
           
            <div class="btn_area">
       
        <a onclick="goBack();">확인(뒤로 가기)</a>
       
			</div>
         
         
    </form>
   
   
</div>