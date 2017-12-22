package com.spring.hgl.model;

import java.util.HashMap;
import java.util.List;

public interface InterHglDAO {

	
	List<HashMap<String,Object>> getMyBoardList(String userid);

	HashMap<String, String> getMyProfile(String userid);

	int existTblMypage(String userid);

	HashMap<String, String> getMypage(String userid);

	int updateMyPage(HashMap<String, String> map);
	
	int insertMyPage(HashMap<String, String> map);

	List<HashMap<String, Object>> getmyFollowerList(String userid);

	List<HashMap<String, Object>> getmyFollowingList(String userid);

	String getUsername(String userid);

	int updateMyBg(HashMap<String, Object> bgmap);

	int updateMyPf(HashMap<String, Object> pfmap);

	int getmyFollowerCnt(String userid);
	
	int getmyFollowingCnt(String userid);

	List<HashMap<String, Object>> getMyAlarmList(String userid);

	List<String> getFollowingId(String loginId);
	
}
