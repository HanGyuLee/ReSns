package com.spring.jdh.service;

import java.util.HashMap;

import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.UserVO;

public interface InterSnsService {

	UserVO getloginMember(String id);	// 유저정보

	int loginEnd(HashMap<String, String> map);	// 로그인 체크

	LoginVO getloginSession(String id);	// 로그인 세션 받아오는 용

	

	

}
