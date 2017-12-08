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
	
	

	@Override
	public List<HashMap<String, Object>> getMyBoardList(String userid) {
		List<HashMap<String, Object>> list = dao.getMyBoardList(userid);
		return list;
	}



	@Override
	public HashMap<String, String> getMyProfile(String userid) {
		HashMap<String, String> list = dao.getMyProfile(userid);
		return list;
	}



	@Override
	public int existTblMypage(String userid) {
		int existCnt = dao.existTblMypage(userid);
		return existCnt;
	}



	@Override
	public HashMap<String, String> getMypage(String userid) {
		HashMap<String, String> mypage = dao.getMypage(userid);
		return mypage;
	}



	@Override
	public int updateMyPage(HashMap<String, String> map) {
		int result = dao.updateMyPage(map);
		return result;
	}



	@Override
	public int insertMyPage(HashMap<String, String> map) {
		int result = dao.insertMyPage(map);
		return result;
	}



	@Override
	public List<HashMap<String, Object>> getmyFollowerList(String userid) {
		List<HashMap<String, Object>> list = dao.getmyFollowerList(userid);
		return list;
	}



	@Override
	public List<HashMap<String, Object>> getmyFollowingList(String userid) {
		List<HashMap<String, Object>> list = dao.getmyFollowingList(userid);
		return list;
	}



	@Override
	public String getUsername(String userid) {
		String userName = dao.getUsername(userid);
		return userName;
	}


}
