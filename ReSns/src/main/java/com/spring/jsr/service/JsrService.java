package com.spring.jsr.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.hgl.model.InterHglDAO;
import com.spring.jsr.model.InterJsrDAO;
import com.spring.jsr.model.QuestionBoardReplyVO;
import com.spring.jsr.model.QuestionBoardVO;
import com.spring.pek.model.BoardDAO;
import com.spring.pek.model.BoardVO;

import com.spring.pek.model.TagVO;


//service  선언
@Service
public class JsrService implements InterJsrService {
	
	//의존객체 주입
	@Autowired
	private InterJsrDAO jdao;
	private InterHglDAO hdao;
	
	
	//팔로우 리스트 가져오기
	@Override
	public List<HashMap<String, String>> followList(HashMap<String, String> map) {
		List<HashMap<String, String>> followList = jdao.getFollowList(map);
		return followList;
	}


	//팔로워 리스트
	@Override
	public List<HashMap<String, String>> followerList(HashMap<String, String> map) {
		List<HashMap<String, String>> followerList = jdao.getFollowerList(map);
		//System.out.println("팔로워 리스트 넘어오나요2");
		return followerList;
	}

	
	
	

	//팔로우 하기
	@Override
	//팔로우, 팔로워 업데이트 해주기 위해
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int followAdd(HashMap<String, String> map) throws Throwable{
		
		int followCheck = 0; //중복팔롱 확인
		//int followCheck2= 0; //내가 나를 팔로우 못하게 막기
		int followAddlist =0; //팔로우 하기
		String followSeqCheck = "";//팔로우 시퀀스 알아오기
		int n = 0;//팔로우 값 1 증가
		int m = 0;//팔로워 값 1 증가
		int followAddEnd = 0; //팔로우 완료
		int followAlaram = 0;
		
		
		//내가 나를 팔로우 하는 것을 막기
		String login_id = map.get("login_id");
		String follow_id = map.get("follow_id");
		
		if (follow_id.equalsIgnoreCase(login_id)){			
			followAddEnd = -4; 
		}
			

		
		else //내가 나를 팔로우 하고 있지 않은 경우
		{	

			
		//이미 팔로우가 되어 있는지 확인
		followCheck = jdao.followCheck(map);
			
		
		if (followCheck == 1){
			//이미 팔로우를 한 상태이다.
			followAddEnd = -3;		
		}//이미 팔로우 한 경우 -3을 리턴!
		
		
	
	else if (followCheck == 0){
			
			followAddlist = jdao.followAdd(map);
			//팔로우 하기. 팔로우에 성공하면 0보다 커야함.
				//팔로우, 팔로워 값 증가하기
				n = jdao.followupdate(map);//내 프로필 팔로우 수 증가
				m = jdao.followerupdate(map);//상대방 프로필 팔로워 수 증가

				followSeqCheck = jdao.followSeqCheck(map);
				if (followSeqCheck !=null){
		         map.put("follow_seq", followSeqCheck);
					followAlaram = jdao.followAlaram(map);//알아온 시퀀스를 알람테이블에 인서트
				}
	}//else if 끝. 팔로우 한 경우가 아니라면 끝.
							
		if( ( followAddlist > 0 && n >0 && m>0 && followSeqCheck != null && followAlaram >0 ) ||
				( followAddlist == 1 && n == 1 && m == 1 && followSeqCheck != null && followAlaram ==1) )
		{followAddEnd = 1; }
		
	}//내가 팔로우하는 경우가 아니라면 끝

		return followAddEnd;
	}


	//언팔로우하기
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int unFollow(HashMap<String, String> map) throws Throwable{
		
		int followCheck = 0; //팔로 상태 확인
		int unFollowAdd =0; //언팔로우 하기
		int n = 0;//팔로우 값 1 감소
		int m = 0;//팔로워 값 1 감소
		int unFollowAddEnd = 0; //언팔로우 완료
		
		
		followCheck = jdao.followCheck(map);
		
		
		if (followCheck == 0){
			//이미 언팔로우를 한 상태이다. 팔로우 상태가 아니다.
			unFollowAddEnd = -3;		
		}
		
		
		else if (followCheck == 1){ //팔로우 상태일 때
			unFollowAdd = jdao.unFollow(map);
			//언팔로우 하기
			//팔로우, 팔로워 값 증가하기
			n = jdao.unfollowupdate(map);
			m = jdao.unfollowerupdate(map);	
			//감소 완료 했다면 언 팔로우 최종 승인해주기.
			
		if ( (unFollowAdd >0 && n>0 && m>0) || (unFollowAdd ==1 && n==1 && m==1) ){ 
			unFollowAddEnd = 1;}
		
		else{
			unFollowAddEnd =1;
			
		}
			
			
		}
		
		return unFollowAddEnd;
	}

