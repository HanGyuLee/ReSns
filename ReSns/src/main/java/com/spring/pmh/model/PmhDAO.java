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

	////////////////////////////////////// 신고게시판 DAO 시작 //////////////////////////////////////////
	// DB에서 신고된 게시물의 목록을 가지고 온다.
	/*@Override
	public List<HashMap<String, String>> getReport() {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReport");
		return rvoList;
	}*/
	
	
	/*@Override
	public List<HashMap<String, String>> getReport(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReportSearch", searchMap);
		return rvoList;
	}*/

	@Override
	public int getReportTotalCount2(HashMap<String, String> searchMap) {
		int count = sqlsession.selectOne("pmhresns.getReportTotalCount2", searchMap);
		return count;
	}

	@Override
	public int getReportTotalCount1() {
		int count = sqlsession.selectOne("pmhresns.getReportTotalCount1");
		return count;
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

	// DB에서 신고게시판의 검색결과가 포함된 목록을 가지고 온다(페이징처리)
	@Override
	public List<HashMap<String, String>> getReportPgSearch(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReportPgSearch", searchMap);
		return rvoList;
	}

	// DB에서 신고게시판의 목록을 가지고 온다(페이징처리)
	@Override
	public List<HashMap<String, String>> getReportPg(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReportPg", searchMap);
		return rvoList;
	}

	// 신고하는 메소드
	@Override
	public int insertReporting(HashMap<String, String> reportMap) {
		int n = sqlsession.insert("pmhresns.insertReporting", reportMap);
		return n;
	}
	
	// 이미 신고가 된 글인지 알아오는 메소드
	@Override
	public int checkPreReporting(HashMap<String, String> reportMap) {
		int n = sqlsession.selectOne("pmhresns.checkPreReporting", reportMap);
		return n;
	}


	////////////////////////////////////// 신고게시판 DAO 끝 //////////////////////////////////////////

	/////////////////////////////// 문의게시판 DAO 시작 ////////////////////////////////////////

	@Override
	public List<HashMap<String, String>> getHelpPgSearch(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> helpList = sqlsession.selectList("pmhresns.getHelpPgSearch", searchMap);
		return helpList;
	}

	@Override
	public List<HashMap<String, String>> getHelpPg(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> helpList = sqlsession.selectList("pmhresns.getHelpPg", searchMap);
		return helpList;
	}

	@Override
	public int getHelpTotalCount2(HashMap<String, String> searchMap) {
		int count = sqlsession.selectOne("pmhresns.getHelpTotalCount2", searchMap);
		return count;
	}

	@Override
	public int getHelpTotalCount1() {
		int count = sqlsession.selectOne("pmhresns.getHelpTotalCount1");
		return count;
	}

	@Override
	public int getAskGroupMaxno() {
		int n = sqlsession.selectOne("pmhresns.getAskGroupMaxno");
		return n;
	}

	@Override
	public int askWrite(HashMap<String, Object> helpMap) {
		int n = sqlsession.insert("pmhresns.askWrite", helpMap);
		return n;
	}

	@Override
	public int insertAskFile(HashMap<String, Object> helpMap) {
		int n = sqlsession.insert("pmhresns.insertAskFile", helpMap);
		return n;
	}

	@Override
	public int getAskSeq() {
		int n = sqlsession.selectOne("pmhresns.getAskSeq");
		return n;
	}

	@Override
	public AskVO getAskDetail(String seq) {
		AskVO avo = sqlsession.selectOne("pmhresns.getAskDetail", seq);
		return avo;
	}

	@Override
	public AimageVO getAskAimage(String seq) {
		AimageVO aivo = sqlsession.selectOne("pmhresns.getAskAimage", seq);
		return aivo;
	}

	@Override
	public String getLoginNameById(String fk_login_id) {
		String name = sqlsession.selectOne("pmhresns.getLoginNameById", fk_login_id);
		return name;
	}

	@Override
	public int updateHelpDelete(String seq) {
		int n = sqlsession.update("pmhresns.updateHelpDelete", seq);
		return n;
	}
	
	@Override
	public int askModify(HashMap<String, Object> helpMap) {
		int n = sqlsession.update("pmhresns.askModify", helpMap);
		return n;
	}

	@Override
	public int updateAskFile(HashMap<String, Object> helpMap) {
		int n = sqlsession.update("pmhresns.updateAskFile", helpMap);
		return n;
	}

	@Override
	public int deleteAskFile(HashMap<String, Object> helpMap) {
		int n = sqlsession.delete("pmhresns.deleteAskFile", helpMap);
		return n;
	}

	@Override
	public int selectAskFile(HashMap<String, Object> helpMap) {
		int count = sqlsession.selectOne("pmhresns.selectAskFile", helpMap);
		return count;
	}

	@Override
	public int getHelpTotalCountDelete2(HashMap<String, String> searchMap) {
		int count = sqlsession.selectOne("pmhresns.getHelpTotalCountDelete2", searchMap);
		return count;
	}

	@Override
	public int getHelpTotalCountDelete1() {
		int count = sqlsession.selectOne("pmhresns.getHelpTotalCountDelete1");
		return count;
	}

	/////////////////////////////// 문의게시판 DAO 끝 ////////////////////////////////////////

	/////////////////////////////// FAQ 게시판 DAO 시작 ////////////////////////////////////////

	@Override
	public List<FaqVO> getFaqListByInput(String searchInput) {
		 List<FaqVO> faqList = sqlsession.selectList("pmhresns.getFaqListByInput", searchInput);
		 return faqList;
	}

	@Override
	public List<FaqVO> getFaqListByBtn() {
		List<FaqVO> faqList = sqlsession.selectList("pmhresns.getFaqListByBtnAll");
		 return faqList;
	}

	@Override
	public List<FaqVO> getFaqListByBtn(String searchBtn) {
		List<FaqVO> faqList = sqlsession.selectList("pmhresns.getFaqListByBtn", searchBtn);
		 return faqList;
	}

	@Override
	public int insertFaq(HashMap<String, String> faqMap) {
		int n = sqlsession.insert("pmhresns.insertFaq", faqMap);
		return n;
	}

	@Override
	public List<FaqVO> getFaqList() {
		List<FaqVO> faqList = sqlsession.selectList("pmhresns.getFaqList");
		 return faqList;
	}

	@Override
	public int delSelectedFaq(List<String> faqchkList) {
		int n = sqlsession.update("pmhresns.delSelectedFaq", faqchkList);
		return n;
	}

	@Override
	public int actSelectedFaq(List<String> faqchkList) {
		int n = sqlsession.update("pmhresns.actSelectedFaq", faqchkList);
		return n;
	}

	@Override
	public int updateFaqModify(HashMap<String, String> faqMap) {
		int n = sqlsession.update("pmhresns.updateFaqModify", faqMap);
		return n;
	}

	@Override
	public FaqVO getFaqOne(String seq) {
		FaqVO fvo = sqlsession.selectOne("pmhresns.getFaqOne", seq);
		return fvo;
	}
	
	/////////////////////////////// FAQ 게시판 DAO 끝 ////////////////////////////////////////
	
	/////////////////////////////// 통계 DAO 시작 ///////////////////////////////////////////
	
	@Override
	public List<HashMap<String, String>> getAgelinePctAll() {
		List<HashMap<String, String>> agelinePctList = sqlsession.selectList("pmhresns.getAgelinePctAll"); 
		return agelinePctList;
	}

	@Override
	public List<HashMap<String, String>> getAgeDetail(String ageline) {
		List<HashMap<String, String>> agelineDetailList = sqlsession.selectList("pmhresns.getAgeDetail", ageline);
		return agelineDetailList;
	}

	@Override
	public List<HashMap<String, String>> getGenderInfo() {
		List<HashMap<String, String>> list = sqlsession.selectList("pmhresns.getGenderInfo");
		return list;
	}

	@Override
	public List<HashMap<String, String>> getBoardCountChartWeekInfo(String loginid) {
		List<HashMap<String, String>> list = sqlsession.selectList("pmhresns.getBoardCountChartWeekInfo", loginid);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getBoardCountChartPreWeekInfo(String loginid) {
		List<HashMap<String, String>> list = sqlsession.selectList("pmhresns.getBoardCountChartPreWeekInfo", loginid);
		return list;
	}

	
	/////////////////////////////// 통계 DAO 끝 ///////////////////////////////////////////
}
