package com.spring.jsr.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.jsr.model.InterJsrDAO;
import com.spring.jsr.model.QuestionBoardReplyVO;
import com.spring.jsr.model.QuestionBoardVO;
import com.spring.pek.model.BoardDAO;
import com.spring.pek.model.BoardVO;
import com.spring.pek.model.HeartVO;
import com.spring.pek.model.TagVO;


//service  선언
@Service
public class JsrService implements InterJsrService {
	
	//의존객체 주입
	@Autowired
	private InterJsrDAO jdao;
	private BoardDAO jbdao;
	
	
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
		int followCheck2= 0; //내가 나를 팔로우 못하게 막기
		int followAddlist =0; //팔로우 하기
		int n = 0;//팔로우 값 1 증가
		int m = 0;//팔로워 값 1 증가
		int followAdd = 0; //팔로우 완료
		
		
		//내가 나를 팔로우 하는 것을 막기
		String login_id = map.get("login_id");
		String follow_id = map.get("follow_id");
		
		if (follow_id.equalsIgnoreCase(login_id)){			
			followAdd = -4; 
		}
			
		//이미 팔로우가 되어 있는지 확인
		else 
		{	
		followCheck = jdao.followCheck(map);
		
		if (followCheck == 1){
			//이미 팔로우를 한 상태이다.
			followAdd = -3;		
		}

		else if (followCheck == 0){
			followAddlist = jdao.followAdd(map);
			//팔로우 하기

			if(followAddlist > 0){
				//팔로우, 팔로워 값 증가하기
				n = jdao.followupdate(map);
				m = jdao.followerupdate(map);	

				int nm = n+m;

				if (nm >1){
					//증가 완료 했다면 팔로우 최종 승인해주기.
					followAdd = 1;
				}//end of if nm>1		

			}//end of followAddlist > 0 팔로우 추가 완료

		}//end of else if followCheck ==0
			
		
		}
		return followAdd;
	}


	//언팔로우하기
	@Override
	public int unFollow(HashMap<String, String> map) {
		
		int followCheck = 0; //팔로 상태 확인
		int unFollowAdd =0; //언팔로우 하기
		int n = 0;//팔로우 값 1 감소
		int m = 0;//팔로워 값 1 감소
		int unFollowAddEnd = 0; //언팔로우 완료
		
		
		followCheck = jdao.followCheck(map);
		
		
		if (followCheck == 0){
			//이미 팔로우를 한 상태이다.
			unFollowAddEnd = -3;		
		}
		
		else if (followCheck == 1){
			unFollowAdd = jdao.unFollow(map);
			//언팔로우 하기

			if(unFollowAdd > 0){
				//팔로우, 팔로워 값 증가하기
				n = jdao.unfollowupdate(map);
				m = jdao.unfollowerupdate(map);	

				int nm = n+m;

				if (nm >1){
					//증가 완료 했다면 팔로우 최종 승인해주기.
					unFollowAddEnd = 1;
				}//end of if nm>1		

			}//end of followAddlist > 0 팔로우 추가 완료

		}//end of else if followCheck ==0
		
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
		
				}// 팔로우 보드가 null이 아니라면, 하트수 확인을 한다.


		
		return followboard;
	}

	

	//팔로우 하는 사람 게시글 가지고 오기
	@Override
	public List<HashMap<String,Object>> followboard2(HashMap<String, String> map) {

		List<BoardVO> followboard = null;
		List<Integer> numlist = new ArrayList<Integer>();
		List<HashMap<String,Object>> reslutMap = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object>map3 = new HashMap<String,Object>();
		
		
		List<HashMap<String, String>> followList = jdao.getFollowList(map);
	
		
	
		if(followList.isEmpty()){//팔로우가 없을 때
		
			followboard = null;
			
		}
		
		else if(!(followList.isEmpty()) ){//팔로우가 있으면 게시글이 있는지 확인
			//followboard =  jdao.getFollowBoardView(map);//게시글이 있는지 확인
			List<HashMap<String, Object>> followboard2 =  jdao.getFollowBoardView2(map);
			
			
			if(followboard2 != null){	
				
				for(HashMap<String, Object> vo : followboard2){
					HashMap<String,Object> map2 = new HashMap<String,Object>();
					map2.put("seq_tbl_board", vo.get("seq_tbl_board"));
					map2.put("login_id", map.get("login_id"));
					
					int heartck = jdao.followheartCk(map2);
					System.out.println("heartck"+heartck);
					
					
					
					map3.put("heartck", heartck);
					//map3.put("followboard2", followboard2);
					map3.put("seq_tbl_board", vo.get("seq_tbl_board"));
					map3.put("follow_name", vo.get("follow_name"));
					map3.put("follow_id", vo.get("follow_id"));
					map3.put("board_heart", vo.get("board_heart"));
					map3.put("board_recnt", vo.get("board_recnt"));
					map3.put("board_status", vo.get("board_status"));
					//System.out.println("map3들어왕 ㅠㅠ::"+map3);
					numlist.add(heartck);
					reslutMap.add(map3);
		
				}// 팔로우 보드가 null이 아니라면, 하트수 확인을 한다.
				System.out.println("하핳하핳하핳"+numlist);
				//reslutMap.add(map3);
				
				//System.out.println("map3::"+map3);
				System.out.println("reslutMap확인얌얌><::"+reslutMap);
				
				
				
			}
		
			
			
		}

		
		return reslutMap;
	}

	
	
	
	
	
	

	//팔로우 글 댓글확인 하기 위한 
	@Override
	public String followre(String seq_tbl_board) {
	//System.out.println("서비스단!");
	//List<ReVO> reList = jdao.followreList(seq_tbl_board);

	List<HashMap<String,String>> resultMap = jdao.followRe(seq_tbl_board);
	
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
	
	
	
	
	
	/*--------------------------------------------------------------------------------------------------------------------------*/	

	//백문백답 작성하기
	@Override
	public int queAdd(QuestionBoardVO qboardvo) {

		int n = jdao.queAdd(qboardvo);
		
		
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
	public QuestionBoardReplyVO getReply(String seq_tbl_q) {
		QuestionBoardReplyVO list =  jdao.getRp(seq_tbl_q);
		return list;
	}

	//해당하는 질문내용 가져오기
	@Override
	public QuestionBoardVO getQView(String seq_tbl_q) {
		QuestionBoardVO list = jdao.getQView(seq_tbl_q);
		return list;
	}


	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int QboardRe(QuestionBoardReplyVO qbrvo) throws Throwable {
		int a = 0;
		int n = 0;
		int c =0;
		
	    int m = jdao.QboardRe(qbrvo);
		if(m == 1){
		String Fk_seq_tbl_q = qbrvo.getFk_seq_tbl_q();
		c= jdao.Qstaup(Fk_seq_tbl_q);		
		n= m+c;
		if(n==2){
		a=1;	
		}	
		
		}
		
		else{
		a=0;
		}
		
		
		return a;
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
	
		int n=0;
		int m=0;
		int nm=0;
		n = jdao.adal(fk_seq_tbl_q);
		
		if(n == 1){
		m = jdao.adalpUp(fk_seq_tbl_q);	
		
		if (m == 1){
			
		nm =1;	
		}
		
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




	

	
	
	
	
}//end of service
