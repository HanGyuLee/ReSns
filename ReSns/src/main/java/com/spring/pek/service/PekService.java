package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
