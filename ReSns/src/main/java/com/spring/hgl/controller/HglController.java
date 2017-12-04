package com.spring.hgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.hgl.service.InterHglService;

@Controller
@Component

public class HglController {
	@Autowired
	private InterHglService service;
	
	@RequestMapping(value="/mypage.re", method={RequestMethod.GET})
	public String mypage(){		
		
		return "hgl/mypage.tiles2";
		
	}// end of login
	
	
	@RequestMapping(value="/mypage2.re", method={RequestMethod.GET})
	public String mypage2(){
		
		
		return "hgl/mypage2.tiles2";
		
	}// end of login
	
}// end of HglController
