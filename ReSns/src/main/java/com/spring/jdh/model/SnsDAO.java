package com.spring.jdh.model;

import java.util.HashMap;
import java.util.List;

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

		// 아이디 찾기
		@Override
		public String getUserid(HashMap<String, String> map) {
			String login_id = sqlsession.selectOne("jdhresns.getUserid", map);
			return login_id;
		}
		
		
		// 아이디 존재여부
		@Override
		public int getUserExists(HashMap<String, String> map) {
			
			int n = sqlsession.selectOne("jdhresns.getUserExists", map);
			
			return n;
		}

		// 비밀번호 재설정
		@Override
		public int updatePwd(HashMap<String, String> map) {
			
			int n = sqlsession.update("jdhresns.updatePwd", map);
			
			return n;
		}
		
		
		// 회원가입
		@Override
		public int registerMember(LoginVO lvo) {
			int p = sqlsession.insert("jdhresns.registerMember", lvo);
			return p;
		}
		
		// 회원가입
		@Override
		public int registerDetail(UserVO uvo) {
			int s = sqlsession.insert("jdhresns.registerDetail", uvo);
			return s;
		}

		
		// 회원가입
		@Override
		public int registerImg(MemberImageVO ivo) {
			int v = sqlsession.insert("jdhresns.registerImg", ivo);
			return v;
		}

	
				// 공지사항 리스트
				/*@Override
				public NoticeVO getNoticeList(NoticeVO noticevo) {
					
					NoticeVO noticeList = sqlsession.selectOne("jdhresns.getNoticeList", noticevo);
					
					return noticeList;
				}*/

				// 공지사항 리스트
				@Override
				public List<NoticeVO> getNoticeList(HashMap<String, String> map) {
					
					List<NoticeVO> noticeList = sqlsession.selectList("jdhresns.getNoticeList", map);
					
					return noticeList;
				}

				// 공지사항 디테일 뿌리기
				@Override
				public NoticeVO getNoticeDetail(HashMap<String, String> map) {
					
					NoticeVO nvo = sqlsession.selectOne("jdhresns.getNoticeDetail", map);
					
					return nvo;
				}

				// 공지사항 등록하기
				@Override
				public int getNoticeRegister(NoticeVO nvo) {
					
					int n = sqlsession.insert("jdhresns.getNoticeRegister", nvo);
					
					return n;
				}

				// 공지사항 삭제하기
				@Override
				public int getNoticeDelete(String seq) {
					int n = sqlsession.update("jdhresns.getNoticeDelete", seq);
					return n;
				}

				// 공지사항 수정하기
				@Override
				public int getNoticeModify(HashMap<String, Object> notimodiMap) {
					 System.out.println("확인용"+notimodiMap.get("notice_title"));
					int n = sqlsession.update("jdhresns.getNoticeModify", notimodiMap);
					
					return n;
				}

				// 유저용 공지사항 리스트
				@Override
				public List<NoticeVO> getMemNotiList(HashMap<String, String> map) {
					
					// System.out.println("확인용");
					List<NoticeVO> memnoticeList = sqlsession.selectList("jdhresns.getMemNotiList", map);
					
					return memnoticeList;
				}

				// 유저용 공지사항
				@Override
				public NoticeVO getMemNoticeDe(HashMap<String, String> map) {
					
					NoticeVO nvo = sqlsession.selectOne("jdhresns.getMemNoticeDe", map);
					
					return nvo;
				}

				// 회원리스트 불러오기
				@Override
				public List<HashMap<String, String>> getMemList() {
					
					List<HashMap<String, String>> memList = sqlsession.selectList("jdhresns.getMemList");
					
					return memList;
				}

				// 페이징
				@Override
				public int getNoticePaging() {
					
					int n = sqlsession.selectOne("jdhresns.getNoticePaging");
					
					return n;
				}

				// 회원 삭제하기
				@Override
				public int getMemberDelete(String id) {
					
					int n = sqlsession.update("jdhresns.getMemberDelete", id);
					
					return n;
				}

				// 회원 수정하기
				@Override
				public int getMemberEdit(HashMap<String, Object> editMemberMap) {
					
					int n = sqlsession.update("jdhresns.getMemberEdit", editMemberMap);
					
					return n;
				}

				// 회원 복구
				@Override
				public int getMemberRestore(String id) {
					
					int n = sqlsession.update("jdhresns.getMemberRestore", id);
					
					return n;
				}

				// 검색어 있는 리스트 뽑기
				@Override
				public List<HashMap<String, String>> getSearchList(HashMap<String, String> map) {
					
					List<HashMap<String, String>> searchList =  sqlsession.selectOne("jdhresns.getSearchList", map);
					
					return searchList;
				}

				// 검색어가 없는 리스트 뽑기
				@Override
				public List<HashMap<String, String>> getNoSearchList(HashMap<String, String> map) {
					List<HashMap<String, String>> searchList = sqlsession.selectOne("jdhresns.getNoSearchList", map);
					return searchList;
				}

				// 검색어 있는 총 게시물 수
				@Override
				public int getTotalCount2(HashMap<String, String> map) {
					
					int n = sqlsession.selectOne("jdhresns.getTotalCount2", map);
					
					return n;
				}

				// 검색어 없는 총 게시물 수
				@Override
				public int getTotalCount1() {
					
					int n = sqlsession.selectOne("jdhresns.getTotalCount1");
					
					return n;
				}
				
				
				

}
