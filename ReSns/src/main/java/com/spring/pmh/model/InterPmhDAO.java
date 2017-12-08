package com.spring.pmh.model;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;

public interface InterPmhDAO {

	/////////////////////////////// 신고게시판 DAO 시작 ////////////////////////////////////////
	// List<HashMap<String, String>> getReport(); // DB에서 신고정보를 가져오는 메소드

	HashMap<String, String> getReportDetail(String seq); // DB에서 신고 정보 하나를 가지고 오는 메소드

	BoardVO getBoardContent(String reportnum); // DB에서 신고된 게시물의 정보를 가지고 온다.

	List<ReVO> getReContent(String reportnum); // DB에서 신고된 게시물의 리플을 가지고 온다.

	BimageVO getBimageContent(String reportnum); // DB에서 신고된 게시물의 사진을 가지고 온다.

	int updateBoardContentStatusDel(String seq); // DB에서 신고된 게시물을 비활성화 한다.

	int updateReContentStatusDel(String seq); // DB에서 신고된 게시물의 리플을 비활성화 한다.

	int updateReportStatusDel(String seq); // DB에서 신고게시판의 신고된 게시물 번호 비활성화 한다.

	int updateBoardContentStatusAct(String seq);

	int updateReContentStatusAct(String seq);

	int updateReportStatusAct(String seq);

	// List<HashMap<String, String>> getReport(HashMap<String, String> searchMap); // 검색을 하는 경우 검색결과를 가지고 오는 메소드

	int getReportTotalCount2(HashMap<String, String> searchMap); // 검색이 있는 게시물 총수 구하는 메소드

	int getReportTotalCount1(); // 검색이 없는 게시물 총수 구하는 메솓,

	List<HashMap<String, String>> getReportPgSearch(HashMap<String, String> searchMap); // DB에서 검색결과 있는 신고정보를 가져오는 메소드(페이징처리)

	List<HashMap<String, String>> getReportPg(HashMap<String, String> searchMap); // DB에서 신고정보를 가져오는 메소드(페이징처리)
	
	/////////////////////////////// 신고게시판 DAO 끝 ////////////////////////////////////////
	
	/////////////////////////////// 문의게시판 DAO 시작 ////////////////////////////////////////
	
	List<HashMap<String, String>> getHelpPgSearch(HashMap<String, String> searchMap); // DB에서 검색결과 있는 문의정보를 가져오는 메소드(페이징처리)

	List<HashMap<String, String>> getHelpPg(HashMap<String, String> searchMap); // DB에서 검색결과 문의정보를 가져오는 메소드(페이징처리)

	int getHelpTotalCount2(HashMap<String, String> searchMap); // 검색이 있는 게시물 총수 구하는 메소드

	int getHelpTotalCount1(); // 검색이 없는 게시물 총수 구하는 메소드

	/////////////////////////////// 문의게시판 DAO 끝 ////////////////////////////////////////
}
