package com.spring.jdh.model;

import java.util.HashMap;

public interface InterSnsDAO {
	
	// model단 DAO 인터페이스

	UserVO getLoinMember(String id);	// 유저 정보

	int loginEnd(HashMap<String, String> map);	// 로그인 체크

	LoginVO getloginSession(String id);	// 세션 받아오는 용
	
	

	

	
	
	

}
