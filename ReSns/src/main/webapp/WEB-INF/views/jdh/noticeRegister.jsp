<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <style type="text/css">
   
		   #contact{
		    background-color:#f1f1f1;
		    font-family: 'Roboto', sans-serif;
		}
		
		#contact .well{
		    margin-top:30px;
		    border-radius:0;
		}
		
		#contact .form-control{
		    border-radius: 0;
		    border:2px solid #1e1e1e;
		}
		
		#contact button{
		    border-radius:0;
		    border:2px solid #1e1e1e;
		}
		
		#contact .row{
		    margin-bottom:30px;
		}
		
		@media (max-width: 768px) { 
		    #contact iframe {
		        margin-bottom: 15px;
		    }
		    
		}
   
   </style>
    
    
<script type="text/javascript">
    
    $(document).ready(function(){
    	
    	
    });
    
	function goreginotice(){
    	
	    var frm = document.getElementById("noticeRegisFrm");
	    
	    frm.action = "noticeregisterEnd.re";
	    frm.method = "post";
	    frm.submit();
    
    }
    
	function goBack() {
		location.href="/resns/noticeAdmMain.re";
	}
    
</script>
    
    
    <div class="col-md-5">
          <h4 style="font-style: oblique; font-weight: bold; font-size: 20px; color: fuchsia;"><strong>공지사항 등록하기</strong></h4><br/>
        <form name="noticeRegisFrm" id="noticeRegisFrm">
          <div class="form-group">
            <h4 style="font-style: oblique; font-weight: bold; font-size: 16px; color: fuchsia;">제목<input type="text" class="form-control" name="notice_title" ></h4>
          </div>
     
          
          <br/><br/>
  <fieldset>
    <p style="font-style: oblique; font-weight: bold; font-size: 16px; color: fuchsia;">분류를 선택하세요 </p>
    <input type="radio" name="notice_cate" id="except" value="0" checked="checked">
    <label for="radio-1">기타 공지사항</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="radio" name="notice_cate" id="update" value="1" >
    <label for="radio-2">업데이트 공지사항</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="radio" name="notice_cate" id="urgent" value="2" >
    <label for="radio-3">긴급 공지사항</label>    
  </fieldset><br/><br/>
         
          <div class="form-group">
            <textarea class="form-control" name="notice_content" rows="3" placeholder="내용" style="width: 110%; height: 110%;"></textarea>
          </div>
          
        <div>
          <button class="btn btn-primary btn-outline btn-lg" type="button" name="reginotice" id="reginotice" onclick="goreginotice();">
              <i class="fa fa-paper-plane-o" aria-hidden="true">등록하기</i>
          </button>
          
          <button class="btn btn-primary btn-outline btn-lg" type="button" name="button" onclick="goBack();">
              <i class="fa fa-paper-plane-o" aria-hidden="true">취소</i>             
          </button>
        </div>
          
        </form>
      </div>