package com.spring.jsr.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//DAO선언---
//Repository 선언

@Repository
public class JsrDAO implements InterJsrDAO {
	
	//의존객체 주입(DI : Dependency Injection)
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
	

}
