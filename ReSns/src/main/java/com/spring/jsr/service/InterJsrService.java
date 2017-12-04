package com.spring.jsr.service;

import java.util.HashMap;
import java.util.List;

public interface InterJsrService {

	//팔로우 리스트 가지고 오기.
	List<HashMap<String, String>> followList(HashMap<String, String> map);
	//팔로워 리스트
	List<HashMap<String, String>> followerList(HashMap<String, String> map);
	

	//팔로우 하기
	int followAdd(HashMap<String, String> map) throws Throwable;

	//언팔로우
	int unFollow(HashMap<String, String> map);




}
