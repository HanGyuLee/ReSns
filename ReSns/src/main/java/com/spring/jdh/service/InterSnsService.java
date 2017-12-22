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
	
	List<NoticeVO> getNoticeList(HashMap<String, String> map);	// 관리자 공지사항 리스트 불러오기

	NoticeVO getNoticeDetail(HashMap<String, String> map);	// 관리자 상세 페이지 불러와버리기~

	int noticeRegister(NoticeVO nvo);	// 공지사항 등록하기

	int updateNoticeDelete(String seq);	// 공지사항 삭제하기

	int noticeModify(HashMap<String, Object> notimodiMap);	// 공지사항 수정하기

	List<NoticeVO> getMemNotice(HashMap<String, String> map);	// 유저용 공지사항 리스트 불러오기

	NoticeVO getMemNoticeDe(HashMap<String, String> map);	// 공지사항 상세페이지 리스트 불러오기

	List<HashMap<String, String>> getMemList();	// 회원리스트 뽑기

	int noticePage();	// 페이지 가져오기

	int updateMemberDelete(String id);	// 회원삭제하기

	int memberEdit(HashMap<String, Object> editMemberMap);	// 회원 수정하기

	int updateMemberRestore(String id);	// 회원 복구하기

	/// 페이징
	List<HashMap<String, String>> memberList2(HashMap<String, String> map);	// 검색어가 있는 경우 리스트

	List<HashMap<String, String>> memberList1(HashMap<String, String> map);	// 검색어가 없는 경우 리스트

	int getTotalCount2(HashMap<String, String> map);	// 검색어 있는 총게시물 수

	int getTotalCount1();	// 검색어 없는 총게시물 수

	boolean idDuplicateCheck(String userid);	//아이디 중복체크

	boolean nickDuplicateCheck(String login_name);	// 별명 중복체크

	
	
	
	
	
	

	

	

	

}
