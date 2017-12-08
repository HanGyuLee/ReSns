package com.spring.ydh.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


public interface InterMusicDAO {

	List<HashMap<String, String>> searchTag(HashMap<String, String> map);//태그검색

	List<HashMap<String, String>> searchName(HashMap<String, String> map);//이름검색
	
	List<HashMap<String,String>> searchNameOne(HashMap<String,String> map);//이름한명검색
	 
	List<HashMap<String, String>> searchMap(HashMap<String, String> map);//위치검색
	
	public int jNameCnt(HashMap<String, String> map);//json별명검색cnt
	
	List<String> jName(HashMap<String, String> map);//json별명검색
	
	List<String>  jNameOne(String search);//json별명한명검색
	
	public int jTagCnt(HashMap<String, String> map);//json태그검색(총게시물)

	List<String> jTag(HashMap<String, String> map);//json태그검색결과

	public int jMapCnt(HashMap<String, String> map);//json지도총게시물수

	List<String> jMap(HashMap<String, String> map);//json지도

	int mwrite( MusicVO mvo);//유튭글insert

	List<String> mlist();//글조회 페이징(X),검색(X)

	MusicVO mview(String seq);//글하나보여주기



	

	
	



}
