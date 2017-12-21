package com.spring.hgl.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hgl.model.InterHglDAO;


@Service
public class HglService implements InterHglService {

	@Autowired
	private InterHglDAO dao;
	
	
	// 내 게시물 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getMyBoardList(String userid) {
		List<HashMap<String, Object>> list = dao.getMyBoardList(userid);
		return list;
	}


	// 내 페이지에 들어갈 프로필사진, 배경사진 가져오기
	@Override
	public HashMap<String, String> getMyProfile(String userid) {
		HashMap<String, String> list = dao.getMyProfile(userid);
		return list;
	}


	// 내 페이지 타이틀, 소개글 초기설정 되어있는지 확인
	@Override
	public int existTblMypage(String userid) {
		int existCnt = dao.existTblMypage(userid);
		return existCnt;
	}


	// 내 페이지 타이틀이랑 , 소개글 가져오기
	@Override
	public HashMap<String, String> getMypage(String userid) {
		HashMap<String, String> mypage = dao.getMypage(userid);
		return mypage;
	}


	// 내 페이지 타이틀이랑 , 소개글 수정하기
	@Override
	public int updateMyPage(HashMap<String, String> map) {
		int result = dao.updateMyPage(map);
		return result;
	}


	// 내 페이지 타이틀이랑 , 소개글 기본값으로 insert 하기 
	// ( 회원가입할때 insert 되지 않으므로 내 페이지를 처음 들어가는 순간 insert 되게 설정해놓음 )	
	@Override
	public int insertMyPage(HashMap<String, String> map) {
		int result = dao.insertMyPage(map);
		return result;
	}


	// 나를 팔로우 하는 리스트 ( 내팔로워 리스트 )
	@Override
	public List<HashMap<String, Object>> getmyFollowerList(String userid) {
		List<HashMap<String, Object>> list = dao.getmyFollowerList(userid);
		return list;
	}


	// 내가 팔로잉 하는 리스트 ( 내팔로잉 리스트 )
	@Override
	public List<HashMap<String, Object>> getmyFollowingList(String userid) {
		List<HashMap<String, Object>> list = dao.getmyFollowingList(userid);
		return list;
	}


	// 사용자의 별명 가져오기
	@Override
	public String getUsername(String userid) {
		String userName = dao.getUsername(userid);
		return userName;
	}


	// 내 페이지 배경화면 변경하기
	@Override
	public int updateMyBg(HashMap<String, Object> bgmap) {
		int result = dao.updateMyBg(bgmap);
		return result;
	}
	
	// 내 페이지 프로필사진 변경하기
	@Override
	public int updateMyPf(HashMap<String, Object> pfmap) {
		int result = dao.updateMyPf(pfmap);
		return result;
	}


	@Override
	public int getmyFollowerCnt(String userid) {
		int cnt = dao.getmyFollowerCnt(userid);
		return cnt;
	}


	@Override
	public int getmyFollowingCnt(String userid) {
		int cnt = dao.getmyFollowingCnt(userid);
		return cnt;
	}


	@Override
	public List<String> getFollowingName(String loginId) {
		List<String> list = dao.getFollowingName(loginId);
		return list;
	}


	@Override
	public List<HashMap<String, Object>> getMyAlarmList(String userid) {
		List<HashMap<String, Object>> list = dao.getMyAlarmList(userid);
		return list;
	}



}// end of HglService
