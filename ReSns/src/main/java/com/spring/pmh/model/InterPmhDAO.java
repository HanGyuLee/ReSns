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
	
	int insertReporting(HashMap<String, String> reportMap); // 신고하는 메소드
	
	int checkPreReporting(HashMap<String, String> reportMap); // 이미 신고가 된 글인지 알아오는 메소드
	
	/////////////////////////////// 신고게시판 DAO 끝 ////////////////////////////////////////
	
	/////////////////////////////// 문의게시판 DAO 시작 ////////////////////////////////////////
	
	List<HashMap<String, String>> getHelpPgSearch(HashMap<String, String> searchMap); // DB에서 검색결과 있는 문의정보를 가져오는 메소드(페이징처리)

	List<HashMap<String, String>> getHelpPg(HashMap<String, String> searchMap); // DB에서 검색결과 문의정보를 가져오는 메소드(페이징처리)

	int getHelpTotalCount2(HashMap<String, String> searchMap); // 검색이 있는 게시물 총수 구하는 메소드

	int getHelpTotalCount1(); // 검색이 없는 게시물 총수 구하는 메소드

	int getAskGroupMaxno(); // 그룹번호가 있는 경우 그룹번호를 가지고 오는 메소드

	int askWrite(HashMap<String, Object> helpMap); // 글쓰기 하는 메소드

	int insertAskFile(HashMap<String, Object> helpMap); // 파일이 첨부된 경우 파일을 업로드하는 메소드

	int getAskSeq(); // 예상글번호 가져오기

	AskVO getAskDetail(String seq); // 상세정보 가져오기

	AimageVO getAskAimage(String seq); // 선택한 게시물의 첨부파일 가져오기

	String getLoginNameById(String fk_login_id); // 선택한 아이디에 해당하는 이름 가져오기

	int updateHelpDelete(String seq); // 선택한 게시물을 update 로 삭제하는 메소드

	int updateAskFile(HashMap<String, Object> helpMap); // 선택한 게시물을 수정하는 메소드

	int askModify(HashMap<String, Object> helpMap); // 선택하는 게시물의 첨부파일을 변경하는 메소드

	int deleteAskFile(HashMap<String, Object> helpMap); // 파일 삭제를 선택하는 경우 파일을 삭제하는 메소드

	int selectAskFile(HashMap<String, Object> helpMap); // update 문을 실행시키기 위해 해당하는 row 가 있는지 검사하는 메소드

	int getHelpTotalCountDelete2(HashMap<String, String> searchMap); // 검색결과 포함 삭제된 게시물이 몇 개 있는지 알아오는 메소드

	int getHelpTotalCountDelete1(); // 삭제된 게시물이 몇 개 있는지 알아오는 메소드

	/////////////////////////////// 문의게시판 DAO 끝 ////////////////////////////////////////
	
	/////////////////////////////// FAQ 게시판 DAO 시작 ////////////////////////////////////////
	List<FaqVO> getFaqListByInput(String searchInput); // 검색된 FAQ 리스트 가져오는 메소드

	List<FaqVO> getFaqListByBtn(); // 버튼으로 FAQ 리스트 전체를 가져오는 메소드

	List<FaqVO> getFaqListByBtn(String searchBtn); // 버튼으로 FAQ 리스트중 선택된 것만 가져오는 메소드

	int insertFaq(HashMap<String, String> faqMap); // FAQ를 입력하는 메소드

	List<FaqVO> getFaqList(); // FAQ 리스트 전체를 가져오는 메소드

	int delSelectedFaq(List<String> faqchkList); // FAQ 게시물 중 선택한 것을 삭제하는 메소드

	int actSelectedFaq(List<String> faqchkList); // FAQ 게시물 중 선택한 것을 활성화하는 메소드

	int updateFaqModify(HashMap<String, String> faqMap); // FAQ 게시물을 수정하는 메소드

	FaqVO getFaqOne(String seq); // FAQ 게시물 하나를 가져오는 메소드

	/////////////////////////////// FAQ 게시판 DAO 시작 ////////////////////////////////////////
	
	/////////////////////////////// 통계 DAO 시작 /////////////////////////////////////////
	
	List<HashMap<String, String>> getAgelinePctAll();

	List<HashMap<String, String>> getAgeDetail(String ageline);

	List<HashMap<String, String>> getGenderInfo();

	List<HashMap<String, String>> getBoardCountChartWeekInfo(String loginid);

	List<HashMap<String, String>> getBoardCountChartPreWeekInfo(String loginid);

	/////////////////////////////// 통계 DAO 끝 ///////////////////////////////////////////
	
	/////////////////////////////// 기타 DAO 시작 ////////////////////////////////////////
	
	int reportingReply(HashMap<String, String> reportMap);
	
	/////////////////////////////// 기타 DAO 끝 //////////////////////////////////////////
}
