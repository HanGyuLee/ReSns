package com.spring.ydh.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.ydh.model.MCommentVO;
import com.spring.ydh.model.MusicDAO;
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

	//List<String> mlist();//글조회 페이징(X),검색(X)

	MusicVO mview(String seq_tbl_music ,String userid);//글하나보여주기

	MusicVO mupdate(String seq_tbl_music);//글수정폼띄우기
	
	int mupdateEnd(HashMap<String,String> map);//글수정(update)

	int mdel(String seq_tbl_music);//글삭제

	int delcheckbox(String seq_tbl_music);//체크박스글삭제

	List<String> mlist(HashMap<String, String> map);//검색어가 있는 페이징

	List<String> mlist2(HashMap<String, String> map);//검색어가 없는 페이징

	int getTotalCount2(HashMap<String, String> map);//검색어가 있는경우

	int getTotalCount1();//검색어가 없는 경우

	String mJson(HashMap<String, String> map);//유튭 검색 자동완성

	List<HashMap<String, String>> commentList(String seq_tbl_music);//댓글

	int addComment(MCommentVO commentvo);//댓글쓰기
	
	

	


	

	



	

	


	
	
	

	

	

}
