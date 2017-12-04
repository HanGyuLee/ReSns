package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pek.model.BoardDAO;
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
	public HashMap<String, String> showUser(String fk_login_id) {
		
		HashMap<String, String> userHashMap = dao.showUser(fk_login_id);
		
		return userHashMap;
	}

	// 한 게시글의 덧글 보기
	@Override
	public String showRe(String seq_tbl_board) {
		
		List<ReVO> reList = dao.showRe(seq_tbl_board);
		
		JSONArray jsonMap = new JSONArray();
		
		if (reList != null) {
			for(ReVO re : reList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("re", re.getRe_content());
				
				jsonMap.put(jsonObj);
			}
		}
		
		String str_reList = jsonMap.toString();
		
		return str_reList;
	}

	// 한 게시글의 태그 보기
	@Override
	public List<TagVO> showTag(String seq_tbl_board) {
		
		List<TagVO> tagList = dao.showTag(seq_tbl_board);
		
		return tagList;
	}

	// 한 게시글의 위치주소 보기
	@Override
	public MapVO showLoc(String seq_tbl_board) {
		
		MapVO locvo = dao.showLoc(seq_tbl_board);
		
		return locvo;
	}

}
