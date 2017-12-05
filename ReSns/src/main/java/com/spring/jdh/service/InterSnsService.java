package com.spring.jdh.service;

import java.util.HashMap;

import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.UserVO;

public interface InterSnsService {

	UserVO getloginMember(String id);	// 유저정보

	int loginEnd(HashMap<String, String> map);	// 로그인 체크

	LoginVO getloginSession(String id);	// 로그인 세션 받아오는 용

	String getUserid(HashMap<String, String> map);	// 아이디 찾기

	int getUserExists(HashMap<String, String> map);	// 비밀번호 찾기.. (아이디 존재여부확인)

	int updatePwd(HashMap<String, String> map);		// 비밀번호 재설정
	
	

	

	

	

}
