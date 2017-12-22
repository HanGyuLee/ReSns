package com.spring.hgl.service;

import java.util.HashMap;
import java.util.List;

public interface InterHglService {

	// 내 게시물 리스트 가져오기
	List<HashMap<String, Object>> getMyBoardList(String userid);

	// 내 페이지에 들어갈 프로필사진, 배경사진 가져오기
	HashMap<String, String> getMyProfile(String userid);

	// 내 페이지 타이틀, 소개글 초기설정 되어있는지 확인
	int existTblMypage(String userid);

	// 내 페이지 타이틀이랑 , 소개글 가져오기
	HashMap<String, String> getMypage(String userid);

	// 내 페이지 타이틀이랑 , 소개글 수정하기
	int updateMyPage(HashMap<String, String> map);
	
	// 내 페이지 타이틀이랑 , 소개글 기본값으로 insert 하기 
	// ( 회원가입할때 insert 되지 않으므로 내 페이지를 처음 들어가는 순간 insert 되게 설정해놓음 )
	int insertMyPage(HashMap<String, String> map);

	// 나를 팔로우 하는 리스트 ( 내팔로워 리스트 ) 
	List<HashMap<String, Object>> getmyFollowerList(String userid);

	// 내가 팔로잉 하는 리스트 ( 내팔로잉 리스트 )
	List<HashMap<String, Object>> getmyFollowingList(String userid);

	// 사용자의 별명 가져오기
	String getUsername(String userid);

	// 내 페이지 배경화면 변경하기
	int updateMyBg(HashMap<String, Object> bgmap);

	// 내 페이지 프로필사진 변경하기
	int updateMyPf(HashMap<String, Object> pfmap);

	// 내 팔로워 수 구하기
	int getmyFollowerCnt(String userid);

	// 내 팔로잉 수 구하기
	int getmyFollowingCnt(String userid);

	// 로그인하고있는 사람의 팔로잉리스트(팔로우당하는사람의 이름리스트) 얻어오기
	// 다른 사람 페이지를 가거나 다른사람의 팔로우 목록을 봤을때도 내가 팔로우 하고 있는 사람 언팔하기로 표시되도록
	List<String> getFollowingId(String loginId);

	// 내 알람 리스트 받아오기
	List<HashMap<String, Object>> getMyAlarmList(String userid);

	
} // end of InterHglService
