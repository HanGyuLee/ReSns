package com.spring.pmh.model;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;

public interface InterPmhDAO {

	List<HashMap<String, String>> getReport(); // DB에서 신고정보를 가져오는 메소드

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

	List<HashMap<String, String>> getReport(HashMap<String, String> searchMap); // 검색을 하는 경우 검색결과를 가지고 오는 메소드

	
}
