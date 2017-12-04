package com.spring.jdh.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.UserVO;
import com.spring.jdh.service.InterSnsService;

@Controller
public class JdhController {
	
	// ==== #33. 의존객체 주입하기(DI : Dependency Injection)====
		@Autowired
		private InterSnsService service;
	
	// ==== #40. 메인 페이지 요청. =====
		@RequestMapping(value="/loginmain.re", method={RequestMethod.GET})
		public String index(HttpServletRequest req) {
			
			
			
			return "jdh/mainlogin.tiles";
			
			// /WEB-INF/views/main/index.jsp ---> 메인 페이지
			
		}// end of public String index()-----------------
		
		// ==== #44. 로그인 폼 페이지 요청. =====
		
		@RequestMapping(value="/login.re", method={RequestMethod.GET})
		
		public String login() {
			
			return "jdh/loginform.tiles";
			// WEB-INF/views/login/loginform.jsp파일을 생성한다.
		}// end of String login()-----------------------
		
		
		
		// ==== #45. 로그인 완료 요청. =====
		@RequestMapping(value="/loginEnd.re", method={RequestMethod.POST})	
		public String loginEnd(HttpServletRequest req, HttpSession session, UserVO uservo, LoginVO loginUser) {
			
			String id = req.getParameter("id"); // 뷰단에서 가져온값
			String pwd = req.getParameter("pwd");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);
			
			/*
				로그인을 하려면 아이디와 암호가 일치할때만 로그인이 되어지도록 한다.
				먼저 서비스단에서 로그인 여부결과를 인트타입(1 또는 0 또는 -1)으로 받아오겠다.
			*/
			
			int n = service.loginEnd(map);		// 메소드 생성
			/*
				1은 아이디와 암호가 일치하는 경우
				0은  비밀번호가 틀린 경우
				-1은 아이디와 존재하지 않는 경우
			*/
			
			// 로그인 결과(1 OR 0 OR -1)를 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
			req.setAttribute("n", n);
			
			if(n == 1){
				uservo = service.getloginMember(id);
				loginUser = service.getloginSession(id);
				req.setAttribute("uservo", uservo);
				session.setAttribute("loginUser", loginUser);
				
				// 세션에 저장된 돌아갈 페이지(url)정보를 불러온다.
				String gobackURL = (String)session.getAttribute("gobackURL");
				req.setAttribute("gobackURL", gobackURL);
				
				//session.removeAttribute("gobackURL");
			}
			
			return "jdh/loginEnd.tiles";
			// /WEB-INF/views/login/loginEnd.jsp 파일을 생성한다.
			
		}// end of String loginEnd()-------------------
			
		
	// ==== #53. 로그아웃 완료 요청. =====
		@RequestMapping(value="/logout.re", method={RequestMethod.GET})
		public String logout(HttpSession session) {
			
			session.invalidate();	// 몽땅 지움
			// session.removeAttribute("loginuser");	// 특정한것만 지움
			
			return "jdh/logout.tiles";
			// WEB-INF/views/login/logout.jsp 파일을 생성한다.
			
		}// end of String logout()
	
}
