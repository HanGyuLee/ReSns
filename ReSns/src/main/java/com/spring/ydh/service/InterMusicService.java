package com.spring.ydh.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.ydh.model.MusicVO;


public interface InterMusicService {

	
   
	List<HashMap<String, String>> searchTag(HashMap<String, String> map); //태그검색
	
	List<HashMap<String, String>> searchMap(HashMap<String, String> map);//위치검색
	
	List<HashMap<String, String>> searchName(HashMap<String, String> map);//이름검색
	
	List<HashMap<String,String>> searchNameOne(HashMap<String, String> map);//이름한명검색
	
	String jName(HashMap<String, String> map);//json별명검색
	
	String jNameOne(String search);//json별명한명검색
	
	String jTag(HashMap<String, String> map);//json태그검색

	String jMap(HashMap<String, String> map);//json지도검색

	int mwrite( MusicVO mvo);//유튭글insert

	List<String> mlist();//글조회 페이징(X),검색(X)

	MusicVO mview(String seq,String userid);//글하나보여주기


	

	



	

	


	
	
	

	

	

}
