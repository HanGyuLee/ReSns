package com.spring.ydh.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.pek.model.MapVO;
import com.spring.pek.model.TagVO;

public interface InterMusicDAO {

	List<HashMap<String, String>> searchTag(HashMap<String, String> map);// 태그검색

	List<HashMap<String, String>> searchName(HashMap<String, String> map);// 이름검색

	List<HashMap<String, String>> searchNameOne(HashMap<String, String> map);// 이름한명검색

	List<HashMap<String, String>> searchMap(HashMap<String, String> map);// 위치검색

	public int jNameCnt(HashMap<String, String> map);// json별명검색cnt

	List<String> jName(HashMap<String, String> map);// json별명검색

	List<String> jNameOne(String search);// json별명한명검색

	public int jTagCnt(HashMap<String, String> map);// json태그검색(총게시물)

	List<String> jTag(HashMap<String, String> map);// json태그검색결과

	public int jMapCnt(HashMap<String, String> map);// json지도총게시물수

	List<String> jMap(HashMap<String, String> map);// json지도

	int mwrite(MusicVO mvo);// 유튭글insert

	List<String> mlist();// 글조회 페이징(X),검색(X)

	MusicVO mview(HashMap<String, String> map);// 글하나보여주기

	MusicVO mupdate(HashMap<String, String> map);// 글수정폼띄우기

	int mupdateEnd(HashMap<String, String> map);// 글수정(update)

	int mdel(HashMap<String, String> map);// 글삭제

	int delcheckbox(HashMap<String, Object> map);// 체크박스글삭제

	List<String> mlist(HashMap<String, String> map);// 검색어가 있는 페이징

	List<String> mlist2(HashMap<String, String> map);// 검색어가 없는 페이징

	int getTotalCount2(HashMap<String, String> map);// 검색어가 있는경우

	int getTotalCount1(String fk_login_id);// 검색어가 없는 경우

	List<String> mJson(HashMap<String, String> map);// 유튭 검색 자동완성

	List<HashMap<String, String>> commentList(String seq_tbl_music);// 댓글

	int addComment(MCommentVO commentvo);// 댓글쓰기
	
	int deletere(MCommentVO commentvo);//댓글삭제

	int updateCommentCount(String seq_tbl_music);// 글쓰기tx처리 
	
	int updateDelCommentCount(String seq_tbl_music);//글삭제tx처리 

	HashMap<String, String> view(String seq_tbl_music);// 글하나보여주기test

	List<MapVO> mapList();//지도보여주기

	int Musicalarm(HashMap<String, String> map);//music댓글알람

	List<HashMap<String,String>> displayTagmore(int startrno, int endrno);//tag더보기

	

	

}
