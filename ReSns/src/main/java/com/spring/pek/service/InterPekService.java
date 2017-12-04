package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.MapVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;


public interface InterPekService {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

	HashMap<String, String> showUser(String fk_login_id);	// 한 사람의 별명 및 프사 보기

	String showRe(String seq_tbl_board);	// 한 게시글의 덧글 보기

	List<TagVO> showTag(String seq_tbl_board);	// 한 게시글의 태그 보기

	MapVO showLoc(String seq_tbl_board);		// 게시글의 위치주소 보기

}
