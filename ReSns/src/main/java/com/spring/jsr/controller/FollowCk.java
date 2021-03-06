package com.spring.jsr.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.hgl.model.InterHglDAO;
import com.spring.hgl.service.InterHglService;
import com.spring.jdh.model.LoginVO;
import com.spring.jsr.service.InterJsrService;

@Aspect
@Component
public class FollowCk {
	//의존객체 주입(DI:Dependency injection)
	@Autowired
	private InterJsrService service;
	private InterHglDAO hgdao;
	
	//Pointcut 을 생성한다.
	@Pointcut("execution(public * com.spring.*.*.*Controller.BlockCk_*(..))")
	public void blockck(){
		
	}
	
	
	
	//보조업무(어드바이스) 생성한다.
	@Before("blockck()")
	public void before(JoinPoint joinPoint){
		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
		
		HttpSession session = request.getSession();
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		
		if(session.getAttribute("loginUser") != null){
			Object obj = session.getAttribute("loginUser");
			
			String login_id = "";	
			String fk_login_id ="";
			if (obj != null) {
				LoginVO loginUser = (LoginVO)obj;
			
			if(loginUser != null){
				login_id = loginUser.getLogin_id();//로그인한 회원 아이디를 가지고 온다.
			}

			}
			
			String queryString = request.getQueryString();
			//System.out.println("queryString::"+queryString);
			//fk_login_id=noname
			
			if(queryString !=null){
			
				fk_login_id= queryString.substring(12);
			//noname
			}
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("login_id",login_id );
			map.put("fk_login_id",fk_login_id);
			
			System.out.println("fk_login_id확인::"+fk_login_id);
			request.setAttribute("fk_login_id", fk_login_id);
			request.setAttribute("login_id",login_id);
			
			int ck = service.followblock(map);//차단 테이블에 있는지 확인
			
			System.out.println("차단테이블에 있는지 확인2::"+ck);
			if(ck ==1 || ck>0){
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/jsr/blockpage.jsp");	
				String userid  = fk_login_id;
				System.out.println("userid확인::"+userid);
				if (userid != null){
				String username = hgdao.getUsername(userid);
				//String username = service.getUsername(userid);
				
			System.out.println("username::"+username);
				}
				
				else if (userid == null){
					
				System.out.println("널널");	
				}
			/*
				
				HashMap<String,String> profile = service.getMyProfile(userid);			
				HashMap<String,String> mypage =  null;
				

				HashMap<String,String> insertMypage =  new HashMap<String,String>();
				
				System.out.println();
				
				
				String textinput =username+ "'s Page";
				String textarea = username+ "의 페이지 입니다";
						
				
				insertMypage.put("textinput",textinput);
				insertMypage.put("textarea",textarea);
				insertMypage.put("userid",userid);
				
				
				mypage=	service.getMypage(userid);
				
				if(mypage == null){		
					service.insertMyPage(insertMypage);			
					insertMypage = service.getMypage(userid);
					mypage = insertMypage;
					
				}
			
				request.setAttribute("mypage", mypage);	
				request.setAttribute("userid", userid);
				request.setAttribute("profile", profile);
				
				*/
				
				

							
				request.setAttribute("ck", ck);
				System.out.println("ck2"+ck);
	
			try {	//response.sendRedirect("fk_login_id");
			
					dispatcher.forward(request, response);
					
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			

			}//차단 되었다면

		}//로그인 유저가 null이 아니라
	
	}//end of public void before(JoinPoint joinPoint)

	

}//end of class FollowCk
