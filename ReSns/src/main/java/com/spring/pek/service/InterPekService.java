package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pek.model.HeartVO;
import com.spring.pek.model.MapVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;


public interface InterPekService {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

	String showUser(String fk_login_id);	// 한 사람의 별명 및 프사 보기

	String showRe(String seq_tbl_board);	// 한 게시글의 덧글 보기

	String showTag(String seq_tbl_board);	// 한 게시글의 태그 보기

	String showLoc(String seq_tbl_board);		// 게시글의 위치주소 보기

	int addHeart(HashMap<String, String> map);	// 좋아요 누르기

	int HeartedUser(HashMap<String, String> map);	// 이미 좋아요 눌렀는지 확인하기

	String heartCheck(HashMap<String, String> map);	// 하트 아이콘 바꿔주기 위한 하트 여부 확인

}
