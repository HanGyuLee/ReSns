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

import com.spring.hgl.model.HglDAO;
import com.spring.hgl.service.InterHglService;
import com.spring.jdh.model.LoginVO;

@Controller
@Component

public class HglController {
	@Autowired
	private InterHglService service;
	
	@SuppressWarnings("null")
	@RequestMapping(value="/mypage.re", method={RequestMethod.GET})
	public String requireLogin2_mypage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
			
		String userid = null;
	
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		
		userid = loginUser.getLogin_id();			
		
		List<HashMap<String, Object>> myBoardList = service.getMyBoardList(userid);
		List<HashMap<String, Object>> myFollowerList = service.getmyFollowerList(userid);
		List<HashMap<String, Object>> myFollowingList = service.getmyFollowingList(userid);
		
		HashMap<String,String> profile = service.getMyProfile(userid);
		HashMap<String,String> mypage =  null;
		HashMap<String,String> insertMypage =  new HashMap<String,String>();
		
		String textinput = loginUser.getLogin_name() + "'s Page";
		String textarea = loginUser.getLogin_name() + "의 페이지 입니다";
		
		insertMypage.put("textinput",textinput);
		insertMypage.put("textarea",textarea);
		insertMypage.put("userid",userid);
		
		
		mypage=	service.getMypage(userid);
		
		if(mypage == null){			
			service.insertMyPage(insertMypage);			
			insertMypage = service.getMypage(userid);
			mypage = insertMypage;
			
		}
	
		req.setAttribute("mypage", mypage);
		req.setAttribute("profile", profile);
		req.setAttribute("myBoardList", myBoardList);
		req.setAttribute("myFollowerList", myFollowerList);
		req.setAttribute("myFollowingList", myFollowingList);
		
	
		return  "hgl/mypage.tiles2";
		
	
	}// end of mypage
	
	
	@RequestMapping(value="/saveEnd.re", method={RequestMethod.POST})
	public String saveEnd(HttpServletRequest req,HttpSession session){
		
		String userid = "";
		String msg = "";
		String loc = "";
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		userid = loginUser.getLogin_id();			

		String textinput = req.getParameter("textinput");
		String textarea = req.getParameter("textarea");
		
		if(userid != null){
			HashMap<String,String> map = new HashMap<String,String>();
			map.put( "textinput",textinput);
			map.put( "textarea",textarea);
			map.put("userid",userid);
			int result =0;
			int existCnt = service.existTblMypage(userid);
			
			if(existCnt>0){ // update
				result =  service.updateMyPage(map);
			}else{// insert
				result = service.insertMyPage(map);
			}
			
			
			if(result > 0){
				 msg = "저장 완료" ;
				 loc = "/resns/mypage.re?fk_login_id="+userid;
				
				
			}else{
				 msg = "저장 실패" ;
				 loc = "javascript:history.back();";
			}
			
		}else{
			 msg = "먼저 로그인 하세요" ;
			 loc = "/resns/loginform.re";
		}
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "msg.notiles";
			
		
		
	}// end of edit
	
	
	
	
	@RequestMapping(value="/otherspage.re", method={RequestMethod.GET})
	public String otherspage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
		
		String userid  = req.getParameter("fk_login_id");
			
		
		String username = service.getUsername(userid);
			
		
		List<HashMap<String, Object>> myBoardList = service.getMyBoardList(userid);
		List<HashMap<String, Object>> myFollowerList = service.getmyFollowerList(userid);
		List<HashMap<String, Object>> myFollowingList = service.getmyFollowingList(userid);
		
		HashMap<String,String> profile = service.getMyProfile(userid);			
		HashMap<String,String> mypage =  null;
		HashMap<String,String> insertMypage =  new HashMap<String,String>();
		
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
	
		req.setAttribute("mypage", mypage);	
		req.setAttribute("userid", userid);
		req.setAttribute("profile", profile);
		req.setAttribute("myBoardList", myBoardList);
		req.setAttribute("myFollowerList", myFollowerList);
		req.setAttribute("myFollowingList", myFollowingList);
		
		
		return  "hgl/otherspage.tiles2";
		
	
	}// end of otherspage
	
	
	
}// end of HglController
