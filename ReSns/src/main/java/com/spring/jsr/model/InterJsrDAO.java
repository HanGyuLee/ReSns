package com.spring.jsr.model;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;

public interface InterJsrDAO {

	//팔로우 리스트 가지고 오는 메소드
	List<HashMap<String, String>> getFollowList(HashMap<String, String> map);
	//팔로워 리스트
	List<HashMap<String, String>> getFollowerList(HashMap<String, String> map);
	
	//이미 팔로우 되어있는지 확인
	int followCheck(HashMap<String, String> map);
	
	
	//팔로우
	int followAdd(HashMap<String, String> map);
	//팔로우 후 팔로워, 팔로우 수 증가
	int followupdate(HashMap<String, String> map);
	int followerupdate(HashMap<String, String> map);


	
	//언팔로우 하기
	int unFollow(HashMap<String, String> map);
	//팔로우, 팔로워  수 감소시키기
	int unfollowupdate(HashMap<String, String> map);
	int unfollowerupdate(HashMap<String, String> map);
	
	//내 팔로우 보드 리스트 불러오기
	List<BoardVO> getFollowBoardView(HashMap<String, String> map);
	
	
	//내 팔로우 보드 댓글 불러오기2
	List<HashMap<String, String>> followRe(String seq_tbl_board);
	
	//내 팔로우 태그 가져오기
	
	//내 팔로우 해당하는 내용 불러오기
	String getConVeiw(String seq_tbl_board);
	
	//태그 가져오기
	List<String> getFollowTag(String seq_tbl_board);
	
	
	//백문백답 게시글 작성하기
	int queAdd(QuestionBoardVO qboardvo);
	
	//백문백답 리스트 가져오기
	List<QuestionBoardVO> getQeList(HashMap<String, String> map);
	
	//백문백답 답변가져오기
	QuestionBoardReplyVO getRp(String seq_tbl_q);
	//해당하는 질문내용 가져오기
	QuestionBoardVO getQView(String seq_tbl_q);
	
	//답변완료
	int QboardRe(QuestionBoardReplyVO qbrvo);
	//질문 상태값 변경
	int Qstaup(String fk_seq_tbl_q);
	
	//글삭제하기
	int qdel(String seq_tbq_q);
	
	//답변삭제하기
	int adal(String fk_seq_tbl_q);
	//답변 삭제 후 질문 상태값 바꿔주기
	int adalpUp(String fk_seq_tbl_q);
	
	
	




	

	
	
	

	

}
