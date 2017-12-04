package com.spring.hgl.controller;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Alarm {
	
	// Pointcut 을 생성한다
	@Pointcut("execution(public * com.spring.*.*Controller.alarm_*(..))")
	public void alarm(){
		
	}// end of alarm
	
	@After("alarm()")
	public void after(){
		
		
		
	}// end of alarm
	
	
	
}// end of Alarm
