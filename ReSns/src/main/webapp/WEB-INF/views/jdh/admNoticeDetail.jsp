<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <div class="container">
	<form class="well span8">
        <div class="row">
            <div class="span3">
                <label>제목</label> <input class="span3" type="text">
                <label>날짜</label> <input class="span3" type="text"> 
                <label>공지사항 분류</label>
                <select class="span3" id="subject" name="subject">
                    <option selected value="na">
                     	분류:
                    </option>
    
                    <option value="service">
                        업데이트 공지사항
                    </option>
    
                    <option value="suggestions">
                        긴급 공지사항
                    </option>
    
                    <option value="product">
                        기타 공지사항
                    </option>
                </select>
            </div>
    
            <div class="span5">
                <label>내용</label> 
                	<textarea class="input-xlarge span5" id="message" name="message"
                			  rows="10">
    				</textarea>
            </div>
            
            <div><button class="btn btn-primary pull-right" type=
            "submit">수정</button>
        	</div>
        	
        	</div><div><button class="btn btn-primary pull-right" type=
            "submit">확인</button>
        	</div>
        	
    </form>
</div>