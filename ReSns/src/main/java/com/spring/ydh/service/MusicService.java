package com.spring.ydh.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.TagVO;
import com.spring.ydh.model.InterMusicDAO;
import com.spring.ydh.model.MCommentVO;
import com.spring.ydh.model.MusicDAO;
import com.spring.ydh.model.MusicVO;

@Service
public class MusicService implements InterMusicService {

	@Autowired
	private InterMusicDAO dao;

	@Override//태그검색(총게시물)
	public List<HashMap<String, String>> searchTag(HashMap<String, String> map) {
		List<HashMap<String, String>> taglist = dao.searchTag(map);
		return taglist;
	}



	@Override//이름검색
	public List<HashMap<String, String>> searchName(HashMap<String, String> map) {
		List<HashMap<String, String>> search = dao.searchName(map);
		return search;
	}
	
	@Override//이름한명검색
	public List<HashMap<String,String>> searchNameOne(HashMap<String,String> map) {
		List<HashMap<String,String>> searchone = dao.searchNameOne(map);
		return searchone;
	}
	

	@Override//위치검색
	public List<HashMap<String, String>> searchMap(HashMap<String, String> map) {
		List<HashMap<String, String>> searchMap = dao.searchMap(map);
		return searchMap;
	}


	@Override//json별명검색
	public String jName(HashMap<String, String> map) {
		
		int jnameCnt = dao.jNameCnt(map);
	
		JSONArray jname = new JSONArray();
		List<String> jresult =null;
		
		if(jnameCnt > 0){	
		
		jresult = dao.jName(map);
		
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("sname",map.get("search"));
		jsonObj.put("jnameCnt",jnameCnt);
	    jsonObj.put("jresult", jresult);
		
		
		jname.put(jsonObj);	
	
		}//end of if(jresultCnt > 0)
				
				
		String str_jname = jname.toString();
		return str_jname;
	
	}


	@Override//json별명한명검색
	public String jNameOne(String search) {
		
		List<LoginVO> jNone = dao.jNameOne(search);
		JSONArray jNameOne = new JSONArray();
		
		
		 if(jNameOne != null){
			 for(LoginVO jnone :  jNone){

				JSONObject jobj = new JSONObject();
				jobj.put("login_name", jnone.getLogin_name());
				jobj.put("fk_login_id", jnone.getLogin_id());
				jNameOne.put(jobj);
			 }//for
		 }//if
		 
		 
		 String str_jNameOne = jNameOne.toString();
		return str_jNameOne;
	}
	

	@Override//태그검색(게시물)
	public String jTag(HashMap<String, String> map) {
		//System.out.println("serviceTag");
		int jtagCnt = dao.jTagCnt(map);
		
		//System.out.println("jresult확인:"+jtagCnt);
		
		
		JSONArray jTag = new JSONArray();
		List<String> jTagList = null;
		
		if(jtagCnt>0){
			
			jTagList = dao.jTag(map);
			JSONObject jobj = new JSONObject();
			jobj.put("stag",map.get("search"));
			jobj.put("jtagCnt", jtagCnt);
			jobj.put("jTagList", jTagList);
			jTag.put(jobj);
			//System.out.println("Tagtest:"+jTag);
			
		}//if
	
		
		String str_jTag = jTag.toString();
		//System.out.println("str_jTag test:"+str_jTag);
		return str_jTag;
	
	}//jTag



	@Override//json지도검색
	public String jMap(HashMap<String, String> map) {
		
		
		int jMapCnt = dao.jMapCnt(map);
		JSONArray jMap = new JSONArray();
		List<String> jMapList = null;
	   
		if(jMapCnt>0){
			jMapList = dao.jMap(map);
			JSONObject jobj = new JSONObject();
			jobj.put("smap", map.get("search"));
			jobj.put("jMapCnt", jMapCnt);
			jobj.put("jMapList", jMapList);
			jMap.put(jobj);
			
		}//if		
		
		String str_jMap = jMap.toString();
		return str_jMap;
		
	}



	@Override//유튭글insert
	public int mwrite( MusicVO mvo) {
		
		
		String id = mvo.getFk_login_id();
		String co = mvo.getMusic_content();
		String na = mvo.getMusic_name();
		String url = mvo.getMusic_link();
		String seq = mvo.getSeq_tbl_music();
		
		/*System.out.println("id확인"+id);
		System.out.println("co확인"+co);
		System.out.println("na확인"+na);
		System.out.println("url확인"+url);
		System.out.println("seq확인"+seq);
        */
	
		int  n = dao.mwrite(mvo);
	   
		//System.out.println("n test 글쓰기::"+n);
		return n;
		
	}



	/*
	
		@Override//글조회 페이징(X),검색(X)
		public List<String> mlist() {
			 List<String> list = dao.mlist();
			return list;
		}
	
	*/



