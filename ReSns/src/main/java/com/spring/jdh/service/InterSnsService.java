package com.spring.jdh.service;

import java.util.HashMap;
import java.util.List;

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
	
	List<HashMap<String, String>> getNoticeList();	// 관리자 공지사항 리스트 불러오기

	NoticeVO getNoticeDetail(HashMap<String, String> map);	// 관리자 상세 페이지 불러와버리기~

	int noticeRegister(NoticeVO nvo);	// 공지사항 등록하기

	int updateNoticeDelete(String seq);	// 공지사항 삭제하기

	int noticeModify(HashMap<String, Object> notimodiMap);	// 공지사항 수정하기
	
	
	

	

	

	

}
