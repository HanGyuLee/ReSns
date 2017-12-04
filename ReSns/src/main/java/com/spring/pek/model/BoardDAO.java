package com.spring.pek.model;

import java.util.HashMap;
import java.util.List;


public interface BoardDAO {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

	HashMap<String, String> showUser(String fk_login_id);	// 글쓴이 별명과 프사 보기

	List<ReVO> showRe(String seq_tbl_board);	// 한 게시글의 덧글 보기

	List<TagVO> showTag(String seq_tbl_board);	// 한 게시글의 태그 보기

	MapVO showLoc(String seq_tbl_board);		// 한 게시글의 위치주소 보기

}
