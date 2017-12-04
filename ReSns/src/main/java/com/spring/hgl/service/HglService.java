package com.spring.hgl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hgl.model.InterHglDAO;


@Service
public class HglService implements InterHglService {

	@Autowired
	private InterHglDAO dao;

}
