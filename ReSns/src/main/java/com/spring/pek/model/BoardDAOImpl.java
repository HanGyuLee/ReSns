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

	// 글쓴이 별명과 프사 보기
	@Override
	public HashMap<String, String> showUser(String fk_login_id) {
		
		HashMap<String, String> userHashMap = sqlsession.selectOne("pekresns.showUser", fk_login_id);
		
		return userHashMap;
	}

	// 한 게시글의 덧글 보기
	@Override
	public List<ReVO> showRe(String seq_tbl_board) {
		
		List<ReVO> reList = sqlsession.selectList("pekresns.showRe", seq_tbl_board);
		
		return reList;
	}

	// 한 게시글의 태그 보기
	@Override
	public List<TagVO> showTag(String seq_tbl_board) {
		
		List<TagVO> tagList = sqlsession.selectList("pekresns.showTag", seq_tbl_board);
		
		return tagList;
	}

	// 한 게시글의 위치 보기
	@Override
	public MapVO showLoc(String seq_tbl_board) {
		
		MapVO locvo = sqlsession.selectOne("pekresns.showLoc", seq_tbl_board);
		
		return locvo;
	}

}
