package com.spring.hgl.service;

import java.util.HashMap;
import java.util.List;

public interface InterHglService {

	List<HashMap<String, Object>> getMyBoardList(String userid);

	HashMap<String, String> getMyProfile(String userid);

	int existTblMypage(String userid);

	HashMap<String, String> getMypage(String userid);

	int updateMyPage(HashMap<String, String> map);
	int insertMyPage(HashMap<String, String> map);

	List<HashMap<String, Object>> getmyFollowerList(String userid);

	List<HashMap<String, Object>> getmyFollowingList(String userid);

	String getUsername(String userid);
	
}
