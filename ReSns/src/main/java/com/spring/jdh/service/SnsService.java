package com.spring.jdh.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jdh.model.InterSnsDAO;
import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.UserVO;


@Service
public class SnsService implements InterSnsService {
	
	
	// ==== #31. 의존객체 주입하기(DI : Dependency Injection)====
		@Autowired
		private InterSnsDAO dao;

		// 유저 정보
		@Override
		public UserVO getloginMember(String id) {
			UserVO uservo = dao.getLoinMember(id);
			return uservo;
		}

		// 로그인 체크
		@Override
		public int loginEnd(HashMap<String, String> map) {
			
			int n = dao.loginEnd(map);
			
			return n;
			
		}

		// 로그인 세션 받아오는 용
		@Override
		public LoginVO getloginSession(String id) {

			LoginVO loginUser = dao.getloginSession(id);
			
			return loginUser;
		}

		// 아이디 찾기
		@Override
		public String getUserid(HashMap<String, String> map) {
			
			String userid = dao.getUserid(map);
			
			return userid;
		}

		// 비밀번호 찾기 (아이디 존재여부)
		@Override
		public int getUserExists(HashMap<String, String> map) {
			
			int n = dao.getUserExists(map);
			
			return n;
		}

		@Override
		public int updatePwd(HashMap<String, String> map) {
			int n = dao.updatePwd(map);
			return n;
		}
	


	

}
