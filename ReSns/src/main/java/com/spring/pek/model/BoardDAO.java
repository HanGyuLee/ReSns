package com.spring.pek.model;

import java.util.HashMap;
import java.util.List;


public interface BoardDAO {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

	HashMap<String, String> showUser(String fk_login_id);	// 글쓴이 별명과 프사 보기

	List<HashMap<String, String>> showRe(String seq_tbl_board);	// 한 게시글의 덧글 보기

	List<TagVO> showTag(String seq_tbl_board);	// 한 게시글의 태그 보기

	MapVO showLoc(String seq_tbl_board);		// 한 게시글의 위치주소 보기

	int addHeart(HashMap<String, String> map);	// 좋아요 누르기

	int HeartedUser(HashMap<String, String> map);	// 이미 좋아요 눌렀는지 확인하기

	HeartVO heartCheck(HashMap<String, String> map);	// 하트 아이콘 바꿔주기 위한 하트 여부 확인

	int deleteHeart(HashMap<String, String> map);		// 하트 취소

	int heartCounting(String seq_tbl_board);		// 하트 갯수 갱신하기

	int writeReply(HashMap<String, String> map);	// 댓글 쓰기

	String maxGroupno();		// 최대 groupno 알아오기

	int reCounting(String seq_tbl_board);		// 댓글 갯수 갱신하기

	int writeReRe(HashMap<String, String> map);	// 대댓글 쓰기

	int deleteReply(HashMap<String, String> map);		// 댓글 삭제

	int addBoard(HashMap<String, String> map);		// 글쓰기

	int maxSeq();		// 방금 쓴 글번호 알기

	int addTag(HashMap<String, String> map);		// 태그 넣기

	int addLoc(HashMap<String, String> map);	// 위치 추가

	void addBimage(HashMap<String, String> map);	// 파일첨부

	int deleteAll(String seq_tbl_board) throws Throwable;		// 게시글(위치,태그,하트,덧글) 삭제

	String fileName(String seq_tbl_board);		// 지울 파일 이름 알아오기

	void deleteImg(String seq_tbl_board);		// 이미지 지우기

	List<TagVO> showAllTag();		// 모든 태그 보기

}
