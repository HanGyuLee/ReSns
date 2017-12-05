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
	
	
	
	
	

}// end of HglDAO
