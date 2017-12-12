package com.spring.ydh.controller;


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

import com.spring.common.FileManager;
import com.spring.common.MyUtil;
import com.spring.jdh.model.LoginVO;
import com.spring.ydh.model.MCommentVO;
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
	public String requireLogin2_musicBegin(HttpServletRequest req,HttpServletResponse response,HttpSession session){
	
		return "ydh/mypage.tiles2";

	}//musicStart(나중에 규리씨거에 연결해야함)
	
	
	//글목록보기
	@RequestMapping(value="/music.re", method={RequestMethod.GET})
	public String music(HttpServletRequest req){
		
		//List<String>  mlist = service.mlist();//글조회 페이징(X)
		
		List<String> mlist = null;
		
		String gobackURL = MyUtil.getCurrentURL(req);
		req.setAttribute("gobackURL", gobackURL);
		
		//검색어 포함
		String search = req.getParameter("search");
		String colname =req.getParameter("colname");
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("colname", colname);
		map.put("search", search);
		
		//페이징처리
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		
		int totalCount = 0;     
		int sizePerPage = 5;    
		int currentShowPageNo=0;
		int totalPage = 0;
		
		int startRno = 0;
		int endRno = 0;
		int blockSize = 10;
		
		if(str_currentShowPageNo == null){
			//게시판의 초기화면(null값들어옴)
			currentShowPageNo = 1;
		}else{
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
		}
		
		startRno = (currentShowPageNo-1)*sizePerPage + 1;
    	endRno = (startRno+sizePerPage)-1;
		
    	map.put("startRno", String.valueOf(startRno) );
    	map.put("endRno", String.valueOf(endRno) );
    	
    	if( (colname != null && search != null) &&
    		(!colname.trim().isEmpty() && !search.trim().isEmpty()) &&
    		(!colname.equals("null") && !search.equals("null"))
    	   ){
    		mlist = service.mlist(map);//검색어가 있는 페이징
    	}
    	    mlist = service.mlist2(map);//검색어가 없는 페이징
		
    	    //페이지바 : 총갯수 구하기
    	    if((colname != null && search != null) && 
	    	   (!colname.trim().isEmpty() && !search.trim().isEmpty()) &&
    		   (!colname.equals("null") && !search.equals("null")) 
    		   ){ 
    		      totalCount = service.getTotalCount2(map);//검색어가 있는경우
    		   }
    		   else{ 
    		    	totalCount = service.getTotalCount1();//검색어가 없는 경우
    		    }
		
            totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
	    	
	    	String pagebar = "<ul>";
	    	
	    	pagebar = MyUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, colname, search, null, "music.re");
	    	
	    	pagebar += "<ul>";
	    	
	    	req.setAttribute("pagebar", pagebar);
	    	
	    	req.setAttribute("mlist", mlist);
	    	req.setAttribute("colname", colname);//검색어 keeping위해 키값 넘김
	    	req.setAttribute("search", search);//검색어 keeping위해 키값 넘김
		
		
		    return "ydh/music.tiles2";
	}//music.re
	
	//유튭 검색 자동완성
	@RequestMapping(value="/msearchJson.re", method={RequestMethod.GET})
	public String msearchJson(HttpServletRequest req){
		
		String colname = req.getParameter("colname");
		String search = req.getParameter("search");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("search", search);
		map.put("colname", colname);
		
		String mJson = service.mJson(map);
		
		
	
		req.setAttribute("mJson", mJson);

		
		return "ydhnotiles/msearchJson.notiles";
	}//
	
	
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
	
	 // 댓글 쓰기 
    @RequestMapping(value="/addComment.re", method={RequestMethod.GET})
    public String requireLogin2_addComment(HttpServletRequest req, HttpServletResponse response, MCommentVO commentvo)
    throws Throwable{
    	/*
    		댓글 씀 => tblComment에 insert 동시에 tblBoard(부모테이블)에 commentCount의 숫자가 올라감
    				동시에 두 테이블에 변화가 있어야함으로 TX가 필요하다. (TX발생함으로 throws Throwable처리를 해준다.)
    	*/
    	
    	String gobackURL = req.getParameter("gobackURL");
    	
    	if(req.getParameter("login_id").isEmpty() ){

    		String msg = "";
    		String loc = gobackURL;
    		req.setAttribute("msg", msg);
    		req.setAttribute("loc", loc);
    		
    		return "msg.notiles";
    	}
    	
    	int result = service.addComment(commentvo);//댓글쓰기
    	
    	if(result > 0 ){
    		
    			req.setAttribute("msg", "댓글쓰기 완료!!");
    	}else{
    			
    			req.setAttribute("msg", "댓글쓰기 실패ㅠㅠ");
    	}
    		
    	
    		String seq_tbl_music = commentvo.getSeq_tbl_music();
    		
    		req.setAttribute("seq_tbl_music", seq_tbl_music);
    		req.setAttribute("gobackURL", "mview.re");
    		
    	return "ydh/addComment.tiles2";
    	// /WEB-INF/views2/board/addCommentEnd.jsp파일을 생성한다.
    }//addComment()
	
    
    //댓글삭제
    
    
	//글한개보기
	@RequestMapping(value="/mview.re", method={RequestMethod.GET})
	public String mview(HttpServletRequest req,HttpSession session){
		 
		String seq_tbl_music = req.getParameter("seq_tbl_music");//글번호
		MusicVO mvo = null;
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
    	String userid = null;
    	
        	if(loginUser != null ){
        		userid = loginUser.getLogin_id();
        	}
		
        	mvo =service.mview(seq_tbl_music,userid);//글하나보여주기
		  
        	//글쓸때 엔터
            String music_content = mvo.getMusic_content();
            music_content = music_content.replaceAll("\r\n", "<br/>");
            mvo.setMusic_content(music_content);
            
		   req.setAttribute("mvo", mvo);
		   
		   //댓글
		   List<HashMap<String, String> > commentList = service.commentList(seq_tbl_music);
		   req.setAttribute("commentList", commentList);
		
		return "ydh/mview.tiles2";
	
	}
	
	
	//글수정폼띄우기
	@RequestMapping(value="/medit.re", method={RequestMethod.GET})
	public String meditEnd(HttpServletRequest req,HttpSession session){
		 
		String seq_tbl_music = req.getParameter("seq_tbl_music");
		
		MusicVO mvo = service.mupdate(seq_tbl_music);//글수정폼띄우기
		req.setAttribute("mvo", mvo);
		
		return "ydh/medit.tiles2";
	
	}
	
	//글수정
		@RequestMapping(value="/meditEnd.re", method={RequestMethod.POST})
		public String medit(MusicVO mvo , HttpServletRequest req ){
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("music_name", mvo.getMusic_name());
			map.put("music_content", mvo.getMusic_content());
			map.put("music_link", mvo.getMusic_link());
			map.put("seq_tbl_music", mvo.getSeq_tbl_music());
		
			
			int n = service.mupdateEnd(map);
			if(n<0){
				System.out.println("n::"+n);
				
			}
			req.setAttribute("n", n);//글수정(update)
		    req.setAttribute("seq_tbl_music", mvo.getSeq_tbl_music());
			return "ydh/meditEnd.tiles2";
		
		}
	
	//글삭제
	@RequestMapping(value="/mdel.re", method={RequestMethod.GET})
	public String mdel(HttpServletRequest req){
			  
		String seq_tbl_music =   req.getParameter("seq_tbl_music");
	    
			  
		int n = service.mdel(seq_tbl_music);//글삭제
	      
		  req.setAttribute("n", n);
			  
		  return "ydh/mdel.tiles2";
		
		}	
	
	//글삭제checkbox
	@RequestMapping(value="/mdelChckbox.re", method={RequestMethod.POST})
	public String mdelcheckbox(HttpServletRequest req){
			 
	    String[] delchckboxArr = req.getParameterValues("delChkbox");
	    System.out.println("delchckboxArr1::::"+delchckboxArr);
	    System.out.println("test1");
	    
	   String str_seq_tbl_music = "";
        
        for (int i=0; i<delchckboxArr.length; i++) {
        	 System.out.println("test2"+delchckboxArr);
        	 System.out.println("test3::"+i);
        	int index = delchckboxArr[i].indexOf(",");
           System.out.println("index::"+index);
           String seq = delchckboxArr[i].substring(0);
           System.out.println("seq::"+seq);
           if (i > 0) {
        	   str_seq_tbl_music += ","+seq;
              System.out.println("str_seq::"+str_seq_tbl_music);
           }
           else{
        	   str_seq_tbl_music += "("+seq;
           }
        } // end of for---------------------------
            
        str_seq_tbl_music += ")";
        System.out.println("seq_tbl_music::::"+str_seq_tbl_music);
	    
        String seq_tbl_music = str_seq_tbl_music;
        
        
	    int n = service.delcheckbox(seq_tbl_music);//체크박스글삭제
	    System.out.println("testtest::"+n);
	    req.setAttribute("n", n);
	   
			
		return "ydh/mdelChckbox.tiles2";
		
		}	
	
}//MAIN
