package com.spring.hgl.service;

import java.util.HashMap;
import java.util.List;

public interface InterHglService {

	List<HashMap<String, Object>> getMyBoardList(String userid);

	HashMap<String, String> getMyProfile(String userid);
	
}
