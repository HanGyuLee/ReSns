package com.spring.hgl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.spring.common.MyUtil;

/*
	=== 주업무 ( 글쓰기, 글수정, 댓글쓰기 ,주문하기, 나의 주문내역 등등 )를 실행하기 앞서서
		이러한 주 업무들은 먼저 로그인을 해야만 사용가능한 작업이므로 주업무에 대한 보조업무 객체로
		로그인여부를 체크하는 관심클래스(객체)를 생성하여 포인트컷과 어드바이스를 생성하여
		동작하도록 만들것이다.
	
*/

// === #55. 공통관심사 클래스(Aspect 클래스) 생성하기

@Aspect
@Component
public class LoginCheck {

	// Pointcut 을 생성한다
	@Pointcut("execution(public * com.spring.*.*.*Controller.requireLogin2_*(..))")
	public void requireLogin(){
		
	}// end of requireLogiin
	
	// Pointcut 을 생성한다
		@Pointcut("execution(public * com.spring.*.*.*Controller.requireLoginPEK_*(..))")
		public void requireLogin2(){
			
		}// end of requireLogiin
	

	// 보조업무 (어드바이스) 생성한다.
	@Before("requireLogin()")
	public void before(JoinPoint joinPoint){
		// 로그인 유무를 확인하기위해 request를 통해서 session을 얻어온다.
		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
		HttpSession session = request.getSession();
		
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		
		if(session.getAttribute("loginUser") == null){
			// 로그인 안 한 상태
			
			String msg = "먼저 로그인 하세요~ ";
			String loc ="/resns/login.re";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			// >>> 로그인 성공 후 로그인 하기 전에 머물던 페이지로 돌아가는 작업하기 <<<
			// ===> 현재 페이지의 주소(URL) 알아내기 
			String url = MyUtil.getCurrentURL(request);
			session.setAttribute("gobackURL", url); // 세션에 돌아갈페이지의 주소를 저장시킴
	
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	} // end of before
	
	
	// 보조업무 (어드바이스) 생성한다.
		@Before("requireLogin2()")
		public void before2(JoinPoint joinPoint){
			// 로그인 유무를 확인하기위해 request를 통해서 session을 얻어온다.
			HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
			HttpSession session = request.getSession();
			
			HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
			
			if(session.getAttribute("loginUser") == null){
				// 로그인 안 한 상태
				String msg = "먼저 로그인 하세요~";
				String loc ="/resns/login.re";
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				// >>> 로그인 성공 후 로그인 하기 전에 머물던 페이지로 돌아가는 작업하기 <<<
				// ===> 현재 페이지의 주소(URL) 알아내기 
				
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
				try {
					dispatcher.forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		} // end of before
	
	

	
}// end of LoginCheck





