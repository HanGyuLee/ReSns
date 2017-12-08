package com.spring.hgl.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HglDAO implements InterHglDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, Object>> getMyBoardList(String userid) {
		 List<HashMap<String, Object>> list = sqlsession.selectList("hglresns.myBoardList",userid);
			return list;	
	}

	@Override
	public HashMap<String, String> getMyProfile(String userid) {
		HashMap<String, String> list = sqlsession.selectOne("hglresns.myProfile",userid);
		return list;
	}

	@Override
	public int existTblMypage(String userid) {
		int existCnt = sqlsession.selectOne("hglresns.existTblMypage", userid);
		return existCnt;
	}

	@Override
	public HashMap<String, String> getMypage(String userid) {
		HashMap<String, String> mypage = sqlsession.selectOne("hglresns.myPage",userid);
		return mypage;
	}

	@Override
	public int updateMyPage(HashMap<String, String> map) {
		int result = sqlsession.update("hglresns.updateMyPage",map);
		return result;
	}

	@Override
	public int insertMyPage(HashMap<String, String> map) {
		int result = sqlsession.insert("hglresns.insertMyPage",map);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> getmyFollowerList(String userid) {
		List<HashMap<String, Object>> list = sqlsession.selectList("hglresns.myFollowerList",userid);
		return list;	
	}

	@Override
	public List<HashMap<String, Object>> getmyFollowingList(String userid) {
		List<HashMap<String, Object>> list = sqlsession.selectList("hglresns.myFollowingList",userid);
		return list;	
	}
	
	
	
	
	

}// end of HglDAO
