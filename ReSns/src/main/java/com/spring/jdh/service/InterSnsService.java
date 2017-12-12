package com.spring.jdh.service;

import java.util.HashMap;

import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.MemberImageVO;
import com.spring.jdh.model.NoticeVO;
import com.spring.jdh.model.UserVO;

public interface InterSnsService {

	UserVO getloginMember(String id);	// 유저정보

	int loginEnd(HashMap<String, String> map);	// 로그인 체크

	LoginVO getloginSession(String id);	// 로그인 세션 받아오는 용

	String getUserid(HashMap<String, String> map);	// 아이디 찾기

	int getUserExists(HashMap<String, String> map);	// 비밀번호 찾기.. (아이디 존재여부확인)

	int updatePwd(HashMap<String, String> map);		// 비밀번호 변경하기 

	int registerMember(LoginVO lvo, UserVO uvo, MemberImageVO ivo) throws Throwable;	// 회원가입
	//

	NoticeVO noticeList(NoticeVO noticevo);	// 공지사항 데이터 가져오기

	int add_profile(MemberImageVO ivo);		// 파일첨부가 없다라면 기본이미지파일 넣어줌.

	int add_withFile(MemberImageVO ivo);	// 파일첨부가 있다라면

	
	

	

	

	

}
