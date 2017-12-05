package com.spring.pmh.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;


public interface InterPmhService {

	List<HashMap<String, String>> getReport(); // DB에서 신고 목록을 가지고 오는 메소드
	
	HashMap<String, String> getReportDetail(String seq); // DB에서 신고 하나의 자세한 정보를 가지고 오는 메소드

	BoardVO getBoardContent(String reportnum); // DB에서 신고당한 게시물의 내용을 가지고 오는 메소드

	List<ReVO> getReContent(String reportnum); // DB 에서 신고당한 게시물의 리플을 가지고 오는 메소드

	BimageVO getBimageContent(String reportnum); // DB에서 신고당한 게시물의 사진을 가지고 오는 메소드

	int delBoardContents(String seq) throws Throwable; // DB에서 신고당한 게시물을 비활성화 하는 메소드

	int actBoardContents(String seq); // DB에서 신고당한 게시물을 활성화 하는 메소드

	List<HashMap<String, String>> getReport(HashMap<String, String> searchMap); // 검색을 하는 경우 검색결과를 포함한 신고 목록을 가지고 오는 메소드

}