	/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//팔로우 하는 사람 게시글 가지고 오기
	@Override
	public List<BoardVO> followboard(HashMap<String, String> map) {
		List<BoardVO> followboard = null;
	
		List<HashMap<String, String>> followList = jdao.getFollowList(map);
	
		
	
		if(followList.isEmpty()){//팔로우가 없을 때
		
			followboard = null;
			
		}
		
		else if(!(followList.isEmpty()) ){//팔로우가 있으면 게시글이 있는지 확인
			followboard =  jdao.getFollowBoardView(map);
/*			
			if(followboard != null && followboard.size()>0){
				for(BoardVO bvo:followboard){
					String board_content = bvo.getBoard_content();
					board_content = board_content.replaceAll("\r\n", "<br/>");
					bvo.setBoard_content(board_content);
				}
			
			}*/
		
				}// 


		
		return followboard;
	}

	

	//팔로우 글 댓글확인 하기 위한 
	@Override
	public String followre(String seq_tbl_board) {
	//System.out.println("서비스단!");
	//List<ReVO> reList = jdao.followreList(seq_tbl_board);

	List<HashMap<String,String>> resultMap = jdao.followRe(seq_tbl_board);
	//System.out.println("1에서resultMap::"+resultMap);
		JSONArray jsonMap = new JSONArray();
		
		
		if (resultMap != null) {
			for(HashMap<String, String> re : resultMap) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("re_seq", re.get("re_seq"));
				jsonObj.put("seq_tbl_board", re.get("seq_tbl_board"));
				jsonObj.put("re_id", re.get("re_id"));
				jsonObj.put("re_content", re.get("re_content"));
				jsonObj.put("re_date", re.get("re_date"));
				jsonObj.put("re_status", re.get("re_status"));
				jsonObj.put("re_fk_seq", re.get("re_fk_seq"));
				jsonObj.put("re_groupno", re.get("re_groupno"));
				jsonObj.put("re_depthno", re.get("re_depthno"));
				jsonObj.put("login_name", re.get("login_name"));
				jsonObj.put("uimg_profile_filename", re.get("uimg_profile_filename"));
	
				//System.out.println("re.getRe_content()확인::"+re);
				
				jsonMap.put(jsonObj);
			}
		}
		
		String str_reList = jsonMap.toString();
		