	@Override//글하나보여주기
	public MusicVO mview(HashMap<String, String> map, String userid) {
		MusicVO mvo = dao.mview(map); 
		return mvo;
	}


	@Override//글수정폼띄우기
	public MusicVO mupdate(HashMap<String, String> map) {
		MusicVO mvo = dao.mupdate(map);
		return mvo;
	}
	
	
	@Override//글수정(update)
	public int mupdateEnd(HashMap<String,String> map) {
		
			 int n = dao.mupdateEnd(map);
		
			//System.out.println("Fail");
		 
		  System.out.println("n test::"+n);
		     return n;
	}



	@Override//글삭제
	public int mdel(HashMap<String, String> map) {
		 // System.out.println("service");
		  int n =  dao.mdel(map);
		  //System.out.println("n:"+n);
		return n;
	}



	@Override//체크박스글삭제
	public int delcheckbox(HashMap<String,Object> map) {
		//System.out.println("service seq::"+map);
		int n = dao.delcheckbox(map);
		//System.out.println("service n ::"+n);
		
		return n;
	}



	@Override//검색어가 있는 페이징
	public List<String> mlist(HashMap<String, String> map) {
		List<String> list = dao.mlist(map);
		return list;
	}



	@Override//검색어가 없는 페이징
	public List<String> mlist2(HashMap<String, String> map) {
		List<String> list = dao.mlist2(map);
		return list;
	}



	@Override//검색어가 있는경우
	public int getTotalCount2(HashMap<String, String> map) {
		 int n = dao.getTotalCount2(map);
		return n;
	}



	@Override//검색어가 없는 경우
	public int getTotalCount1(String fk_login_id) {
		 int n = dao.getTotalCount1(fk_login_id);
		return n;
	}



	@Override//유튭 검색 자동완성
	public String mJson(HashMap<String, String> map) {
		
		List<String> list = dao.mJson(map);
		JSONArray jsonM = new JSONArray(); 
		if(list != null){
			for(String word : list){
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("word", word);
				
				jsonM.put(jsonObj);
			}
		}
		String mJson = jsonM.toString();
		return mJson;
	
	}

	

	@Override//댓글읽어오기
	public List<HashMap<String, String>> commentList(String seq_tbl_music) {
		List<HashMap<String, String> > clist = dao.commentList(seq_tbl_music);
		return clist;
	}



	//댓글TX
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int addComment(MCommentVO commentvo)throws Throwable{
		//1.insert를해준다. => 성공하면 n == 1
		int n = 0;//답변작성
		int result = 0;//update해줌
		int alarm = 0;//알람
		int end = 0;//댓글최종상태
		
		n = dao.addComment(commentvo);//1.댓글insert
		
		String seq_tbl_music = commentvo.getSeq_tbl_music();
		
			//2.update를 해준다.
			result = dao.updateCommentCount(seq_tbl_music);//부모글(tblBoard)의 글번호	
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("seq_tbl_remusic", commentvo.getSeq_tbl_remusic());
			map.put("re_ycontent", commentvo.getRe_ycontent());
			map.put("re_login_id", commentvo.getRe_login_id());
			map.put("seq_tbl_music", commentvo.getSeq_tbl_music());
			map.put("fk_login_id", commentvo.getFk_login_id());
			
			alarm = dao.Musicalarm(map);
			
			if( ( n> 0 && seq_tbl_music != null && result>0 && alarm>0)
			|| (n == 1 && seq_tbl_music != null && result == 1 && alarm == 1) )
			{
				end = 1;
			}else{
				end = 0;
			}

			
		
		
		return end;
	}


	 //댓글삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int deletere(MCommentVO commentvo)throws Throwable{
		
		int result = 0;
		
		//1.insert를해준다. => 성공하면 n == 1
		int n = 0;
		 n = dao.deletere(commentvo);
		
		if(n==1){
			//2.update를 해준다.
			result = dao.updateDelCommentCount(commentvo.getSeq_tbl_music());//부모글(tblBoard)의 글번호	
		}
		
