package com.spring.hgl.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.FileManager;
import com.spring.common.ThumbnailManager;
import com.spring.hgl.service.InterHglService;
import com.spring.jdh.model.LoginVO;
import com.spring.jsr.controller.JsrController;
import com.spring.jsr.service.InterJsrService;

@Controller
@Component

public class HglController {
	@Autowired
	private InterHglService service;
	@Autowired
	private InterJsrService JsrService;
	
	@Autowired
	private FileManager fileManager;
	
	
	JsrController JsrCont;
	
	
	// 자기 페이지 
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
		
	
	// 내 배경사진 바꾸기
	@RequestMapping(value="/updateMyBgEnd.re", method={RequestMethod.POST})
	public String updateMyBgEnd(MultipartHttpServletRequest req,HttpSession session) throws Exception{
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String userid = "";		
		userid = loginUser.getLogin_id();	
		MultipartFile bgFile = req.getFile("fileBg");
		System.out.println("bgFile : "+ bgFile);
		if(bgFile==null){
			String msg = "파일을 선택해주세요 ^^ * ";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}else{
		
		session =  req.getSession();
		ServletContext svlCtx = session.getServletContext();
		String upDir = svlCtx.getRealPath("/images");
		System.out.println("확인용 : " +  upDir);
	
		HashMap<String, Object> bgmap = new HashMap<String, Object>();
		
	
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "images";
		
		String originalFilename = bgFile.getOriginalFilename();
		
		String newFileName = "";
		
		
		byte[] bytes = null;
		
		long fileSize = 0;
		
		 bytes = bgFile.getBytes();
		 
		 newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
		 
		 fileSize = bgFile.getSize();
		 
			
				
			bgmap.put("newFileName", newFileName);
			bgmap.put("originalFilename", originalFilename);
			bgmap.put("fileSize",  String.valueOf(fileSize));
			bgmap.put("userid",userid);
		
					  
		int n = service.updateMyBg(bgmap);
		
		String msg  = (n>0) ? "배경사진 변경 성공 ! "  : "배경사진 변경 실패! ";
		String loc = (n>0) ? "/resns/mypage.re?fk_login_id="+userid : "javascript:history.back();" ;
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";}
	}//  end of updateMyBgEnd
	
	
	// 프로필 사진 바꾸기
	@RequestMapping(value="/updateMyPfEnd.re", method={RequestMethod.POST})
	public String updateMyPfEnd(MultipartHttpServletRequest req,HttpSession session) throws Exception{
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String userid = "";		
		userid = loginUser.getLogin_id();	
		MultipartFile pfFile = req.getFile("filePf");
		System.out.println("pfFile: "+ pfFile);
		if(pfFile==null){
			String msg = "파일을 선택해주세요 ^^ * ";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}else{
		
		session =  req.getSession();
		ServletContext svlCtx = session.getServletContext();
		String upDir = svlCtx.getRealPath("/images");
		System.out.println("확인용 : " +  upDir);
	
		HashMap<String, Object> pfmap = new HashMap<String, Object>();
		
	
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "images";
		
		String originalFilename = pfFile.getOriginalFilename();
		
		String newFileName = "";
		
		
		byte[] bytes = null;
		
		long fileSize = 0;
		
		 bytes = pfFile.getBytes();
		 
		 newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
		 
		 fileSize = pfFile.getSize();
		 
			
				
		 pfmap.put("newFileName", newFileName);
		 pfmap.put("originalFilename", originalFilename);
		 pfmap.put("fileSize",  String.valueOf(fileSize));
		 pfmap.put("userid",userid);
		
					  
		int n = service.updateMyPf(pfmap);
		
		String msg  = (n>0) ? "프로필사진 변경 성공 ! "  : "프로필사진 변경 실패! ";
		String loc = (n>0) ? "/resns/mypage.re?fk_login_id="+userid : "javascript:history.back();" ;
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";}
	}// end of updateMyPfEnd
		
	
	// 내페이지의 타이틀, 소개 내용글 변경하기
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
			
		
	}// end of saveEnd
	
	
	// 다른사람 팔로우하기 
	@RequestMapping(value="/followAddEnd.re", method={RequestMethod.POST})
	public String requireLoginPEK_followAddEnd(HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Throwable{
		
		String follow_id = req.getParameter("followId");	
		String msg = "";
		String loc = "";
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = null;	
		//임시로 로그인 체크
		
		login_id = loginUser.getLogin_id();
		

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("follow_id", follow_id.trim());
		map.put("login_id", login_id);
		
		
		int n = JsrService.followAdd(map);
		System.out.println("n 값 : "  +n);
		
		
		if(n==1){
			msg = "팔로우 성공!";
		}
		else if(n == 0){
			msg = "팔로우 실패!";
		}
		else if(n == -3){
			msg = "이미 팔로우 함!";
		}
		
		loc = "javascript:history.back();";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		return "msg.notiles";
		
		
	}// end of requireLoginPEK_followAddEnd
		
		
		
	// 다른 사용자 페이지
	@RequestMapping(value="/otherspage.re", method={RequestMethod.GET})
	public String BlockCk_otherspage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
		
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
