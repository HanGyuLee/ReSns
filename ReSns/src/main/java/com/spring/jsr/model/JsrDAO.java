package com.spring.jsr.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pek.model.BoardVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;

//DAO선언---
//Repository 선언

@Repository
public class JsrDAO implements InterJsrDAO {
	
	//의존객체 주입(DI : Dependency Injection)
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
	//팔로우 리스트 가지고 오는 메소드
	@Override
	public List<HashMap<String, String>> getFollowList(HashMap<String, String> map) {
		List<HashMap<String, String>> followList = sqlsession.selectList("jsrresns.getFollowList",map);
		return followList;
	}

	
	//팔로워 리스트
	@Override
	public List<HashMap<String, String>> getFollowerList(HashMap<String, String> map) {
		List<HashMap<String, String>> followerList = sqlsession.selectList("jsrresns.getFollowerList",map);
		System.out.println("팔로워 리스트 넘어오나요1");
		return followerList;
	}



/*--------------------------------------------------------------------------------------------------------------------------*/
	
	//이미 팔로우 되어 있는지 확인
	@Override
	public int followCheck(HashMap<String, String> map) {
		int c = sqlsession.selectOne("jsrresns.followCheck",map);
		//팔로우 되어 있는 값이 있으면 1 리턴.
		return c;
	}
	
	
/*--------------------------------------------------------------------------------------------------------------------------*/
	
	//팔로우 하기
	@Override
	public int followAdd(HashMap<String, String> map) {
	 //System.out.println("로그인 아이디 확인::"+map.get("login_id"));
	 //System.out.println("팔로우 아이디 확인::"+map.get("follow_id"));
		int followAdd = sqlsession.insert("jsrresns.followAdd",map);
	 
		return followAdd;
	}

	//팔로우 후에 팔로우 수 팔로워 수 증가 시켜주기
	@Override
	public int followupdate(HashMap<String, String> map) {
		 int n = sqlsession.insert("jsrresns.followupdate",map);	
		return n;
	}

	@Override
	public int followerupdate(HashMap<String, String> map) {
		 int m = sqlsession.insert("jsrresns.followerupdate",map);
		return m;
	}

	
	//팔로우 시퀀스 알아오기
	@Override
	public String followSeqCheck(HashMap<String, String> map) {
		 String seq = sqlsession.selectOne("jsrresns.followSeqCheck",map);
		return seq;
	}
	
	
	//팔로우 후 알람테이블 인서트
	@Override
	public int followAlaram(HashMap<String, String> map) {
		int a = sqlsession.insert("jsrresns.followalaram",map);
		return a;
	}
/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//언팔하기
	@Override
	public int unFollow(HashMap<String, String> map) {
		int unfollow = sqlsession.delete("jsrresns.unFollow",map);
		return unfollow;
	}

	//언팔 후 팔로우, 팔로워 수 감소
	@Override
	public int unfollowupdate(HashMap<String, String> map) {
		 int n = sqlsession.insert("jsrresns.unfollowupdate",map);	
		return n;
	}

	@Override
	public int unfollowerupdate(HashMap<String, String> map) {
		 int m = sqlsession.insert("jsrresns.unfollowerupdate",map);
		return m;
	}


	/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//내 팔로우 보드 리스트 가져오기
	@Override
	public List<BoardVO> getFollowBoardView(HashMap<String, String> map) {
		List<BoardVO> getFollowBoardView = sqlsession.selectList("jsrresns.FollowBoardView",map);
		return getFollowBoardView;
	}



	//내 팔로우 댓글 리스트 가져오기2
	@Override
	public List<HashMap<String, String>> followRe(String seq_tbl_board) {
		 List<HashMap<String, String>> followRe = sqlsession.selectList("jsrresns.followreList",seq_tbl_board);
		return followRe;
	}


	
	/*--------------------------------------------------------------------------------------------------------------------------*/	

	//내 팔로우 내용 불러오기
	@Override
	public String getConVeiw(String seq_tbl_board) {
		 String getConVeiw = sqlsession.selectOne("jsrresns.getConVeiw",seq_tbl_board);
		return getConVeiw;
	}


	//태그 가져오기
	@Override
	public List<TagVO> getFollowTag(String seq_tbl_board) {
		List<TagVO> getFollowTag =  sqlsession.selectList("jsrresns.getTag2",seq_tbl_board);
		return getFollowTag;
	}


