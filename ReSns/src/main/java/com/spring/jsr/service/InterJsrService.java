package com.spring.jsr.service;

import java.util.HashMap;
import java.util.List;

import com.spring.jsr.model.QuestionBoardReplyVO;
import com.spring.jsr.model.QuestionBoardVO;
import com.spring.pek.model.BoardVO;

public interface InterJsrService {

	//팔로우 리스트 가지고 오기.
	List<HashMap<String, String>> followList(HashMap<String, String> map);
	//팔로워 리스트
	List<HashMap<String, String>> followerList(HashMap<String, String> map);
	

	//팔로우 하기
	int followAdd(HashMap<String, String> map) throws Throwable;

	//언팔로우
	int unFollow(HashMap<String, String> map);
	
	//팔로우 하는 사람들 게시글 가지고 오기.
	List<BoardVO> followboard(HashMap<String, String> map);
	
	
	//팔로우 하는 사람들 게시글 가지고 오기2.
	List<HashMap<String,Object>> followboard2(HashMap<String, String> map);
	

	
	//팔로우 하는 사람 댓글 가져오기
	String followre(String seq_tbl_board);
	
	//태그 가져오기
	String followTag(String seq_tbl_board);
	
	//내용  가져오기
	String followCon(String seq_tbl_board);
	

	//백문백답 질문 작성
	int queAdd(QuestionBoardVO qboardvo);
	
	
	//백문백답 리스트 불러오기
	List<QuestionBoardVO> qeBoardList(HashMap<String, String> map);
	
	//검색어가 있는 백문백답 가져오기
	List<QuestionBoardVO> qeBoardList2(HashMap<String, String> map);
	
	//토탈 카운트
	int getTotalCount(HashMap<String, String> map);
	//검색어 있는 토탈
	int getTotalCount2(HashMap<String, String> map);
	
	
	
	
	//백문백답답변가져오기
	QuestionBoardReplyVO getReply(String seq_tbl_q);
	//해당하는 질문내용 가져오기
	QuestionBoardVO getQView(String seq_tbl_q);
	
	//답변달기
	int QboardRe(QuestionBoardReplyVO qbrvo) throws Throwable;
	
	//백문백답 질문삭제하기
	int qdel(String seq_tbq_q);
	
	//답변삭제하기
	int qreplyDel(String fk_seq_tbl_q)throws Throwable;
	
	//백문백답 자동검색어
	String wordQSearch(HashMap<String, String> map);
	

	



}
