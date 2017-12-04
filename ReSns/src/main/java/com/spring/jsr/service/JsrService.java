package com.spring.jsr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jsr.model.InterJsrDAO;


//service  선언
@Service
public class JsrService implements InterJsrService {
	
	//의존객체 주입
	@Autowired
	private InterJsrDAO jdao;
	

}
