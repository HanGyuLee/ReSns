package com.spring.hgl.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HglDAO implements InterHglDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;

}// end of HglDAO
