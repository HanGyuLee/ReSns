package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pek.model.BimageVO;
import com.spring.pek.model.BoardDAO;
import com.spring.pek.model.HeartVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;

@Service
public class PekService implements InterPekService {

	@Autowired
	private BoardDAO dao;
	
	// 인기 리스트 보기
	@Override
	public List<HashMap<String, String>> getBoardList() {
		
		
		List<HashMap<String, String>> boardList = dao.getBoardList();
		
		
		return boardList;
	}

	// 한 사람의 별명과 프사 보기
	@Override
	public String showUser(String fk_login_id) {
		
		HashMap<String, String> userHashMap = dao.showUser(fk_login_id);
		
		JSONObject jsonObj = new JSONObject();
		
		if (!userHashMap.isEmpty()) {
			
			jsonObj.put("login_name", userHashMap.get("LOGIN_NAME"));
			jsonObj.put("uimg_profile_filename", userHashMap.get("UIMG_PROFILE_FILENAME"));
			
		}
		
		String str_user = jsonObj.toString();
		
		return str_user;
	}

	// 한 게시글의 덧글 보기
	@Override
	public String showRe(String seq_tbl_board) {
		
		List<HashMap<String, String>> reList = dao.showRe(seq_tbl_board);
		
		JSONArray jsonMap = new JSONArray();
		
		if (reList != null) {
			for(int i=0; i<reList.size(); i++) {
				JSONObject jsonObj = new JSONObject();
				HashMap<String, String> re = new HashMap<String, String>();
				
				re = reList.get(i);
				
				//System.out.println("bb "+re.get("RE_SEQ"));
				
				jsonObj.put("re_seq", re.get("RE_SEQ"));
				jsonObj.put("re_id", re.get("RE_ID"));
				jsonObj.put("re_content", re.get("RE_CONTENT"));
				jsonObj.put("re_date", re.get("RE_DATE"));
				jsonObj.put("re_status", re.get("RE_STATUS"));
				jsonObj.put("re_fk_seq", re.get("RE_FK_SEQ"));
				jsonObj.put("re_groupno", re.get("RE_GROUPNO"));
				jsonObj.put("re_depthno", re.get("RE_DEPTHNO"));
				jsonObj.put("login_name", re.get("LOGIN_NAME"));
				jsonObj.put("uimg_profile_filename", re.get("UIMG_PROFILE_FILENAME"));
				
				jsonMap.put(jsonObj);
			}
		}
		
		String str_reList = jsonMap.toString();
		
		return str_reList;
	}

	// 한 게시글의 태그 보기
	@Override
	public String showTag(String seq_tbl_board) {
		
		List<TagVO> tagList = dao.showTag(seq_tbl_board);
		
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

	// 한 게시글의 위치주소 보기
	@Override
	public String showLoc(String seq_tbl_board) {
		
		MapVO locvo = dao.showLoc(seq_tbl_board);
		
		JSONObject jsonObj = new JSONObject();
		
		if (locvo != null) {

			jsonObj.put("map_name", locvo.getMap_name());
			
		}
		
		String str_loc = jsonObj.toString();
		
		return str_loc;
	}

	// 좋아요 누르기
	@Override
	public int addHeart(HashMap<String, String> map) {
		
		int n = dao.addHeart(map);
		
		return n;
	}

	// 이미 좋아요 눌렀는지 확인하기
	@Override
	public int HeartedUser(HashMap<String, String> map) {
		
		int cnt = dao.HeartedUser(map);
		
		return cnt;
	}

	// 하트 아이콘 바꿔주기 위한 하트 여부 확인
	@Override
	public String heartCheck(HashMap<String, String> map) {
		
		JSONObject jsonObj = new JSONObject();
		
		HeartVO heartcheck = dao.heartCheck(map);
		
		if (heartcheck != null) {
	
			jsonObj.put("fk_login_id", heartcheck.getFk_login_id());
			jsonObj.put("fk_seq_tbl_board", heartcheck.getFk_seq_tbl_board());
			jsonObj.put("heart_getid", heartcheck.getHeart_getid());
			
		}
		
		String str_heartcheck = jsonObj.toString();
		
		return str_heartcheck;
	}

	
	// 하트 취소
	@Override
	public int deleteHeart(HashMap<String, String> map) {
		
		int n = dao.deleteHeart(map);
		
		return n;
	}

	
	// 하트 갯수 갱신하기
	@Override
	public String heartCounting(String seq_tbl_board) {
		
		int n = dao.heartCounting(seq_tbl_board);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("board_heart", n);
		
		String str_heartCounting = jsonObj.toString();
		
		return str_heartCounting;
	}

	
	// 댓글 쓰기
	@Override
	public int writeReply(HashMap<String, String> map) {
	
		int n = dao.writeReply(map);
		
		return n;
	}

	
	// 최대 groupno 구하기
	@Override
	public String maxGroupno() {
		
		String n = dao.maxGroupno();
		
		return n;
	}

	
	// 댓글 갯수 갱신하기
	@Override
	public String reCounting(String seq_tbl_board) {
		
		int n = dao.reCounting(seq_tbl_board);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("board_recnt", n);
		
		String str_reCounting = jsonObj.toString();
		
		return str_reCounting;
	}

	
	// 대댓글 쓰기
	@Override
	public int writeReRe(HashMap<String, String> map) {
		
		int n = dao.writeReRe(map);
		
		return n;
	}

	
	// 댓글 삭제
	@Override
	public int deleteReply(HashMap<String, String> map) {
		
		int n = dao.deleteReply(map);
		
		return n;
	}

	
	// 위치 정보 추가하기
	@Override
	public int addLoc(HashMap<String, String> map) {
		
		int result = dao.addLoc(map);
		
		return result;
	}

	
	// 글쓰기
	@Override
	public int addBoard(HashMap<String, String> map) {
		
		int result = dao.addBoard(map);
		
		return result;
	}

	
	// 방금 쓴 글번호 알기
	@Override
	public int maxSeq() {
		
		int maxSeq = dao.maxSeq();
		
		return maxSeq;
	}

	
	// 해시태그 넣기
	@Override
	public int addTag(HashMap<String, String> map) {
		
		int tagResult = dao.addTag(map);
		
		return tagResult;
	}
	
	

	// 사진 첨부
	@Override
	public void addBimage(HashMap<String, String> map) {
		
		dao.addBimage(map);
		
		
	}

	// 게시글(위치,태그,하트,덧글) 삭제
	@Override
	public int deleteAll(String seq_tbl_board) {
		
		int n = 0;
		
		try {
			
			n = dao.deleteAll(seq_tbl_board);
			
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return n;
	}

	
	// 지울 이미지 이름 알아오기
	@Override
	public String fileName(String seq_tbl_board) {
		
		String fileName = dao.fileName(seq_tbl_board);
		
		return fileName;
	}

	
	// 이미지 지우기
	@Override
	public void deleteImg(String seq_tbl_board) {
		
		dao.deleteImg(seq_tbl_board);
		
	}

	
	// 모든 태그 보기
	@Override
	public List<TagVO> showAllTag() {
		
		List<TagVO> tagList = dao.showAllTag();
		
		return tagList;
	}

}
