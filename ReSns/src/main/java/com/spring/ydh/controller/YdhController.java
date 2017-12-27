package com.spring.ydh.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.internal.matchers.SubstringMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.common.FileManager;
import com.spring.common.MyUtil;
import com.spring.common.YdhUtil;
import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.TagVO;
import com.spring.ydh.model.MCommentVO;
import com.spring.ydh.model.MusicVO;
import com.spring.ydh.service.InterMusicService;

@Controller
@Component
public class YdhController {
	
	@Autowired
	private InterMusicService service;
	

	
	@RequestMapping(value="/search.re", method={RequestMethod.GET})
	public String main(HttpServletRequest req){
		
		return "ydh/test.tiles2";
	}
	
	
	/*===================================<검색>====================================*/
	//태그게시물검색
	@RequestMapping(value="/searchEndTag.re", method={RequestMethod.GET})
	public String searchTag(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 //System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchTag = service.searchTag(map);
		
			 if(!searchTag.isEmpty()){
					
				int jtCnt = service.jtagCount(search);
				 
				 req.setAttribute("searchTag", searchTag);
				 req.setAttribute("search", search);
				 req.setAttribute("jtCnt", jtCnt);
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
		 //System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchName = service.searchName(map);
		
			 if(!searchName.isEmpty()){
				 
				 int jNCnt = service.jnameCount(search);//더보기페이징cnt
				 
				 req.setAttribute("jNCnt", jNCnt);
				 req.setAttribute("searchName", searchName);
				 req.setAttribute("search", search);
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
	//@RequestMapping(value="/otherspage.re", method={RequestMethod.GET})
	public String searchNameOne(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 HashMap<String, String> map = new HashMap<String, String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String,String>> searchNameOne = service.searchNameOne(map);//한명검색
		 //System.out.println("map확인:"+map);
		 
			 if(!searchNameOne.isEmpty()){
				 req.setAttribute("searchNameOne", searchNameOne);
				 req.setAttribute("search", search);
				// System.out.println("name:"+searchNameOne);
				 
			    }

		       
		 }//if
		    return "ydh/searchNameOne.tiles";
		
	}//search
	
	//지도검색
	@RequestMapping(value="/searchEndMap.re", method={RequestMethod.GET})
	public String searchEndMap(HttpServletRequest req){
		
		 String search = req.getParameter("search");
		 //System.out.println("tst:"+search);
		 HashMap<String,String> map = new HashMap<String,String>();
		 map.put("search", search);
		 
		 if(!search.trim().isEmpty() ){
		
		 List<HashMap<String, String>> searchMap = service.searchMap(map);//태그검색
		
			 if(!searchMap.isEmpty()){
				 
				 int jMCnt = service.jmapCount(search);//map더보기 cnt
				 
				 req.setAttribute("jMCnt", jMCnt);
				 req.setAttribute("searchMap", searchMap);
				 req.setAttribute("search", search);
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
	//TAG
	@RequestMapping(value="/displaymoreJsonTag.re", method={RequestMethod.GET})
	public String displaymoreJsonTag(HttpServletRequest req){
	    
		//System.out.println("넘어오나 확인");
		
		String start = req.getParameter("start");
		String lenNEW = req.getParameter("lenNEW");
		String searchTag = req.getParameter("searchTag");
		//String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		//System.out.println("start::"+start);
		//System.out.println("len::"+lenNEW);
		//System.out.println("searchTag::"+searchTag);
		//System.out.println("seq_tbl_board::"+seq_tbl_board);
		
		
		if(start.trim().isEmpty()){
		
			start = "1";
		}
		if(lenNEW.trim().isEmpty()){
	
			lenNEW = "3";
		}
		
		int startrno = 0;
		int endrno = 0; 
		startrno = Integer.parseInt(start);					//시작행번호
		endrno = startrno + (Integer.parseInt(lenNEW) - 1 );	// 끝행번호
		
		//System.out.println("startrno확인::"+startrno);
		//System.out.println("endrno확인::"+endrno);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startrno",Integer.toString(startrno));
		map.put("endrno", Integer.toString(endrno));
		map.put("searchTag", searchTag);
		
		//System.out.println("displayMORETAGs");
		String boardList = service.displayTagmore(map);//tag더보기
		//System.out.println("boardList"+boardList);

	    req.setAttribute("boardList", boardList);
	    
		
		return "ydhnotiles/displaymoreJsonTag.notiles";
		
	}
	
	//지도더보기
	@RequestMapping(value="/displaymoreJsonMap.re", method={RequestMethod.GET})
	public String displaymoreJsonMap(HttpServletRequest req){
	
		String start = req.getParameter("start");
		String lenNEW = req.getParameter("lenNEW");
		String searchMap = req.getParameter("searchMap");
		
		//System.out.println("startMap::"+start);
		//System.out.println("len::"+lenNEW);
		//System.out.println("searchMap::"+searchMap);
		
		
		if(start.trim().isEmpty()){
			start = "1";
		}
		if(lenNEW.trim().isEmpty()){
		
			lenNEW = "1";
		}
		
		int startrno = 0;
		int endrno = 0; 
		startrno = Integer.parseInt(start);					//시작행번호
		endrno = startrno + (Integer.parseInt(lenNEW) - 1 );	// 끝행번호
		
		//System.out.println("startrno 맵확인::"+startrno);
		//System.out.println("endrno 맵확인::"+endrno);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startrno",Integer.toString(startrno));
		map.put("endrno", Integer.toString(endrno));
		map.put("searchMap", searchMap);
		
		//System.out.println("displayMORETAGs");
		String maplist = service.displayMapmore(map);//tag더보기
		//System.out.println("maplist::"+maplist);

	    req.setAttribute("maplist", maplist);
		
		return "ydhnotiles/displaymoreJsonMap.notiles";
		
	}
	
	
	//별명들더보기
	@RequestMapping(value="/displaymoreJName.re", method={RequestMethod.GET})
	public String displaymoreJName(HttpServletRequest req){
	//System.out.println("Begin list of names");
		String start = req.getParameter("start");
		String lenNEW = req.getParameter("lenNEW");
		String searchNames = req.getParameter("searchNames");
		
		//System.out.println("startMap::"+start);
		//System.out.println("len::"+lenNEW);
		//System.out.println("searchNames::"+searchNames);
		
		
		if(start.trim().isEmpty()){
			start = "1";
		}
		if(lenNEW.trim().isEmpty()){
		
			lenNEW = "1";
		}
		
		int startrno = 0;
		int endrno = 0; 
		startrno = Integer.parseInt(start);					//시작행번호
		endrno = startrno + (Integer.parseInt(lenNEW) - 1 );	// 끝행번호
		
		//System.out.println("startrno 맵확인::"+startrno);
		//System.out.println("endrno 맵확인::"+endrno);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("startrno",Integer.toString(startrno));
		map.put("endrno", Integer.toString(endrno));
		map.put("searchNames", searchNames);
		
		//System.out.println("displaynames");
		String names = service.displayNamesmore(map);
		//System.out.println("names::"+names);

	    req.setAttribute("names", names);
		
		return "ydhnotiles/displaymoreJName.notiles";
		
	}
	

	
	/*==================================<음악LIST>====================================*/
	@RequestMapping(value="/musicBegin.re", method={RequestMethod.GET})
	public String requireLogin2_musicBegin(HttpServletRequest req,HttpServletResponse response,HttpSession session){
	
		return "ydh/mypage.tiles2";

	}//musicStart(나중에 규리씨거에 연결해야함)
	
	
	//글목록보기
	@RequestMapping(value="/music.re", method={RequestMethod.GET})
	public String music(HttpServletRequest req, HttpSession session){
		
		//List<String>  mlist = service.mlist();//글조회 페이징(X)
		
		//LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String fk_login_id = req.getParameter("fk_login_id");
		String seq_tbl_music = req.getParameter("seq_tbl_music");
		List<String> mlist = null;
		
		
		//검색어 포함
		String search = req.getParameter("search");
		String colname =req.getParameter("colname");
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("colname", colname);
		map.put("search", search);
		map.put("fk_login_id", fk_login_id);
		
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
    		//System.out.println("mlist::"+mlist);
    	}
    	else{
    		mlist = service.mlist2(map);//검색어가 없는 페이징
    	}
    	    //페이지바 : 총갯수 구하기
    	    if((colname != null && search != null) && 
	    	   (!colname.trim().isEmpty() && !search.trim().isEmpty()) &&
    		   (!colname.equals("null") && !search.equals("null")) 
    		   ){ 
    		      totalCount = service.getTotalCount2(map);//검색어가 있는경우
    		      
    		   }
    		   else{ 
    		    	totalCount = service.getTotalCount1(fk_login_id);//검색어가 없는 경우
    		    }
		
            totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
	    	
	    	String pagebar = "<ul>";
	    	
	    	String url = "music.re?fk_login_id="+fk_login_id;
	    	
	    	
	    	pagebar = YdhUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, colname, search, null, url);
	  
	    	pagebar += "<ul>";
	    	
	    	//String gobackURL ="music.re?fk_login_id="+fk_login_id+"currentShowPageNo="+currentShowPageNo+"blockSize"+blockSize+"sizePerPage"+sizePerPage+"totalPage"+totalPage+"colname"+colname+"search"+search;
	    	
	    	//System.out.println("totalCount::"+totalCount);
	    	//System.out.println("sizePerPage::"+sizePerPage);
	    	//System.out.println("currentShowPageNo::"+currentShowPageNo);
	    	//System.out.println("totalPage::"+totalPage);
	    	//System.out.println("startRno::"+startRno);
	    	//System.out.println("endRno::"+endRno);
	    	//System.out.println("blockSize::"+blockSize);
	    	
	    	
	    	req.setAttribute("pagebar", pagebar);
	    	req.setAttribute("mlist", mlist);
	    	req.setAttribute("colname", colname);//검색어 keeping위해 키값 넘김
	    	req.setAttribute("search", search);//검색어 keeping위해 키값 넘김
	    	req.setAttribute("fk_login_id", fk_login_id);
	    	req.setAttribute("seq_tbl_music", seq_tbl_music);
	    	//req.setAttribute("gobackURL", gobackURL);
		    
	    	
	    	return "ydhnotiles/music.notiles";
		    
	}//music.re
	
	//유튭 검색 자동완성
	@RequestMapping(value="/msearchJson.re", method={RequestMethod.GET})
	public String msearchJson(HttpServletRequest req){
		
		String colname = req.getParameter("colname");
		String search = req.getParameter("search");
		String fk_login_id = req.getParameter("fk_login_id");
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("search", search);
		map.put("colname", colname);
		map.put("fk_login_id", fk_login_id);
		
		String mJson = service.mJson(map);
		
		
	
		req.setAttribute("mJson", mJson);
		req.setAttribute("fk_login_id", fk_login_id);

		
		return "ydhnotiles/msearchJson.notiles";
	}//
	
	
	//글쓰기폼페이지요청
	@RequestMapping(value="/mwrite.re", method={RequestMethod.GET})
	public String mwrite(HttpServletRequest req, HttpSession session){
		
		String fk_login_id = req.getParameter("fk_login_id");

		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
    	String userid = null;
    	
        	if(loginUser != null ){
        		userid = loginUser.getLogin_id();
        	
        	}
 		   //댓글포함
  		  String seq_tbl_remusic = req.getParameter("seq_tbl_remusic");
  		
  		  req.setAttribute("seq_tbl_remusic", seq_tbl_remusic);
  		  req.setAttribute("fk_login_id", fk_login_id);
  
  		  
		

		return "ydhnotiles/mwrite.notiles";
	}//write()
	
	//글쓰기
	@RequestMapping(value="/mwriteEnd.re", method={RequestMethod.POST})
	public String mwriteEnd(HttpServletRequest req, HttpSession ses, MusicVO mvo){//나중에aop추가
		   
		String seq_tbl_music = req.getParameter("seq_tbl_music");
		   String fk_login_id = req.getParameter("fk_login_id");
		    int n = service.mwrite(mvo);//유튭글insert
			req.setAttribute("n", n);
			req.setAttribute("fk_login_id", fk_login_id);
			req.setAttribute("seq_tbl_music", seq_tbl_music);
			return "ydhnotiles/mwriteEnd.notiles";
		 }
		    
	
	
	
	 // 댓글 쓰기 
    @RequestMapping(value="/addComment.re", method={RequestMethod.GET})
    public String requireLogin2_addComment(HttpServletRequest req, HttpServletResponse response, MCommentVO commentvo)
    throws Throwable{
    
    	String fk_login_id = req.getParameter("fk_login_id");
   
    	//String gobackURL = req.getParameter("gobackURL");
    	if(req.getParameter("re_login_id").isEmpty() ){
              
    		String msg = "";
    		String loc = "/resns/mview.re";
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
    		req.setAttribute("fk_login_id", fk_login_id);
   
    		//req.setAttribute("gobackURL", "mview.re");
    		
    	return "ydhnotiles/addComment.notiles";
    	// /WEB-INF/views2/board/addCommentEnd.jsp파일을 생성한다.
    }//addComment()
	
    
    //댓글삭제
    @RequestMapping(value="/remdel.re", method={RequestMethod.GET})
	public String remdel(HttpServletRequest req, MCommentVO commentvo)
	throws Throwable{

    	
    	int n = service.deletere(commentvo);//댓글삭제
	    
    	
    	
    	if(n > 0 ){
    		
    			req.setAttribute("msg", "댓글삭제 완료!!");
    	}else{
    			
    			req.setAttribute("msg", "댓글삭제 실패ㅠㅠ");
    	}
    		
    	
    		String seq_tbl_music = commentvo.getSeq_tbl_music();
    		String seq_tbl_remusic = commentvo.getSeq_tbl_remusic();
        	String re_login_id =commentvo.getRe_login_id();
        	String fk_login_id =req.getParameter("fk_login_id");
        	
    		req.setAttribute("seq_tbl_music", seq_tbl_music);
    		req.setAttribute("fk_login_id", fk_login_id);
    		req.setAttribute("re_login_id", re_login_id);
    		req.setAttribute("seq_tbl_remusic", seq_tbl_remusic);
    		
    	     req.setAttribute("n", n);

    	
    	return "ydhnotiles/remdel.notiles";
    }
    
    
	//글한개보기
	@RequestMapping(value="/mview.re", method={RequestMethod.GET})
	public String mview(HttpServletRequest req,HttpSession session){
		 
		String seq_tbl_music = req.getParameter("seq_tbl_music");//글번호
		String fk_login_id = req.getParameter("fk_login_id");
		MusicVO mvo = null;
		
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
    	String userid = null;
    	
        	if(loginUser != null ){
        		userid = loginUser.getLogin_id();
        	}
		    HashMap<String,String> map = new HashMap<String,String>();
		    map.put("seq_tbl_music", seq_tbl_music);
		    map.put("fk_login_id", fk_login_id);
		   
        	mvo =service.mview(map,userid);//글하나보여주기
		  
        	//글쓸때 엔터
            String music_content = mvo.getMusic_content();
            music_content = music_content.replaceAll("\r\n", "<br/>");
            mvo.setMusic_content(music_content);
            
		   req.setAttribute("mvo", mvo);
		   req.setAttribute("fk_login_id", fk_login_id);
		   req.setAttribute("seq_tbl_music", seq_tbl_music);
		   
		
		//test
        // HashMap<String,String> view = service.view(seq_tbl_music,userid);
		   //댓글
		   List<HashMap<String, String> > commentList = service.commentList(seq_tbl_music);
		   req.setAttribute("commentList", commentList);
		   //req.setAttribute("view", view);
		
		return "ydhnotiles/mview.notiles";
	
	}
	
	
	//글수정폼띄우기
	@RequestMapping(value="/medit.re", method={RequestMethod.GET})
	public String meditEnd(HttpServletRequest req,HttpSession session){
		 
		String seq_tbl_music = req.getParameter("seq_tbl_music");
		String fk_login_id = req.getParameter("fk_login_id");
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("seq_tbl_music", seq_tbl_music);
		map.put("fk_login_id", fk_login_id);
		
		MusicVO mvo = service.mupdate(map);//글수정폼띄우기
		
		req.setAttribute("mvo", mvo);
		req.setAttribute("fk_login_id", fk_login_id);
		req.setAttribute("seq_tbl_music", seq_tbl_music);
		return "ydhnotiles/medit.notiles";
	
	}
	
	//글수정
		@RequestMapping(value="/meditEnd.re", method={RequestMethod.POST})
		public String medit(MusicVO mvo , HttpServletRequest req ){
			
			String fk_login_id = req.getParameter("fk_login_id");
			String seq_tbl_music = req.getParameter("seq_tbl_music");
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("music_name", mvo.getMusic_name());
			map.put("music_content", mvo.getMusic_content());
			map.put("music_link", mvo.getMusic_link());
			map.put("seq_tbl_music", mvo.getSeq_tbl_music());
			map.put("fk_login_id", mvo.getFk_login_id());
		
			
			int n = service.mupdateEnd(map);

			//System.out.println("n::"+n);
				
			req.setAttribute("n", n);//글수정(update)
		    //req.setAttribute("seq_tbl_music", mvo.getSeq_tbl_music());
		    req.setAttribute("seq_tbl_music", seq_tbl_music);
		    req.setAttribute("fk_login_id", fk_login_id);
		    
			return "ydhnotiles/meditEnd.notiles";
		
		}
	
	//글삭제
	@RequestMapping(value="/mdel.re", method={RequestMethod.GET})
	public String mdel(HttpServletRequest req){
			  
		String seq_tbl_music =   req.getParameter("seq_tbl_music");
	    String fk_login_id =  req.getParameter("fk_login_id"); 
		
	    HashMap<String,String> map = new HashMap<String,String>();
		map.put("seq_tbl_music", seq_tbl_music);
		map.put("fk_login_id", fk_login_id);
		
		int n = service.mdel(map);//글삭제
	      
		  req.setAttribute("n", n);
		  req.setAttribute("seq_tbl_music", seq_tbl_music);
		  req.setAttribute("fk_login_id", fk_login_id);
			  
		  return "ydhnotiles/mdel.notiles";
		
		}	
	
	//글삭제checkbox
	@RequestMapping(value="/mdelChckbox.re", method={RequestMethod.POST})
	public String mdelcheckbox(HttpServletRequest req){
			 //split(",");
		
		String fk_login_id = req.getParameter("fk_login_id");
	    String[] delchckboxArr = req.getParameterValues("delChkbox");
	    //System.out.println("delchckboxArr controller::"+delchckboxArr);
	    String str_seq_tbl_music = "";
        
        for (int i=0; i<delchckboxArr.length; i++) {
     
           String seq = delchckboxArr[i];
          
           if (seq.length() >0) {

        		   str_seq_tbl_music += seq+",";
           }

        } // end of for---------------------------
            
       
        String[] seq_tbl_musicArr = str_seq_tbl_music.split(",");
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("seq_tbl_musicArr", seq_tbl_musicArr);
        
	    
        String seq_tbl_music = str_seq_tbl_music;
      
	     int n = service.delcheckbox(map);//체크박스글삭제
       
	  
	    req.setAttribute("n", n);
	    req.setAttribute("seq_tbl_music", seq_tbl_music);
	    req.setAttribute("fk_login_id", fk_login_id);
			
		return "ydhnotiles/mdelChckbox.notiles";
		
		}	
	
	//====================================< MAP 지도 보여주기>========================================
	@RequestMapping(value="/mapLocation.re", method={RequestMethod.GET})
	public String map(HttpServletRequest req){
		
		List<MapVO> mapList = service.getMapLocations();//지도보여주기
		
		req.setAttribute("mapList", mapList);
		
		return "ydh/mapLocation.tiles2";
		
	}//map
	
	
}//MAIN