	/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//백문백답 작성하기
	@Override
	public int queAdd(QuestionBoardVO qboardvo) {
		int n = sqlsession.insert("jsrresns.queAddEnd",qboardvo);
		return n;
	}

	//질문 작성 위해 시퀀스 알아오기
	
	@Override
	public String queseqGet(QuestionBoardVO qboardvo) {
		String seq_tbl_q = sqlsession.selectOne("jsrresns.seqGet",qboardvo);
		return seq_tbl_q;
	}

	//알람테이블에 인서트
	@Override
	public int queAlaram(HashMap<String,String> map) {
		int a = sqlsession.insert("jsrresns.questionAlaram",map);
		return a;
	}
	
	
	
	
	//백문백답 리스트 작성하기
	@Override
	public List<QuestionBoardVO> getQeList(HashMap<String, String> map) {
		List <QuestionBoardVO> list = sqlsession.selectList("jsrresns.getQuList",map);
		return list;
	}

	//검색어가 있는 백문백답 리스트 가져오기
	@Override
	public List<QuestionBoardVO> getQeList2(HashMap<String, String> map) {
		List <QuestionBoardVO> list = sqlsession.selectList("jsrresns.getQuList2",map);
		return list;
	}
	
	//검색어 없는 토탈 카운트
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("jsrresns.getTotalCount",map);
		return count;
	}


	//검색어 있는 토탈 카운트
	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = sqlsession.selectOne("jsrresns.getTotalCount2",map);
		return count;
	}



	
	
	
	//백문백답 답변 가져오기
	@Override
	public QuestionBoardReplyVO getRp(String seq_tbl_q) {
		 QuestionBoardReplyVO list = sqlsession.selectOne("jsrresns.getRp",seq_tbl_q); 
		return list;
	}

	//해당하는 질문 내용 가져오기
	@Override
	public QuestionBoardVO getQView(String seq_tbl_q) {
		QuestionBoardVO list = sqlsession.selectOne("jsrresns.getQView",seq_tbl_q);
		return list;
	}



	

	//답변달기
	@Override
	public int QboardRe(QuestionBoardReplyVO qbrvo) {
		int n = sqlsession.insert("jsrresns.QboardRe",qbrvo);
		return n;
	}
	

	//질문상태값 변경
	@Override
	public int Qstaup(String fk_seq_tbl_q) {
		int m = sqlsession.update("jsrresns.Qstaup",fk_seq_tbl_q);
		return m;
	}
	
	//답변 알람주귀
	@Override
	public int Qrealaram(HashMap<String,String> map) {
		int a = sqlsession.insert("jsrresns.quesReAlaram",map);
		return a;
	}
	
	
	
	
	

	//백문백답 질문 삭제
	@Override
	public int qdel(String seq_tbq_q) {
		int n = sqlsession.delete("jsrresns.qdel",seq_tbq_q);
		return n;
	}


	//답변삭제하기
	@Override
	public int adal(String fk_seq_tbl_q) {
		int n = sqlsession.delete("jsrresns.adel",fk_seq_tbl_q);
		return n;
	}

	//답변 삭제후 질문 상태값 변경해주기
	@Override
	public int adalpUp(String fk_seq_tbl_q) {
		int m = sqlsession.update("jsrresns.adelQstaup",fk_seq_tbl_q);
		return m;
	}

	//자동완성 백문백답게시판
	@Override
	public List<String> wordQSearch(HashMap<String, String> map) {
		//System.out.println("qsearch::"+map.get("qsearch"));
		//System.out.println("fk_login_id::"+map.get("fk_login_id"));
		
		List<String> list =sqlsession.selectList("jsrresns.qsearch",map);
		return list;
	}

//-----------------------------------------------------------------------------------------------------------------------------------------------------
	//팔로우 하트 체크하기
	@Override
	public int followheartCk(HashMap<String,Object> map2) {
		int n =  sqlsession.selectOne("jsrresns.followheartck",map2);
		return n;
	}


	//팔로우 메인 토탈 카운트 가져오기
	@Override
	public int getFollowMainTotalCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("jsrresns.getFollowMainTotalCount",map);
		return count;
	}


	
	//차단체크
	@Override
	public int followblock(HashMap<String,String> map) {
		int n =  sqlsession.selectOne("jsrresns.followblock",map);
		return n;
	}


















	
	
	
}
