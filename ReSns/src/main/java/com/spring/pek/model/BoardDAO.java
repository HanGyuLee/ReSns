package com.spring.pek.model;

import java.util.HashMap;
import java.util.List;


public interface BoardDAO {

	List<HashMap<String, String>> getBoardList();	// 인기 리스트 보기

}
