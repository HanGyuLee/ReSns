package com.spring.hgl.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.hgl.service.InterHglService;
import com.spring.jdh.model.LoginVO;

@Controller
@Component

public class HglController {
	@Autowired
	private InterHglService service;
	
	@RequestMapping(value="/mypage.re", method={RequestMethod.GET})
	public String mypage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
			
		String userid = null;
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		
		userid = loginUser.getLogin_id();			
		
		List<HashMap<String, Object>> list = service.getMyBoardList(userid);
		
		HashMap<String,String> profile = service.getMyProfile(userid);

		
		req.setAttribute("profile", profile);
		req.setAttribute("list", list);
	
		return  "hgl/mypage.tiles2";
		
		
	}// end of login
	
	
	
	
}// end of HglController
