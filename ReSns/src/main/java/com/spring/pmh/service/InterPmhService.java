package com.spring.pmh.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pmh.model.AimageVO;
import com.spring.pmh.model.AskVO;


public interface InterPmhService {

	///////////////////////////// 신고게시판 서비스 시작 //////////////////////////////////////
	// List<HashMap<String, String>> getReport(); // DB에서 신고 목록을 가지고 오는 메소드
	
	HashMap<String, String> getReportDetail(String seq); // DB에서 신고 하나의 자세한 정보를 가지고 오는 메소드

	BoardVO getBoardContent(String reportnum); // DB에서 신고당한 게시물의 내용을 가지고 오는 메소드

	List<ReVO> getReContent(String reportnum); // DB 에서 신고당한 게시물의 리플을 가지고 오는 메소드

	BimageVO getBimageContent(String reportnum); // DB에서 신고당한 게시물의 사진을 가지고 오는 메소드

	int delBoardContents(String seq) throws Throwable; // DB에서 신고당한 게시물을 비활성화 하는 메소드

	int actBoardContents(String seq); // DB에서 신고당한 게시물을 활성화 하는 메소드

	// List<HashMap<String, String>> getReport(HashMap<String, String> searchMap); // 검색을 하는 경우 검색결과를 포함한 신고 목록을 가지고 오는 메소드

	int getReportTotalCount2(HashMap<String, String> searchMap); // 검색어가 있는 경우 게시물 총수를 구하는 메소드

	int getReportTotalCount1(); // 검색어가 없는 경우 게시물 총수를 구하는 메소드

	List<HashMap<String, String>> getReportPgSearch(HashMap<String, String> searchMap); // 페이징처리된 검색결과를 포함한 신고목록 가지고오기

	List<HashMap<String, String>> getReportPg(HashMap<String, String> searchMap); // 페이징처리된 신고목록 가지고오기
	////////////////////// 신고게시판 서비스 끝 ////////////////////////

	////////////////////// 문의게시판 서비스 시작 ///////////////////////////
	List<HashMap<String, String>> getHelpPgSearch(HashMap<String, String> searchMap); // 페이징처리된 검색결과를 포함하고 답변형 게시판 문의목록 가지고오기

	List<HashMap<String, String>> getHelpPg(HashMap<String, String> searchMap); // 페이징처리된 답변형 게시판 문의목록 가지고 오기

	int getHelpTotalCount2(HashMap<String, String> searchMap); // 검색어가 있는 경우 게시물 총수를 구하는 메소드

	int getHelpTotalCount1(); // 검색어가 없는 경우 게시물 총수를 구하는 메소드

	int askWrite(HashMap<String, Object> helpMap); // 문의게시판에 글 작성하는 메소드

	int getAskSeq(); // 작성할 게시물의 예상글번호를 가져오는 메소드

	AskVO getAskDetail(String seq); // 선택한 게시물의 상세정보를 가져오는 메소드

	AimageVO getAskAimage(String seq); // 선택한 게시물의 첨부파일을 가져오는 메소드

	String getLoginNameById(String fk_login_id); // 해당하는 아이디의 회원이름을 가져오는 메소드

	int updateHelpDelete(String seq); // 해당하는 게시물의 status를 0으로 바꿔주는 메소드

	int askModify(HashMap<String, Object> helpMap); // 게시물을 update로 수정하는 메소드
			
	//////////////////////문의게시판 서비스 끝 ///////////////////////////
}
