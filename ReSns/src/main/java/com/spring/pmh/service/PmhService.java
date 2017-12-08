package com.spring.pmh.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pmh.model.InterPmhDAO;

@Service
public class PmhService implements InterPmhService {

	@Autowired
	private InterPmhDAO pdao;
	
	////////////////////////////////// 신고게시판 서비스 시작 ///////////////////////////////////////////
	// DB에서 신고된 게시물의 목록을 가지고 온다
	/*@Override
	public List<HashMap<String, String>> getReport() {

		List<HashMap<String, String>> rvoList = pdao.getReport();
		return rvoList;
	}*/
	
	// DB에서 신고된 게시물의 자세한 정보를 가지고 온다.
	@Override
	public HashMap<String, String> getReportDetail(String seq) {
		HashMap<String, String> reportMap = pdao.getReportDetail(seq);
		return reportMap;
	}

	// DB에서 신고된 게시물의 내용을 가지고 온다.
	@Override
	public BoardVO getBoardContent(String reportnum) {
		BoardVO bvo = pdao.getBoardContent(reportnum);
		return bvo;
	}
	
	// DB에서 신고된 게시물의 리플을 가지고 온다.
	@Override
	public List<ReVO> getReContent(String reportnum) {
		List<ReVO> rvoList = pdao.getReContent(reportnum);
		return rvoList;
	}

	// DB에서 신고된 게시물의 사진을 가지고 온다.
	@Override
	public BimageVO getBimageContent(String reportnum) {
		BimageVO bivo = pdao.getBimageContent(reportnum);
		return bivo;
	}
	
	// DB에서 신고당한 게시물을 비활성화 한다.
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int delBoardContents(String seq) throws Throwable {
		
		int n1 = pdao.updateBoardContentStatusDel(seq);
		int n2 = pdao.updateReContentStatusDel(seq);
		int n3 = pdao.updateReportStatusDel(seq);
		
		int result = 0;
		if (n1 < 1) {
			return result;
		}
		
		if (n3 < 1) {
			return result;
		}
		
		if (n1 >= 1 && n3 >= 1) {
			result = n1+n2+n3;
		}
		return result;
	}
	
	// DB에서 신고당한 게시물을 활성화한다.
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int actBoardContents(String seq) {
		
		int n1 = pdao.updateBoardContentStatusAct(seq);
		int n2 = pdao.updateReContentStatusAct(seq);
		int n3 = pdao.updateReportStatusAct(seq);
		
		int result = 0;
		if (n1 < 1) {
			return result;
		}
		
		if (n3 < 1) {
			return result;
		}
		
		if (n1 >= 1 && n3 >= 1) {
			result = n1+n2+n3;
		}
		return result;
	}

	// 검색을 하는 경우 검색결과를 포함한 신고리스트를 가지고 오는 메소드
	/*@Override
	public List<HashMap<String, String>> getReport(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = pdao.getReport(searchMap);
		return rvoList;
	}*/

	// 검색결과가 있는 게시물 총수를 구한다.
	@Override
	public int getReportTotalCount2(HashMap<String, String> searchMap) {
		int count = pdao.getReportTotalCount2(searchMap);
		return count;
	}

	@Override
	public int getReportTotalCount1() {
		int count = pdao.getReportTotalCount1();
		return count;
	}

	// 페이징 처리를 위해 게시물의 목록 가지고 오기
	@Override
	public List<HashMap<String, String>> getReportPgSearch(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = pdao.getReportPgSearch(searchMap);
		return rvoList;
	}

	@Override
	public List<HashMap<String, String>> getReportPg(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = pdao.getReportPg(searchMap);
		return rvoList;
	}
	////////////////////////////////// 신고게시판 서비스 끝 ///////////////////////////////////////////

	////////////////////////////////// 문의게시판 서비스 시작 ///////////////////////////////////////////
	
	@Override
	public List<HashMap<String, String>> getHelpPgSearch(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> helpList = pdao.getHelpPgSearch(searchMap);
		return helpList;
	}

	@Override
	public List<HashMap<String, String>> getHelpPg(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> helpList = pdao.getHelpPg(searchMap);
		return helpList;
	}

	@Override
	public int getHelpTotalCount2(HashMap<String, String> searchMap) {
		int count = pdao.getHelpTotalCount2(searchMap);
		return count;
	}

	@Override
	public int getHelpTotalCount1() {
		int count = pdao.getHelpTotalCount1();
		return count;
	}
	
	//////////////////////////////////문의게시판 서비스 끝 ///////////////////////////////////////////
}
