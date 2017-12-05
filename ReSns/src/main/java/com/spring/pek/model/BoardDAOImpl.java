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
	public List<HashMap<String, String>> showRe(String seq_tbl_board) {
		
		List<HashMap<String, String>> reList = sqlsession.selectList("pekresns.showRe", seq_tbl_board);
		
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

	// 좋아요 누르기
	@Override
	public int addHeart(HashMap<String, String> map) {
		
		int n1 = sqlsession.insert("pekresns.addHeart", map);
		
		String seq_tbl_board = map.get("seq_tbl_board");
		
		int n2 = sqlsession.update("pekresns.addHeartCnt", seq_tbl_board);
		
		int n = 0;
		
		if (n1+n2 == 2) {
			n = 1;
		}
		
		return n;
	}

	// 이미 좋아요 눌렀는지 확인하기
	@Override
	public int HeartedUser(HashMap<String, String> map) {
		
		int cnt = sqlsession.selectOne("pekresns.HeartedUser", map);
		
		return cnt;
	}

	// 하트 아이콘 바꿔주기 위한 하트 여부 확인
	@Override
	public HeartVO heartCheck(HashMap<String, String> map) {
		
		HeartVO heartcheck = sqlsession.selectOne("pekresns.heartCheck", map);
		
		return heartcheck;
	}

}
