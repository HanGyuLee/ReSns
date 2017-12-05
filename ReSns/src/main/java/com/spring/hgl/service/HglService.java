package com.spring.hgl.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hgl.model.InterHglDAO;


@Service
public class HglService implements InterHglService {

	@Autowired
	private InterHglDAO dao;
	
	

	@Override
	public List<HashMap<String, Object>> getMyBoardList(String userid) {
		List<HashMap<String, Object>> list = dao.getMyBoardList(userid);
		return list;
	}



	@Override
	public HashMap<String, String> getMyProfile(String userid) {
		HashMap<String, String> list = dao.getMyProfile(userid);
		return list;
	}


}
