package com.spring.ydh.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.common.FileManager;
import com.spring.jdh.model.LoginVO;
import com.spring.ydh.model.MusicVO;
import com.spring.ydh.service.InterMusicService;

@Controller
@Component
public class YdhController {
	
	@Autowired
	private InterMusicService service;
	
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value="/search.re", method={RequestMethod.GET})
	public String main(HttpServletRequest req){
		
		return "ydh/test.tiles2";
	}
	
	
	/*===================================<검색>====================================*/
	//태그게시물검색
	@RequestMapping(value="/searchEndTag.re", method={RequestMethod.GET})
	public String searchTag(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchTag = service.searchTag(map);
		
			 if(!searchTag.isEmpty()){
				 req.setAttribute("searchTag", searchTag);
			    }
			
		 }else{
			   String msg = "검색어를 입력해주세요.";
			   String loc = "javascript:history.back();";
			   req.setAttribute("msg", msg);
			   req.setAttribute("loc", loc);
			   
			   return "msg.notiles";
		 }
		  
		
		return "ydh/searchTag.tiles";
		
	}//search1

	
	
	
	//별명검색(그룹)
	@RequestMapping(value="/searchEndName.re", method={RequestMethod.GET})
	public String searchName(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchName = service.searchName(map);
		
			 if(!searchName.isEmpty()){
				 req.setAttribute("searchName", searchName);
			    }
			
		 }else{
			   String msg = "검색어를 입력해주세요.";
			   String loc = "javascript:history.back();";
			   req.setAttribute("msg", msg);
			   req.setAttribute("loc", loc);
			   
			   return "msg.notiles";
		 }
		  
		
		return "ydh/searchName.tiles";
		
	}//search
	
	//별명검색(한명)
	@RequestMapping(value="/searchEndNameOne.re", method={RequestMethod.GET})
	public String searchNameOne(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 HashMap<String, String> map = new HashMap<String, String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String,String>> searchNameOne = service.searchNameOne(map);//한명검색
		 System.out.println("map확인:"+map);
		 
			 if(!searchNameOne.isEmpty()){
				 req.setAttribute("searchNameOne", searchNameOne);
				 System.out.println("name:"+searchNameOne);
				 
			    }

		       
		 }//if
		    return "ydh/searchNameOne.tiles";
		
	}//search
	
	//지도검색
	@RequestMapping(value="/searchEndMap.re", method={RequestMethod.GET})
	public String searchEndMap(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchMap = service.searchMap(map);//태그검색
		
			 if(!searchMap.isEmpty()){
				 req.setAttribute("searchMap", searchMap);
			    }
			
		 }else{
			   String msg = "검색어를 입력해주세요.";
			   String loc = "javascript:history.back();";
			   req.setAttribute("msg", msg);
			   req.setAttribute("loc", loc);
			   
			   return "msg.notiles";
		 }
		  
		
		return "ydh/searchMap.tiles";
		
	}//search
	
	
	
	/*===================================<검색AJAX>====================================*/
	//이름검색
	@RequestMapping(value="/searchJsonName.re", method={RequestMethod.GET})
	public String searchJsonName(HttpServletRequest req){
		
		String search = req.getParameter("search");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("search", search);
		
		String jName = service.jName(map);//별명검색
		req.setAttribute("jName", jName);
		req.setAttribute("search", search);
		
		return "ydhnotiles/searchJsonName.notiles";
	}//
	
	//json한명이름검색
	@RequestMapping(value="/searchJsonNameOne.re", method={RequestMethod.GET})
	public String searchJsonNameOne(HttpServletRequest req){
		
		String search = req.getParameter("search");
		
		String jNameOne = service.jNameOne(search);//별명검색
		req.setAttribute("jNameOne", jNameOne);
		req.setAttribute("search", search);
		
		return "ydhnotiles/searchJsonNameOne.notiles";
	}//
	
	
	 //태그게시물검색
	@RequestMapping(value="/searchJsonTag.re", method={RequestMethod.GET})
	public String searchJsonTag(HttpServletRequest req){
		
		String search = req.getParameter("search");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("search", search);
		
		
		String jTag = service.jTag(map);//태그검색(총게시물)
		
		
	
		req.setAttribute("jTag", jTag);
		req.setAttribute("search", search);
		
		return "ydhnotiles/searchJsonTag.notiles";
	}//
	
	//지도검색
	@RequestMapping(value="/searchJsonMap.re", method={RequestMethod.GET})
	public String searchJsonMap(HttpServletRequest req){
		
		String search = req.getParameter("search");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("search", search);
		
		
		String jMap = service.jMap(map);//지도검색
		
		
	
		req.setAttribute("jMap", jMap);
		req.setAttribute("search", search);
		
		return "ydhnotiles/searchJsonMap.notiles";
	}//
	
	/*==================================<더보기버튼>====================================*/
	
	
	/*==================================<음악LIST>====================================*/
	@RequestMapping(value="/musicBegin.re", method={RequestMethod.GET})
	public String musicBegin(HttpServletRequest req){
		
		return "ydh/mypage.tiles2";
	}//musicStart(나중에 규리씨거에 연결해야함)
	
	
	//글목록보기
	@RequestMapping(value="/music.re", method={RequestMethod.GET})
	public String music(HttpServletRequest req){
		
		  List<String>  mlist = service.mlist();//글조회 페이징(X),검색(X)
		  req.setAttribute("mlist", mlist);
		
		return "ydh/music.tiles2";
	}//music.re
	
	
	//글쓰기폼페이지요청
	@RequestMapping(value="/mwrite.re", method={RequestMethod.GET})
	public String mwrite(HttpServletRequest req){
		   //댓글포함
		 String seq_remusic = req.getParameter("seq_remusic");
		 req.setAttribute("seq_remusic", seq_remusic);
			
		  
		return "ydh/mwrite.tiles2";
	}//write()
	
	//글쓰기
	@RequestMapping(value="/mwriteEnd.re", method={RequestMethod.POST})
	public String mwriteEnd(HttpServletRequest req, HttpSession ses, MusicVO mvo){//나중에aop추가
		 
		 int n = service.mwrite(mvo);//유튭글insert
	
		  req.setAttribute("n", n);
		  
		return "ydh/mwriteEnd.tiles2";
	
	}
	
	//글한개보기
	@RequestMapping(value="/mview.re", method={RequestMethod.GET})
	public String mview(HttpServletRequest req,HttpSession session){
		 
		String seq = req.getParameter("seq_tbl_music");//글번호
		MusicVO mvo = null;
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
    	String userid = null;
    	
        	if(loginUser != null ){
        		userid = loginUser.getLogin_id();
        	}
		
        	mvo =service.mview(seq,userid);//글하나보여주기
		
		req.setAttribute("mvo", mvo);
		
		return "ydh/mview.tiles2";
	
	}
	
	//글수정폼띄우기
	@RequestMapping(value="/medit.re", method={RequestMethod.GET})
	public String medit(HttpServletRequest req,HttpSession session){
		 
	
		return "ydh/medit.tiles2";
	
	}
	
	//글수정
	/*@RequestMapping(value="/meditEnd.re", method={RequestMethod.POST})
	public String meditEnd(HttpServletRequest req,HttpSession session){
		 
		
		
		return "ydh/meditEnd.tiles2";
	
	}*/
	
	
	//글삭제폼띄우기
	
	//글삭제
	
	
}//MAIN