		return str_reList;
	}

	@Override
	public String followre2(HashMap<String, String> map) {
		List<HashMap<String,String>> resultMap = jdao.followRe2(map);
		//System.out.println("2에서resultMap::"+resultMap);
		JSONArray jsonMap = new JSONArray();
		
		
		if (resultMap != null) {
			for(HashMap<String, String> re : resultMap) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("re_seq", re.get("re_seq"));
				jsonObj.put("seq_tbl_board", re.get("seq_tbl_board"));
				jsonObj.put("re_id", re.get("re_id"));
				jsonObj.put("re_content", re.get("re_content"));
				jsonObj.put("re_date", re.get("re_date"));
				jsonObj.put("re_status", re.get("re_status"));
				jsonObj.put("re_fk_seq", re.get("re_fk_seq"));
				jsonObj.put("re_groupno", re.get("re_groupno"));
				jsonObj.put("re_depthno", re.get("re_depthno"));
				jsonObj.put("login_name", re.get("login_name"));
				jsonObj.put("uimg_profile_filename", re.get("uimg_profile_filename"));
	
				//System.out.println("re.getRe_content()확인::"+re);
				
				jsonMap.put(jsonObj);
			}
		}
		
		String str_reList = jsonMap.toString();
		return str_reList;
	}

	
	
	
	//팔로우 댓글 카운트  가져오기
	@Override
	public int folllowReCount(String seq_tbl_board) {
		int n = jdao.ReGetCount(seq_tbl_board);
		return n;
	}
	
	
	

	//태그 가져오기
	@Override
	public String followTag(String seq_tbl_board) {
		
		List<TagVO> tagList = null;
		

		tagList = jdao.getFollowTag(seq_tbl_board);
	
	JSONArray jsonMap = new JSONArray();
		
		if (tagList != null) {
			for (TagVO tag : tagList) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("seq_tbl_tag", tag.getSeq_tbl_tag());
				jsonObj.put("tag_content", tag.getTag_content());
				
				jsonMap.put(jsonObj);
				
			}
		}
		
		String str_tagList = jsonMap.toString();
		
		
		return str_tagList;
	}
	
	
	//내용과 가져오기
	@Override
	public String followCon(String seq_tbl_board) {
		
		
		String boardCon = "";
		
		boardCon = jdao.getConVeiw(seq_tbl_board);
	
	
		JSONObject jsonObj = new JSONObject();

		jsonObj.put("content", boardCon);

		String str_jsonMap = jsonObj.toString();
		
	
		return str_jsonMap;
	}
	
	
	
	@Override
	public int getFollowMainTotalCount(HashMap<String, String> map) {
		int count = jdao.getFollowMainTotalCount(map);
		return count;
	}

	
	
	/*--------------------------------------------------------------------------------------------------------------------------*/	

	
	
	//백문백답 작성하기
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int queAdd(QuestionBoardVO qboardvo) throws Throwable{

		int n = 0;
		int m = 0;
		String seq_tbl_q = "";
		int a = 0;
		
		m= jdao.queAdd(qboardvo);
		
		seq_tbl_q = jdao.queseqGet(qboardvo);
		
		
		if (seq_tbl_q !=null){
			//System.out.println("seq_tbl_q확인3::"+seq_tbl_q);
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("q_askid",qboardvo.getQ_askid());
			map.put("fk_login_id", qboardvo.getFk_login_id());
			map.put("q_content", qboardvo.getQ_content());
			map.put("seq_tbl_q", seq_tbl_q);
			
		a = jdao.queAlaram(map);
		}
		
		
		if( (m>0 && seq_tbl_q !=null && a >0) ||  (m==1 && seq_tbl_q !=null && a ==1) ){
			
			n=1;//모두 성공하면 1값을 리턴
		}
		
		
		
		
		return n;
	}
	
	
	
	
	
	

	//백문백답 리스트 불러오기
	@Override
	public List<QuestionBoardVO> qeBoardList(HashMap<String, String> map) {
		
		List<QuestionBoardVO> list = jdao.getQeList(map);
		return list;
	}
	
	
	//검색어가 있는 백문백답 리스트 가져오기
	@Override
	public List<QuestionBoardVO> qeBoardList2(HashMap<String, String> map) {
		 List<QuestionBoardVO> list = jdao.getQeList2(map);
		return list;
	}
	
	
	//검색어 없는 토탈 카운트
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = jdao.getTotalCount(map);
		return count;
	}


	//검색어 있는 토탈 카운트
	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = jdao.getTotalCount2(map);
		return count;
	}



	
	
	
	
	

	//백문백답 답변 가져오기
	@Override
	public HashMap<String,String> getReply(String seq_tbl_q) {
		HashMap<String,String> list =  jdao.getRp(seq_tbl_q);
		return list;
	}

	//해당하는 질문내용 가져오기
	@Override
	public QuestionBoardVO getQView(String seq_tbl_q) {
		QuestionBoardVO list = jdao.getQView(seq_tbl_q);
		return list;
	}


	
	//답변 작성
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int QboardRe(QuestionBoardReplyVO qbrvo, String q_askid) throws Throwable {
		int reEnd = 0; //답변 최종등록 상태
		int m = 0;//답변 작성
		int c =0;// 질문 상태값 변경
		int alaram=0;//알람 주기
		
	    m = jdao.QboardRe(qbrvo);
		
		String Fk_seq_tbl_q = qbrvo.getFk_seq_tbl_q();
		
		c= jdao.Qstaup(Fk_seq_tbl_q);//질문 상태값 변경
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("q_askid",q_askid);
			map.put("fk_login_id", qbrvo.getFk_login_id());
			map.put("fk_seq_tbl_q", Fk_seq_tbl_q);
		
			alaram =  jdao.Qrealaram(map);
		
		
		if( (m >0 && Fk_seq_tbl_q !=null && c >0 && alaram >0) || 
				(m  ==1 && Fk_seq_tbl_q !=null && c == 1 && alaram ==1)   ){
			reEnd = 1;		
		}
		
		else{
			reEnd=0;
		}
		
		
		return reEnd;
	}


	//질문삭제하기
	@Override
	public int qdel(String seq_tbq_q)  {
		int n = jdao.qdel(seq_tbq_q);
		
		return n;
	}


	//답변삭제하기
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int qreplyDel(String fk_seq_tbl_q)throws Throwable  {
	
		int n=0;//답변삭제
		int m=0;//답변 삭제후 상태값 변경
		int nm=0;//답변 삭제 최종
		
		n = jdao.adal(fk_seq_tbl_q);
		
		
		m = jdao.adalpUp(fk_seq_tbl_q);	
		
		if ( (n>0 && m>0) || (n==1 && m==1) ){
			nm=1;
		}

		else{
			nm=-3;
		}
		
		
		return nm;
	}


	//백문백답 자동검색어 
	@Override
	public String wordQSearch(HashMap<String, String> map) {
		List<String> wordList = jdao.wordQSearch(map);
		
		JSONArray jsonMap = new JSONArray();
		if (wordList != null) {
			for(String word : wordList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("word", word);
				
				jsonMap.put(jsonObj);
			}
		}
		
		String str_jsonMap = jsonMap.toString();

		
		return str_jsonMap;
	}


	
	/*--------------------------------------------------------------------------------------------------------------------------*/	
	
	//차단당했는지 알아오기
	@Override
	public int followblock(HashMap<String,String> map) {
		int n =0;//접속한 유저가 방문한 해당 회원에게 차단당했는가 체크
		int m = 0;//접속한 유저가 방문한 해당 회원을 차단했는가 체크
		int ckEnd = 0;//체크 확인
		
		n = jdao.followblock(map);	// 접속한 유저 login_id가  해당 페이지의 fk_login_id에게 차단 당했는가?
		//이때 map에는 login_id에 login_id가 들어가서 block_id에 매칭되어 블락당한 아이디에 존재하는지 확인된다.
		
		System.out.println("서비스:n"+n);
	
		
		HashMap<String,String> map2 = new HashMap<String,String>();
		//접속한 유저 login_user를 fk_login_id에 넣어주고, 접속하려는 해당 회원의 페이지를 block_id에 담아준다
		String fk_login_id = map.get("login_id");
		String block_id = map.get("fk_login_id");
		System.out.println("서비스단 블락:"+block_id);
		System.out.println("서비스단 내 아이디"+fk_login_id);
		
		//쿼리문 block_id에 접속하고자 하는 상대 페이지 fk_login_id를 넣어주어야 하니까, 
		map2.put("login_id", block_id);
		//접속월 원하는 내가 fk_login_id에 들어가면 된다. 왜냐하면 쿼리문에서 fk_login_id는 블락을 신청한 사람이니까.
		map2.put("fk_login_id", fk_login_id);
		
		m = jdao.followblock(map2);
		System.out.println("서비스:m"+m);
/*		해당 메소드는 내가 차단당했는지를 확인하는 쿼리문이므로 잘 보고 변수를 바꿔 select 돼야 한다.
		select count(*)
		from tbl_block
		where fk_login_id = #{fk_login_id} and block_id = #{login_id}
		*/
		
		System.out.println("서비스:ckEnd"+ckEnd);
		if(n==1 || m==1){
			ckEnd = 1;
		}
		
		else {
			ckEnd = 0;
		}
		
		
		
		return ckEnd;
	}


	
	//유저 차단 하기!

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int blockAdd(HashMap<String, String> map) throws Throwable{
		
		/*
		 리턴 값 정리
		 
		 -1 : 이미 차단 되어 있는 상태
		 0 : 차단 실패
		 1 : 차단성공
		 
		 
		 */	

		int blockCk = 0;//블락체크
		
		

		int followCk = 0;//팔로우 체크
		int downfollow1 = 0;//내가 팔로우 하고 있는 사람이라면 내 팔로우 값에서 팔로우 다운 시키기
		int downfollower1 = 0;//내가 팔로우 하고 있던 사람이라면 상대  팔로워 다운 시키기
		int unfollow=0;//언팔로우 시키기
		
		
		int followerCk = 0;//나를 팔로우 하고 있는지 확인
		int block_id_unfollow = 0;//나를 팔로우 하고 있는 경우 언팔시키기
		int downfollow2 = 0;//나를 팔로우 하고 있는 사람이라면 상대 팔로우 값에서 팔로우 다운 시키기
		int downfollower2 = 0;//나를 팔로우 하고 있던 사람이라면 내  팔로워 다운 시키기
		
		
		int blockAdd = 0;
		int blockAddEnd = 0;//최종블락
		
		
		//현재 내가 팔로우 한 상태인지 체크하기
		followCk = jdao.followCheck(map);
		
		
		
		
		//나를 팔로우 하고 있는지 확인
		String follower_id =map.get("block_id");
				map.put("follower_id", follower_id);
		followerCk =  jdao.followerCheck(map);
		
		
	
		
		//이미 블락되었는지 확인하기
		blockCk = jdao.followblock(map);	
		
		if(blockCk == 1){
			blockAddEnd = -1; //이미 차단 테이블에 등록되어 있다.
		}
		

		
		if(blockCk ==0){//아직 차단하지 않았을 때
		
			
			//내가 팔로우한 상태이고, 나를 팔로우 하지 않았고, 
			if(followCk == 1){
				unfollow = jdao.unFollow(map);//언팔로우 하기
				
				//팔로우, 팔로워 값 감소하기
				downfollow1 = jdao.unfollowupdate(map);
				downfollower1 = jdao.unfollowerupdate(map);
				
				
		
			}

			//상대도 나를 팔로우 했을 때 언팔
			if(followerCk ==1){
				block_id_unfollow = 0;
				HashMap<String,String> map2 = new HashMap<String,String>();
				String login_id = map.get("login_id");//로그인한 내 아이디를 가지고 온다.
				String block_id = map.get("block_id");//차단시키면서 언팔시킬 상대 아이디를 가지고 온다.
				
				map2.put("follow_id", login_id); //나를 언팔 시킬 거니까 팔로우 아이디에 로그인한 내 아이디
				map2.put("login_id", block_id);// 로그인 아이디에 나를 팔로우한 상대 아이디를 넣어준다.
				
				block_id_unfollow = jdao.unFollow(map2);
				
				downfollow2 = jdao.unfollowupdate(map2);
				downfollower2 = jdao.unfollowerupdate(map2);

				
			}
			
			//차단 테이블에 인서트 하기
			blockAdd =  jdao.followblockAdd(map);
		
			
			if(blockAdd>0 || blockAdd==1){
				
				blockAddEnd = 1; //내가 팔로우 한 상태에서 차단성공
			}	
			
		}//팔로우가 되어 있다면
		
		
		return blockAddEnd;
	}


	//블락취소하기
	@Override
	public int blockDel(HashMap<String, String> map) {
		int n = jdao.blockDel(map);
		return n;
	}


	//내 차단 리스트 가져오기
	@Override
	public List<HashMap<String, String>> myBlockList(String login_id) {
		List<HashMap<String, String>> myBlockList = jdao.myBlockList(login_id);
		return myBlockList;
	}


	//이름 알아오기
	@Override
	public String getName(String q_fk_login_id) {	
		String getName = jdao.getUsername(q_fk_login_id);
		System.out.println("서비스단!!"+getName);
		return getName;
	}

	//알람용 글 한개보기
	@Override
	public HashMap<String,Object> getAlarmBoard(HashMap<String, String> map) {
		HashMap<String,Object> getAlarmBoard = jdao.getAlarmBoard(map);
		return getAlarmBoard;
	}





	
	
	
}//end of service
