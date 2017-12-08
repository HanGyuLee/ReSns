package com.spring.jdh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import com.spring.common.MyUtil;

public class ReLoginCheck {
	
	// Pointcut을 생성한다.
		@Pointcut("execution(public * com.spring.*.*.*Controller.requireLogin_*(..))")
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
				String loc = "/resns/login.re";
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

}
