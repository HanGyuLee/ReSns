package com.spring.ydh.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ydh.model.InterMusicDAO;
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
		List<String> jNone = dao.jNameOne(search);
		JSONArray jNameOne = new JSONArray();
		
		
		 if(jNameOne != null){
			 for(String jnone :  jNone){
		 
				JSONObject jobj = new JSONObject();
				jobj.put("jnone",jnone);
				jNameOne.put(jobj);
			 }//for
		 }//if
		 
		 
		 String str_jNameOne = jNameOne.toString();
		return str_jNameOne;
	}
	

	@Override//태그검색(게시물)
	public String jTag(HashMap<String, String> map) {
		System.out.println("serviceTag:");
		int jtagCnt = dao.jTagCnt(map);
		
		System.out.println("jresult확인:"+jtagCnt);
		
		
		JSONArray jTag = new JSONArray();
		List<String> jTagList = null;
		
		if(jtagCnt>0){
			
			jTagList = dao.jTag(map);
			JSONObject jobj = new JSONObject();
			jobj.put("stag",map.get("search"));
			jobj.put("jtagCnt", jtagCnt);
			jobj.put("jTagList", jTagList);
			jTag.put(jobj);
			System.out.println("Tagtest:"+jTag);
			
		}//if
	
		
		String str_jTag = jTag.toString();
		System.out.println("str_jTag test:"+str_jTag);
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
		/*String id = mvo.getFk_login_id();
		String co = mvo.getMusic_content();
		String na = mvo.getMusic_name();
		String url = mvo.getMusic_link();
		
		System.out.println("id확인"+id);
		System.out.println("co확인"+co);
		System.out.println("na확인"+na);
		System.out.println("url확인"+url);*/
		
	      int n = dao.mwrite(mvo);
		return n;
	}



	@Override//글조회 페이징(X),검색(X)
	public List<String> mlist() {
		 List<String> list = dao.mlist();
		return list;
	}



	@Override//글하나보여주기
	public MusicVO mview(String seq, String userid) {
		MusicVO mvo = dao.mview(seq); 
		return mvo;
	}




	
	
	
}
