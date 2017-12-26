package com.spring.ydh.model;

import java.util.HashMap;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.TagVO;




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
	public List<LoginVO> jNameOne(String search) {
		List<LoginVO> jNone = sqlsession.selectList("ydhresns.jNameOne",search);
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
	public MusicVO mview(HashMap<String, String> map) {
		MusicVO mvo = sqlsession.selectOne("ydhresns.mview",map);
		return mvo;
	}

	
	@Override//글수정폼띄우기
	public MusicVO mupdate(HashMap<String, String> map) {
		MusicVO mvo = sqlsession.selectOne("ydhresns.mupdate",map);
		return mvo;
	}


	@Override//글수정(update)
	public int mupdateEnd(HashMap<String,String> map) {
	     int n = sqlsession.update("ydhresns.mupdateEnd",map);
		return n;
	}


	@Override//글삭제
	public int mdel(HashMap<String, String> map) {
			int n = sqlsession.delete("ydhresns.mdel", map);
		return n;
	}


	@Override//체크박스글삭제
	public int delcheckbox(HashMap<String,Object> map) {
		
		int n = sqlsession.delete("ydhresns.delcheckbox",map);
		System.out.println("DAO::"+n);
		System.out.println("DAO SEQ::"+map);
		return n;
	}


	@Override//검색어가 있는 페이징
	public List<String> mlist(HashMap<String, String> map) {
		List<String> list = sqlsession.selectList("ydhresns.mlist",map);
		return list;
	}


	@Override//검색어가 없는 페이징
	public List<String> mlist2(HashMap<String, String> map) {
		List<String> list = sqlsession.selectList("ydhresns.mlist2",map);
		return list;
	}


	@Override//검색어가 있는경우
	public int getTotalCount2(HashMap<String, String> map) {
		int n = sqlsession.selectOne("ydhresns.getTotalCount2", map);
		return n;
	}


	@Override//검색어가 없는 경우
	public int getTotalCount1(String fk_login_id) {
		int n = sqlsession.selectOne("ydhresns.getTotalCount1",fk_login_id);
		return n;
	}


	@Override//유튭 검색 자동완성
	public List<String> mJson(HashMap<String, String> map) {
		List<String> mlist = sqlsession.selectList("ydhresns.mJson",map);
		return mlist;
	}


	@Override//댓글
	public List<HashMap<String, String>> commentList(String seq_tbl_music) {
		List<HashMap<String, String>> list = sqlsession.selectList("ydhresns.commentList",seq_tbl_music);
		return list;
	}


	@Override//댓글쓰기
	public int addComment(MCommentVO commentvo) {
		int n = sqlsession.insert("ydhresns.addComment",commentvo);
		return n;
	}


	@Override//TX처리 댓글달린 부모글 업뎃
	public int updateCommentCount(String seq_tbl_music) {
		int n = sqlsession.insert("ydhresns.updateCommentCount",seq_tbl_music);
		return n;
	}

	
	@Override//댓글삭제
	public int deletere(MCommentVO commentvo) {
		int n = sqlsession.delete("ydhresns.deletere", commentvo);
		return n;
	}
	@Override//댓글삭제 TX처리
	public int updateDelCommentCount(String seq_tbl_music) {
		int n = sqlsession.insert("ydhresns.updateDelCommentCount",seq_tbl_music);
		return n;
	}

	@Override//글하나보여주기
	public HashMap<String, String> view(String seq_tbl_music) {
		HashMap<String, String> map = sqlsession.selectOne("ydhresns.view",seq_tbl_music);
		return map;
	}


	@Override//지도보여주기
	public List<MapVO> mapList() {
		 List<MapVO> mapList = sqlsession.selectList("ydhresns.mapList");
		return mapList;
	}


	@Override//음악댓글알람
	public int Musicalarm(HashMap<String, String> map) {
		int alarm = sqlsession.insert("ydhresns.Musicalarm",map);
		return alarm;
	}


	@Override//tag더보기
	public List<HashMap<String,String>> displayTagmore(HashMap<String,String> map) {
		List<HashMap<String,String>>  list = sqlsession.selectList("ydhresns.displayTagmore",map);
		return list;
	}


	@Override////tag더보기2
	public List<HashMap<String, String>> searchTagMore(HashMap<String, String> map) {
		List<HashMap<String, String>> taglist = sqlsession.selectList("ydhresns.searchTag2", map);
		return taglist;
	}


	@Override//map더보기
	public List<HashMap<String, String>> searchMapMore(HashMap<String, String> map) {
		List<HashMap<String, String>> maplist = sqlsession.selectList("ydhresns.searchMapMore", map);
		return maplist;
	}


	@Override//names더보기
	public List<HashMap<String, String>> searchNamesMore(HashMap<String, String> map) {
		List<HashMap<String, String>> names = sqlsession.selectList("ydhresns.searchNamesMore", map);
		return names;
	}


	@Override//tag json더보기 count구하기
	public int jtagCount(String search) {
		int n = sqlsession.selectOne("ydhresns.jtagCount",search);
		return n;
	}


	@Override//더보기페이징cnt
	public int jnameCount(String search) {
		int n = sqlsession.selectOne("ydhresns.jnameCount",search);
		return n;
	}


	@Override//map더보기 cnt
	public int jmapCount(String search) {
		int n = sqlsession.selectOne("ydhresns.jmapCount",search);
		return n;
	}





	




	
	
}
