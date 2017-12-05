package com.spring.jsr.model;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;

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
	
	//내 팔로우 보드 댓글 불러오기
	List<ReVO> followreList(String seq_tbl_board);
	
	//내 팔로우 보드 댓글 불러오기2
	List<HashMap<String, String>> followRe(String seq_tbl_board);




	

	
	
	

	

}
