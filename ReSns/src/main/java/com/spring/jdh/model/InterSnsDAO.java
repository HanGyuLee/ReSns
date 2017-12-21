package com.spring.jdh.model;

import java.util.HashMap;
import java.util.List;

public interface InterSnsDAO {
	
	// model단 DAO 인터페이스

	UserVO getLoinMember(String id);	// 유저 정보

	int loginEnd(HashMap<String, String> map);	// 로그인 체크

	LoginVO getloginSession(String id);	// 세션 받아오는 용

	String getUserid(HashMap<String, String> map);	// 아이디 찾기

	int getUserExists(HashMap<String, String> map);	// 비밀번호 찾기 아이디존재 여부

	int updatePwd(HashMap<String, String> map);	// 비밀번호 재설정

	int registerMember(LoginVO lvo);	// 회원가입 

	int registerDetail(UserVO uvo);	// 회원가입

	int registerImg(MemberImageVO ivo);	// 회원가입(이미지)

	List<NoticeVO> getNoticeList(HashMap<String, String> map);	// 관리자 공지사항 리스트 불러오기 

	NoticeVO getNoticeDetail(HashMap<String, String> map);	// 관리자 공지사항 디테일

	int getNoticeRegister(NoticeVO nvo);	// 공지사항 등록하기

	int getNoticeDelete(String seq);	// 공지사항 삭제하기

	int getNoticeModify(HashMap<String, Object> notimodiMap);	// 공지사항 수정하기

	List<NoticeVO> getMemNotiList(HashMap<String, String> map);	// 유저용 공지사항 불러오기

	NoticeVO getMemNoticeDe(HashMap<String, String> map);	// 공지사항 리스트 디테일

	List<HashMap<String, String>> getMemList();	// 회원리스트 불러오기

	int getNoticePaging();	// 토탈카운트

	int getMemberDelete(String id);	// 회원 삭제하기

	int getMemberEdit(HashMap<String, Object> editMemberMap);	// 회원 수정

	int getMemberRestore(String id);	// 회원 복구

	List<HashMap<String, String>> getSearchList(HashMap<String, String> map);	//검색어가 있는 리스트

	List<HashMap<String, String>> getNoSearchList(HashMap<String, String> map);	// 검색어가 없는 리스트

	int getTotalCount2(HashMap<String, String> map);	// 검색어 있는 총 게시물수

	int getTotalCount1();	// 검색어 없는 총 게시물 수

	
	
	

	

	
	
	

}
