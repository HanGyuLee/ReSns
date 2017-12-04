package com.spring.pek.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 인기 리스트 보기
	@Override
	public List<HashMap<String, String>> getBoardList() {
		
		List<HashMap<String, String>> boardList = sqlsession.selectList("pekresns.getBoardList");
		
		return boardList;
	}

}
