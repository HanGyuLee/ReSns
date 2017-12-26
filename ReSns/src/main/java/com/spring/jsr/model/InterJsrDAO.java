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
	
	
	//나를 팔로우 하고 있는지 확인
	int followerCheck(HashMap<String, String> map);
	
	
	//팔로우
	int followAdd(HashMap<String, String> map);
	//팔로우 후 팔로워, 팔로우 수 증가
	int followupdate(HashMap<String, String> map);
	int followerupdate(HashMap<String, String> map);
	//팔로우 Seq알아오기
	String followSeqCheck(HashMap<String, String> map);
	
	
	//팔로우 후 알람테이블 인서트
	int followAlaram(HashMap<String, String> map);

	
	//언팔로우 하기
	int unFollow(HashMap<String, String> map);
	//팔로우, 팔로워  수 감소시키기
	int unfollowupdate(HashMap<String, String> map);
	int unfollowerupdate(HashMap<String, String> map);
	
	//내 팔로우 보드 리스트 불러오기
	List<BoardVO> getFollowBoardView(HashMap<String, String> map);
	//내 팔로우 메인 토탈카운트
	int getFollowMainTotalCount(HashMap<String, String> map);
	
	//내 팔로우 보드 댓글 불러오기2
	List<HashMap<String, String>> followRe(String seq_tbl_board);
	List<HashMap<String, String>> followRe2(HashMap<String, String> map);

	//내 팔로우 해당 게시글 댓글 카운트 
	int ReGetCount(String seq_tbl_board);
	
	
	//내 팔로우 해당하는 내용 불러오기
	String getConVeiw(String seq_tbl_board);
	
	//태그 가져오기
	List<TagVO> getFollowTag(String seq_tbl_board);
	
	
	//백문백답 게시글 작성하기
	int queAdd(QuestionBoardVO qboardvo);
	//알람 위해 게시글 시퀀스 가져오기
	String queseqGet(QuestionBoardVO qboardvo);
	//알람 테이블에 인서트
	int queAlaram(HashMap<String,String> map);
	
	
	//백문백답 리스트 가져오기
	List<QuestionBoardVO> getQeList(HashMap<String, String> map);
	//검색어가 있는 리스트 가져오기
	List<QuestionBoardVO> getQeList2(HashMap<String, String> map);
	//검색어 없는 토탈 카운트
	int getTotalCount(HashMap<String, String> map);
	//검색어 없는 토탈 카운트
	int getTotalCount2(HashMap<String, String> map);
	
	
	
	//백문백답 답변가져오기
	HashMap<String,String> getRp(String seq_tbl_q);
	//해당하는 질문내용 가져오기
	QuestionBoardVO getQView(String seq_tbl_q);
	
	//답변완료
	int QboardRe(QuestionBoardReplyVO qbrvo);
	//질문 상태값 변경
	int Qstaup(String fk_seq_tbl_q);
	//답변에 대한 알람주기
	int Qrealaram(HashMap<String,String> map);
	
	//글삭제하기
	int qdel(String seq_tbq_q);
	
	//답변삭제하기
	int adal(String fk_seq_tbl_q);
	//답변 삭제 후 질문 상태값 바꿔주기
	int adalpUp(String fk_seq_tbl_q);
	
	//백문백답 자동완성
	List<String> wordQSearch(HashMap<String, String> map);
	
	//팔로우 하트 체크
	int followheartCk(HashMap<String,Object> map2);
	
	
	//차단체크
	int followblock(HashMap<String,String> map);
	
	//블락신청한 사람 아이디 가져오기
	String getblockResId(HashMap<String, String> map);
	
	//차단하기
	int followblockAdd(HashMap<String, String> map);
	
	//차단 취소하기
	int blockDel(HashMap<String, String> map);
	
	//블락리스트 가져오기
	List<HashMap<String, String>> myBlockList(String login_id);
	
	//이름알아오기
	String getUsername(String q_fk_login_id);
	
	//알람용 글 한개보기
	HashMap<String,Object> getAlarmBoard(HashMap<String, String> map);
		

	
	
	
	
	

	

	


	
	
	

	

}
