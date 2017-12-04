package com.spring.pek.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pek.model.BoardDAO;

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

}
