package com.spring.jdh.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SnsDAO implements InterSnsDAO {
	
	// DAO 선언
	
	// ==== #29. 의존객체 주입하기(DI : Dependency Injection)====
		@Autowired
		private SqlSessionTemplate sqlsession;

		
		// 유저 정보
		@Override
		public UserVO getLoinMember(String id) {
			
			UserVO uservo = sqlsession.selectOne("jdhresns.getLoginMember", id);
			return uservo;
		}

		// 로그인 체크
		@Override
		public int loginEnd(HashMap<String, String> map) {
			
			int n = sqlsession.selectOne("jdhresns.loginEnd", map);
			return n;
		}

		
		// 세션 받아오는 용
		@Override
		public LoginVO getloginSession(String id) {
			
			LoginVO loginUser = sqlsession.selectOne("jdhresns.getloginSession", id);
			
			return loginUser;
		}

	

}
