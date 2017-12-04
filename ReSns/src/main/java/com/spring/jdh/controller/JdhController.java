package com.spring.jdh.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.common.FileManager;
import com.spring.common.MyUtil;
import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.MemberImageVO;
import com.spring.jdh.model.UserVO;
import com.spring.jdh.service.InterSnsService;


@Controller
public class JdhController {
	
	// ==== 의존객체 주입하기(DI : Dependency Injection)====
		@Autowired
		private InterSnsService service;
		
	// 파일업로드 및 다운로드를 해주는 FileManager 클래스를 의존객체 주입하기(DI : Dependency Injection) ====
		@Autowired
		private FileManager fileManager;
	
	// ==== 메인 페이지 요청. =====
		@RequestMapping(value="/loginmain.re", method={RequestMethod.GET})
		public String index(HttpServletRequest req) {
			
			
			
			return "jdh/mainlogin.tiles";
			
			// /WEB-INF/views/main/index.jsp ---> 메인 페이지
			
		}// end of public String index()-----------------
		
		// ==== 로그인 폼 페이지 요청. =====
		
		@RequestMapping(value="/login.re", method={RequestMethod.GET})
		
		public String login() {
			
			return "jdh/loginform.tiles";
			// WEB-INF/views/login/loginform.jsp파일을 생성한다.
		}// end of String login()-----------------------
		
		
		
		// ==== 로그인 완료 요청. =====
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
			
		
	// ====  로그아웃 완료 요청. =====
		@RequestMapping(value="/logout.re", method={RequestMethod.GET})
		public String logout(HttpSession session) {
			
			session.invalidate();	// 몽땅 지움
			// session.removeAttribute("loginuser");	// 특정한것만 지움
			
			return "jdh/logout.tiles";
			// WEB-INF/views/login/logout.jsp 파일을 생성한다.
			
		}// end of String logout()
		
		
	//  ★★★★★ 공통관심사 클래스(Aspect 클래스) 생성하기 ★★★★★
		@Aspect
		@Component
		public class LoginCheck {

			// Pointcut을 생성한다.
			@Pointcut("execution(public * com.spring.*.*Controller.requireLogin_*(..))")
			public void requireLogin() {
				
			}
			
			
			// 보조업무(어드바이스) 생성한다.
			@Before("requireLogin()")
			public void before(JoinPoint joinpoint) {	// JoinPoint 주업무 메소드
				
				// 로그인 유무를 확인하기 위해서는 request 를 통해 session 을 얻어온다.
				HttpServletRequest request = (HttpServletRequest)joinpoint.getArgs()[0]; // [0]은 request순서
				HttpSession session = request.getSession();
				
				HttpServletResponse response = (HttpServletResponse)joinpoint.getArgs()[1]; // [1]은 reponse순서
				
				
				if(session.getAttribute("loginuser") == null){	// 이 값이 없다면
					// 로그인을 하지 않은 상태이라면
					
					String msg = "먼저 로그인 하세요~~";
					String loc = "/login.re";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
					
					// >> 로그인 성공 후 로그인 하기전 페이지로 돌아가는 작업을 해주어야 한다. << 
					// ===> 현재 페이지 주소 알아내기  <===
					String url = MyUtil.getCurrentURL(request);	// 현재 페이지를 알려준다.
					
					session.setAttribute("gobackURL", url); // 세션에 돌아갈 페이지(url)정보를 저장시켜둔다.
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
					
					try {
						dispatcher.forward(request, response);
					} catch (ServletException e) {
						
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
				
			}// end of void before(JoinPoint joinpoint)
		
			
		//////
			
			
		// 회원가입 
		@RequestMapping(value="/reRegister.re", method={RequestMethod.GET})
		public String register() {
			
			return "jdh/reregister.tiles";
		}
		
		// 회원가입 메소드
		@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
		@RequestMapping(value="/reRegisterEnd.re", method={RequestMethod.POST})
		public String reRegisterEnd(HttpServletRequest req, LoginVO lvo, UserVO uvo, MemberImageVO ivo) {
			
			// 1. 폼에서 넘어온 값을 받기
			String login_id = req.getParameter("login_id");			// 아이디 
			String login_pwd = req.getParameter("login_pwd");		// 비밀번호
			String login_name = req.getParameter("login_name");		// 닉네임
			
			String user_gender = req.getParameter("user_gender");	// 성별		
			String user_email = req.getParameter("user_email");		// 이메일			
			String user_birth = req.getParameter("user_birth");		// 생년월일
			String user_selfi = req.getParameter("user_selfi");		// 자기소개
			
			String uimg_filename = req.getParameter("uimg_filename");	// 이미지 파일
			String profile = req.getParameter("profile");	// 프로필 파일	// null일때 if 문에서 써줌
			// 이미지
			
			System.out.println("확인용profile : " + profile);
			
			/*// 2. HashMap에 넣어준다.
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("login_id", login_id);
			map.put("login_pwd", login_pwd);
			map.put("login_name", login_name);
			
			HashMap<String, String> map2 = new HashMap<String, String>();
			
			map2.put("login_id", login_id);
			map2.put("login_pwd", login_pwd);
			map2.put("login_name", login_name);
			map2.put("user_gender", user_gender);
			map2.put("user_email", user_email);
			map2.put("user_birth", user_birth);
			
			
			HashMap<String, String> map3 = new HashMap<String, String>();
			
			map3.put("login_id", login_id);
			map3.put("login_pwd", login_pwd);
			map3.put("login_name", login_name);
			map3.put("user_gender", user_gender);
			map3.put("user_email", user_email);
			map3.put("user_birth", user_birth);
			map3.put("uimg_filename", uimg_filename);*/
			
			lvo.getLogin_id();
			lvo.getLogin_pwd();
			lvo.getLogin_name();
			
			uvo.getUser_gender();
			uvo.getUser_email();
			uvo.getUser_birth();
			uvo.getUser_selfi();
			
			ivo.getUimg_profile_filename();
			
			
			
			
			if (profile == null) {
				
			} else{
				
			}
			
			
			
			// 3. Service 단으로 생성된 HashMap을 넘긴다.
			/*int n = service.login1(map);
			
			String msg = "";
			
			if (n > 0) {
				msg = "생년월일이 있는 회원 가입 성공!!";
			}
			else {
				msg = "생년월일이 있는 회원 가입 실패!!";
			}
			
			req.setAttribute("msg", msg);
			
			return "mybatisTest5AddEnd";
			*/
			
			return "";
		}
		}
}
