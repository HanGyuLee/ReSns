package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.HeartVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.MessageVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;


public interface InterPekService {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

	String showUser(String fk_login_id);	// 한 사람의 별명 및 프사 보기

	String showRe(String seq_tbl_board);	// 한 게시글의 덧글 보기

	String showTag(String seq_tbl_board);	// 한 게시글의 태그 보기

	String showLoc(String seq_tbl_board);		// 게시글의 위치주소 보기

	int addHeart(HashMap<String, String> map);	// 좋아요 누르기

	int HeartedUser(HashMap<String, String> map);	// 이미 좋아요 눌렀는지 확인하기

	String heartCheck(HashMap<String, String> map);	// 하트 아이콘 바꿔주기 위한 하트 여부 확인

	int deleteHeart(HashMap<String, String> map);	// 하트 취소

	String heartCounting(String seq_tbl_board);		// 하트 갯수 갱신하기

	int writeReply(HashMap<String, String> map);	// 댓글 쓰기

	String maxGroupno();	// 최대 groupno 알아오기

	String reCounting(String seq_tbl_board);		// 댓글 갯수 갱신하기

	int writeReRe(HashMap<String, String> map);		// 대댓글 쓰기

	int deleteReply(HashMap<String, String> map);		// 댓글 삭제

	int addLoc(HashMap<String, String> map);		// 위치 추가하기

	int addBoard(HashMap<String, String> map);		// 글쓰기

	int maxSeq();		// 방금 쓴 글번호 알기

	int addTag(HashMap<String, String> map);		// 해시태그

	void addBimage(HashMap<String, String> map);		// 사진 입력

	int deleteAll(String seq_tbl_board);		// 게시글(위치,태그,하트,덧글) 삭제

	String fileName(String seq_tbl_board);		// 지울 이미지 이름 알아오기

	void deleteImg(String seq_tbl_board);		// 이미지 지우기

	List<TagVO> showAllTag();		// 모든 태그 보기

	List<HashMap<String, String>> getMessage(String login_id);		// 한 회원이 받은 쪽지 보기

	HashMap<String, String> msgDetail(String seq_tbl_msg);		// 쪽지 상세 보기

	List<HashMap<String, String>> sendedMsg(String login_id);	// 한 회원이 보낸 쪽지 보기

}
