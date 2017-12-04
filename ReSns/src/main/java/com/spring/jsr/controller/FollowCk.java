package com.spring.jsr.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class FollowCk {
	
	
	
	//Pointcut 을 생성한다.
	@Pointcut("execution(public * com.spring.*.*Controller.f_*(..))")
	public void followckd(){
		
	}
	
	
	
	//보조업무(어드바이스) 생성한다.
	@Before("followckd()")
	public void before(JoinPoint joinPoint){
	
	
	}
	
	
	
	

}
