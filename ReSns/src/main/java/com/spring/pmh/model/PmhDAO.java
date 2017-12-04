package com.spring.pmh.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PmhDAO implements InterPmhDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> getReport() {
		List<HashMap<String, String>> rvoList = sqlsession.selectList("pmhresns.getReport");
		return rvoList;
	}
	
	@Override
	public HashMap<String, String> getReportDetail(String seq) {
		HashMap<String, String> reportMap = sqlsession.selectOne("pmhresns.getReportDetail", seq);
		return reportMap;
	}

}
