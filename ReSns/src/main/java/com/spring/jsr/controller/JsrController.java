package com.spring.jsr.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.jdh.model.LoginVO;
import com.spring.jsr.service.InterJsrService;


@Controller
@Component  //주 업무 클래스 선언
public class JsrController {
	
	//의존객체 주입(DI:Dependency injection)
	@Autowired
	private InterJsrService service;
	
	
	//팔로우,팔로워 리스트 페이지 요청
	@RequestMapping(value="/followList.re", method={RequestMethod.GET})
	public String followListView(HttpServletRequest req, HttpSession session){	

		//HashMap<String,String> map = new HashMap<String,String>();

		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = null;

		
		if(loginUser == null){	
			return "jdh/loginform.tiles";
		}

		else{
			login_id = loginUser.getLogin_id();
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		//String userid = "qqii";// 세션이 없어서 일단 qqii로 시작 하기.

		List<HashMap<String, String>> followList = service.followList(map);
		List<HashMap<String, String>> followerList = service.followerList(map);
		
		req.setAttribute("followList", followList); //팔로우
		req.setAttribute("followerList", followerList);//팔로워
		

		return "jsr/followList.tiles";
	}//end of public String followListView(HttpServletRequest req, HttpSession session)

	
	//팔로우 하기
	@RequestMapping(value="/followAdd.re", method={RequestMethod.POST})
	public String followAdd(HttpServletRequest req, HttpSession session) throws Throwable{	
	
		
	String follow_id = req.getParameter("followId");	
	
	LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
	String login_id = loginUser.getLogin_id();

	//임시로 로그인 체크
	if(login_id ==null){
		return "jdh/loginform.tiles";	
	}
		
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("follow_id", follow_id.trim());
	map.put("login_id", login_id);
	
	
	
	int n = service.followAdd(map);
	
	String msg = "";
	
	if (n <= 0){
	if(n == 0){
	msg = "팔로우 실패!";
	
	}
	
	else if(n == -3){
	msg = "이미 팔로우 함!";
	
	}
	String loc = "javascript:history.back();";
	
	req.setAttribute("msg", msg);
	req.setAttribute("loc", loc);
	return "msg.notiles";	
	}
	
	//리스트 실시간으로 다시 확인 위해 리스트 값 넘겨주기
	else{
		List<HashMap<String, String>> followList = service.followList(map);
		req.setAttribute("followList", followList);
	}
	
	
	return "jsr/followList.tiles";	
	}//end of 
	
	
	//언팔로우 하기
	@RequestMapping(value="/unFollowAdd.re", method={RequestMethod.POST})
	public String unFollowAdd(HttpServletRequest req, HttpSession session) throws Throwable{	
		
		String unFollow_id = req.getParameter("unFollowId");	
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();

		//임시로 로그인 체크
		if(login_id ==null){
			return "index.tiles";	
		}
			
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("follow_id", unFollow_id.trim());
		map.put("login_id", login_id);
		
		int n = service.unFollow(map);
		
		String msg = "";

		if(n == 0){
		msg = "언팔로우 실패!";
		
		}
		
		else if(n == -3){
		msg = "이미 언팔로우 하였거나, 팔로우 상태가 아닙니다.";
		
		}
		

		
		//리스트 실시간으로 다시 확인 위해 리스트 값 넘겨주기
		else{
			
			msg = "언 팔로우 성공!";
			List<HashMap<String, String>> followList = service.followList(map);
			req.setAttribute("followList", followList);
		}
		
		String loc = "javascript:history.back();";
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
	return "msg.notiles";
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