		return result;
	}



	@Override//글하나보여주기test
	public HashMap<String, String> view(String seq_tbl_music, String userid) {
		HashMap<String,String> map = dao.view(seq_tbl_music);
		return map;
	}



	@Override//지도보여주기
	public List<MapVO> getMapLocations() {
		List<MapVO> mapList = dao.mapList();
		return mapList;
	}



	@Override//tag더보기
	public String displayTagmore(HashMap<String,String> map) {

		String str_displaytagmore = "";
		//List<HashMap<String,String>> taglist = dao.displayTagmore(map);
        
        List<HashMap<String, String>> taglistboard = dao.searchTagMore(map);

        /*   
        System.out.println("서비스확인태그:"+map.get("searchTag"));
        System.out.println("서비스확인스타트:"+map.get("startrno"));
        System.out.println("서비스확인엔드:"+map.get("endrno"));
        */
		//JSONArray jasonList = new JSONArray();
		JSONArray jasonList2 = new JSONArray();
		
		//System.out.println("taglistboard::"+taglistboard);
		
		if(taglistboard != null && taglistboard.size()>0){
			for( HashMap<String, String> map3 : taglistboard){
				JSONObject jsonObj2 = new JSONObject();
				jsonObj2.put("login_name", map3.get("login_name"));
				jsonObj2.put("login_id", map3.get("login_id"));
				jsonObj2.put("seq_tbl_board", map3.get("seq_tbl_board"));
				jsonObj2.put("tag_content", map3.get("tag_content"));
				jsonObj2.put("bimg_filename", map3.get("bimg_filename"));
				
				jasonList2.put(jsonObj2);
				//System.out.println("이름::"+map3.get("login_name"));
			}
			

		}//end of if
		
		str_displaytagmore = jasonList2.toString();
		//System.out.println("서비스단 마지막::"+str_displaytagmore);
	
		
		
		return str_displaytagmore;
	}



	@Override//map더보기
	public String displayMapmore(HashMap<String, String> map) {
		
		String str_displaymapmore = "";
        
        List<HashMap<String, String>> maplist = dao.searchMapMore(map);
       
        /*
        System.out.println("서비스확인태그맵:"+map.get("searchMap"));
        System.out.println("서비스확인스타트맵:"+map.get("startrno"));
        System.out.println("서비스확인엔드맵:"+map.get("endrno"));
        */
		//JSONArray jasonList = new JSONArray();
		JSONArray jasonList2 = new JSONArray();
		
		//System.out.println("maplist::"+maplist);
		
		if(maplist != null && maplist.size()>0){
			for( HashMap<String, String> jmap : maplist){
				JSONObject jsonObj2 = new JSONObject();
				jsonObj2.put("login_name", jmap.get("login_name"));
				jsonObj2.put("login_id", jmap.get("login_id"));
				jsonObj2.put("seq_tbl_board", jmap.get("seq_tbl_board"));
				jsonObj2.put("bimg_filename", jmap.get("bimg_filename"));
				jsonObj2.put("board_time", jmap.get("board_time"));
				jsonObj2.put("board_content", jmap.get("board_content"));
				jsonObj2.put("map_ky", jmap.get("map_ky"));
				jsonObj2.put("map_we", jmap.get("map_we"));
				jsonObj2.put("map_name", jmap.get("map_name"));
				
				
				jasonList2.put(jsonObj2);
				//System.out.println("이름::"+jmap.get("login_name"));
			}
			

		}//end of if
		
		str_displaymapmore = jasonList2.toString();
		//System.out.println("서비스단 마지막str_displaymapmore::"+str_displaymapmore);

		
		
		return str_displaymapmore;
	}



	@Override//names(별명들)더보기
	public String displayNamesmore(HashMap<String, String> map) {
	     
		String str_displayNamesmore = "";
        
        List<HashMap<String, String>> names = dao.searchNamesMore(map);

        /*
        System.out.println("서비스확인네임s:"+map.get("searchMap"));
        System.out.println("서비스확인스타트네임s:"+map.get("startrno"));
        System.out.println("서비스확인엔드네임s:"+map.get("endrno"));
        */
        
		//JSONArray jasonList = new JSONArray();
		JSONArray jasonList2 = new JSONArray();
		
		//System.out.println("names::"+names);
		
		if(names != null && names.size()>0){
			for( HashMap<String, String> jmap : names){
				JSONObject jsonObj2 = new JSONObject();
				jsonObj2.put("login_name", jmap.get("login_name"));
				jsonObj2.put("login_id", jmap.get("login_id"));
				jsonObj2.put("user_ed", jmap.get("user_ed"));
				jsonObj2.put("user_ing", jmap.get("user_ing"));
				jsonObj2.put("user_boardcnt", jmap.get("user_boardcnt"));
				jsonObj2.put("uimg_profile_filename", jmap.get("uimg_profile_filename"));

				jasonList2.put(jsonObj2);
				//System.out.println("이름::"+jmap.get("login_name"));
			}
			

		}//end of if
		
		str_displayNamesmore = jasonList2.toString();
		//System.out.println("서비스단 마지막str_displaymapmore::"+str_displayNamesmore);

		
		
		return str_displayNamesmore;
	}



	@Override//tag json더보기 count구하기
	public int jtagCount(String search) {
		int n = dao.jtagCount(search);
		return n;
	}



	@Override//더보기페이징cnt
	public int jnameCount(String search) {
		int n = dao.jnameCount(search);
		return n;
	}



	@Override//map더보기 cnt
	public int jmapCount(String search) {
		int n = dao.jmapCount(search);
		return n;
	}



}//MAIN
