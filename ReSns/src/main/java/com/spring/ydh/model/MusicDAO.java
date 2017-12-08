package com.spring.ydh.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class MusicDAO implements InterMusicDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override//태그검색
	public List<HashMap<String, String>> searchTag(HashMap<String, String> map) {
		List<HashMap<String, String>> taglist = sqlsession.selectList("ydhresns.searchTag", map);
		return taglist;
	}


	@Override//이름검색
	public List<HashMap<String, String>> searchName(HashMap<String, String> map) {
		List<HashMap<String, String>> searchName = sqlsession.selectList("ydhresns.searchName", map);
		return searchName;
	}
	

	@Override//이름한명검색
	public List<HashMap<String,String>> searchNameOne(HashMap<String,String> map) {
		List<HashMap<String,String>> searchone = sqlsession.selectList("ydhresns.searchNameOne",map);
		return searchone;
	}

	
	@Override//위치검색
	public List<HashMap<String, String>> searchMap(HashMap<String, String> map) {
		List<HashMap<String, String>> searchMap = sqlsession.selectList("ydhresns.searchMap",map);
		return searchMap;
	}


	@Override//json별명검색
	public int jNameCnt(HashMap<String, String> map) {
	
		int jNameCnt = sqlsession.selectOne("ydhresns.jNameCnt",map);
		return jNameCnt;
	}
	
	@Override//json별명검색
	public List<String> jName(HashMap<String, String> map) {
		List<String> jName = sqlsession.selectList("ydhresns.jName",map);
		return jName;
	}
	

	@Override//json별명한명검색
	public List<String> jNameOne(String search) {
		List<String> jNone = sqlsession.selectList("ydhresns.jNameOne",search);
		return jNone;
	}


	
	@Override//json태그검색
	public int jTagCnt(HashMap<String, String> map) {
		int  jresult = sqlsession.selectOne("ydhresns.jTagCnt",map);
		return jresult;
	}

	@Override//json태그검색
	public List<String> jTag(HashMap<String, String> map) {
		List<String> jresult = sqlsession.selectList("ydhresns.jTag",map);
		return jresult;
	}


	@Override//json지도총게시물수
	public int jMapCnt(HashMap<String, String> map) {
		int jMapCnt = sqlsession.selectOne("ydhresns.jMapCnt",map);
		return jMapCnt;
	}


	@Override//json지도
	public List<String> jMap(HashMap<String, String> map) {
		List<String> jMap = sqlsession.selectList("ydhresns.jMap",map);
		return jMap;
	}


	@Override//유튭글insert
	public int mwrite( MusicVO mvo) {
		 int n = sqlsession.insert("ydhresns.mwrite", mvo);
		return n;
	}


	@Override//글조회 페이징(X),검색(X)
	public List<String> mlist() {
		List<String> list = sqlsession.selectList("ydhresns.mlist");
		return list;
	}


	@Override//글하나보여주기
	public MusicVO mview(String seq) {
		MusicVO mvo = sqlsession.selectOne("ydhresns.mview",seq);
		return mvo;
	}





	
	
}
