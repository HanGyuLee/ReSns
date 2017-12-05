package com.spring.hgl.model;

import java.util.HashMap;
import java.util.List;

public interface InterHglDAO {

	
	List<HashMap<String,Object>> getMyBoardList(String userid);

	HashMap<String, String> getMyProfile(String userid);
	
}
