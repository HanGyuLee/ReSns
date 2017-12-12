package com.spring.jdh.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.jdh.model.InterSnsDAO;
import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.MemberImageVO;
import com.spring.jdh.model.NoticeVO;
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

		@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
		@Override
		public int registerMember(LoginVO lvo, UserVO uvo, MemberImageVO ivo) throws Throwable {	//
			int p = dao.registerMember(lvo);
			int s = dao.registerDetail(uvo);
			int v = dao.registerImg(ivo);
			
			return (p + s + v);	// + v
		}

		

		// 파일첨부가 없다라면 기본이미지파일 넣어주는 
		@Override
		public int add_profile(MemberImageVO ivo) {
			
			return 0;
			/*MemberImageVO prof = dao.getAdd_profile(ivo);
			
			return prof;*/
		}

		// 파일첨부가 있다라면
		@Override
		public int add_withFile(MemberImageVO ivo) {
			
			
			
			return 0;
		}

		// 공지사항 리스트 불러오기
		@Override
		public List<HashMap<String, String>> getNoticeList() {
			
			 List<HashMap<String, String>> noticeList = dao.getNoticeList();
			
			return noticeList;
		}

		
	


	

}
