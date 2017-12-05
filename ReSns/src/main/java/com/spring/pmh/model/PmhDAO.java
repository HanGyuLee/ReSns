package com.spring.pmh.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;

@Repository
public class PmhDAO implements InterPmhDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	// DB에서 신고된 게시물의 목록을 가지고 온다.
	@Override
	public List<HashMap<String, String>> getReport() {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReport");
		return rvoList;
	}
	
	// DB에서 신고된 게시물의 상세정보를 가지고 온다.
	@Override
	public HashMap<String, String> getReportDetail(String seq) {
		HashMap<String, String> reportMap = sqlsession.selectOne("pmhresns.getReportDetail", seq);
		return reportMap;
	}

	// DB에서 신고된 게시물의 전체 정보를 가지고 온다.
	@Override
	public BoardVO getBoardContent(String reportnum) {
		BoardVO bvo = sqlsession.selectOne("pmhresns.getBoardContent", reportnum);
		return bvo;
	}

	// DB에서 신고된 게시물의 리플을 가지고 온다.
	@Override
	public List<ReVO> getReContent(String reportnum) {
		List<ReVO> rvoList = sqlsession.selectList("pmhresns.getReContent", reportnum);
		return rvoList;
	}

	// DB에서 신고된 게시물의 사진을 가지고 온다.
	@Override
	public BimageVO getBimageContent(String reportnum) {
		BimageVO Bivo = sqlsession.selectOne("pmhresns.getBimageContent", reportnum);
		return Bivo;
	}
	// DB에서 신고된 게시물을 비활성화한다.
	@Override
	public int updateBoardContentStatusDel(String seq) {
		int n = sqlsession.update("pmhresns.updateBoardContentStatusDel", seq);
		return n;
	}
	// DB에서 신고된 게시물의 리플을 비활성화 한다.
	@Override
	public int updateReContentStatusDel(String seq) {
		int n = sqlsession.update("pmhresns.updateReContentStatusDel", seq);
		return n;
	}

	// DB에서 신고된 게시물의 신고상태를 비활성으로 바꾼다
	@Override
	public int updateReportStatusDel(String seq) {
		int n = sqlsession.update("pmhresns.updateReportStatusDel", seq);
		return n;
	}
	
	// DB에서 신고된 게시물을 활성화한다
	@Override
	public int updateBoardContentStatusAct(String seq) {
		int n = sqlsession.update("pmhresns.updateBoardContentStatusAct", seq);
		return n;
	}

	// DB에서 신고된 게시물의 리플을 활성화한다.
	@Override
	public int updateReContentStatusAct(String seq) {
		int n = sqlsession.update("pmhresns.updateReContentStatusAct", seq);
		return n;
	}

	// DB에서 신고된 게시물의 신고상태를 활성으로 바꾼다.
	@Override
	public int updateReportStatusAct(String seq) {
		int n = sqlsession.update("pmhresns.updateReportStatusAct", seq);
		return n;
	}

	@Override
	public List<HashMap<String, String>> getReport(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReportSearch", searchMap);
		return rvoList;
	}

}
