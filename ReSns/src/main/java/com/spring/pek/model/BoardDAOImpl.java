package com.spring.pek.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

	
	// 하트 취소
	@Override
	public int deleteHeart(HashMap<String, String> map) {
		
		int n = 0;
		
		int n1 = sqlsession.delete("pekresns.deleteHeart", map);
		
		String seq_tbl_board = map.get("seq_tbl_board");
		
		int n2 = sqlsession.update("pekresns.deleteHeartCnt", seq_tbl_board);
			
		if (n1+n2 == 2) {
			n = 1;
		}
		
		return n;
	}

	
	// 하트 갯수 갱신하기
	@Override
	public int heartCounting(String seq_tbl_board) {
		
		int n = sqlsession.selectOne("pekresns.heartCounting", seq_tbl_board);
		
		return n;
	}

	// 댓글 쓰기
	@Override
	public int writeReply(HashMap<String, String> map) {
		
		int n = 0;
		
		int n1 = sqlsession.insert("pekresns.writeReply", map);
		
		String seq_tbl_board = map.get("seq_tbl_board");
		
		int n2 = sqlsession.update("pekresns.addReCnt", seq_tbl_board);
		
		if (n1+n2 == 2) {
			n = 1;
		}
		
		return n;
	}

	// 최대 groupno 구하기
	@Override
	public String maxGroupno() {
		
		String n = sqlsession.selectOne("pekresns.maxGroupno");
		
		return n;
	}

	// 댓글 갯수 갱신하기
	@Override
	public int reCounting(String seq_tbl_board) {
		
		int n = sqlsession.selectOne("pekresns.reCounting", seq_tbl_board);
		
		return n;
	}

	
	// 대댓글 쓰기
	@Override
	public int writeReRe(HashMap<String, String> map) {
		
		int n = 0;
		
		int n1 = sqlsession.insert("pekresns.writeReRe", map);
		
		String seq_tbl_board = map.get("seq_tbl_board");
		
		int n2 = sqlsession.update("pekresns.addReCnt", seq_tbl_board);
		
		if (n1+n2 == 2) {
			n = 1;
		}
		
		return n;
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(HashMap<String, String> map) {
		
		int n1= 0;
		int n2= 0;
		int n = 0;
		
		String re_depthno = map.get("re_depthno");
		
		if (Integer.parseInt(re_depthno) == 0) {		// 원글 지우기(원글의 대댓글도 삭제)
			
			String replyCount = sqlsession.selectOne("pekresns.replyCount", map);
			
			map.put("replyCount", replyCount);
			
			n1 = sqlsession.delete("pekresns.deleteReply", map);
			
			n2 = sqlsession.update("pekresns.deleteReCntByGroupno", map);
			
			if(n1+n2 > 0) {
				n = 1;
			}
			

		}
		else {	// 대댓글 지우기
			
			n1 = sqlsession.delete("pekresns.deleteReRe", map);
			
			n2 = sqlsession.update("pekresns.deleteReCnt", map);
			
			
			if (n1+n2 == 2) {
				n = 1;

			}
		}
		
		
		return n;
	
	}

	
	// 글쓰기
	@Override
	public int addBoard(HashMap<String, String> map) {
		
		int result = sqlsession.insert("pekresns.addBoard", map);
		
		return result;
	}

	
	// 방금 쓴 글번호 알기
	@Override
	public int maxSeq() {
		
		int maxSeq = sqlsession.selectOne("pekresns.maxSeq");
		
		return maxSeq;
	}

	
	// 해시태그 넣기
	@Override
	public int addTag(HashMap<String, String> map) {
		
		String tag_content = map.get("tag_content");
		
		String[] tagList = tag_content.split(",");
		
		for (int i=0; i<tagList.length; i++) {
			
			map.put("tag", tagList[i]);
			sqlsession.insert("pekresns.addTag", map);
		}
		
		return 1;
	}

	
	// 위치 추가하기
	@Override
	public int addLoc(HashMap<String, String> map) {
		
		int result = sqlsession.insert("pekresns.addLoc", map);
		
		return result;
	}

	
	// 파일첨부
	@Override
	public void addBimage(HashMap<String, String> map) {
		
		sqlsession.insert("pekresns.addBimage", map);
		
	}

	// 게시글(위치,태그,하트,덧글) 삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int deleteAll(String seq_tbl_board) throws Throwable {
		
		int n = 0;
		
		sqlsession.delete("pekresns.deleteTag", seq_tbl_board);
		
		sqlsession.delete("pekresns.deleteMap", seq_tbl_board);
		
		sqlsession.delete("pekresns.deleteHeartAll", seq_tbl_board);
		
		sqlsession.delete("pekresns.deleteReAll", seq_tbl_board);
		
		int n1 = sqlsession.update("pekresns.updateBoard", seq_tbl_board);
		
		if (n1 == 1)
			n=1;
		
		
		return n;
	}

	
	
	// 지울 파일 이름 알아오기 
	@Override
	public String fileName(String seq_tbl_board) {
		
		String fileName = sqlsession.selectOne("pekresns.fileName", seq_tbl_board);
		
		return fileName;
	}

	
	// 이미지 지우기
	@Override
	public void deleteImg(String seq_tbl_board) {
		
		sqlsession.delete("pekresns.deleteImg", seq_tbl_board);
		
	}

	// 모든 태그 보기
	@Override
	public List<TagVO> showAllTag() {
		
		List<TagVO> tagList = sqlsession.selectList("pekresns.showAllTag");
		
		return tagList;
	}

}
