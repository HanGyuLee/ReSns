package com.spring.jsr.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.jsr.service.InterJsrService;


@Controller
@Component  //주 업무 클래스 선언
public class JsrController {
	
	//의존객체 주입(DI:Dependency injection)
	@Autowired
	private InterJsrService service;
	
	//팔로우 리스트 페이지 요청
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String followListView(){	
		
		return "jsr/followList.tiles";
	}
	
	
	
/*	
	//백문백답 게시판 질문 작성하는 폼 페이지 요청
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String questionAdd(){
		
		
		return "";
	}//end of public String questionAdd()
	
	
	
	//백문백답 게시판 질문 작성 완료 요청
	@RequestMapping(value="/.re", method={RequestMethod.POST})
	public String questionAddEnd(){
		
		
		return "";
	}//end of public String questionAddEnd()
	
	
	
	//백문백답 게시판 목록 요청
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String questionList(){
		
		
		return "";
	}//end of public String questionList()
	
	
	
	//백문백답 게시판 글 1개 보기
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String questionView(){
		
		
		return "";
	}//end of public String questionView()
	
	
	
	//백문백답 답변 댓글 작성하기 요청
	@RequestMapping(value="/.re", method={RequestMethod.POST})
	public String replyAdd(){
		
		
		return "";
	}//end of public String replyAdd()
	
	
	
	//백문백답 질문 삭제 요청
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String questionDel(){
		
		
		return "";
	}//end of public String questionDel()
	
	
	
	//백문백답 답변 삭제 요청
	@RequestMapping(value="/.re", method={RequestMethod.GET})
	public String replyDel(){
		
		
		return "";
	}//end of public String replyDel()
	

	
	//백문백답 질문 삭제 요청
	@RequestMapping(value="/.re", method={RequestMethod.POST})
	public String questionDelEnd(){
		
		
		return "";
	}//end of public String questionDel()
	
	
	
	//백문백답 답변 삭제 요청
	@RequestMapping(value="/.re", method={RequestMethod.POST})
	public String replyDelEnd(){
		
		
		return "";
	}//end of public String replyDel()
	
	*/
	
	
}
