package com.spring.pmh.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pmh.model.InterPmhDAO;

@Service
public class PmhService implements InterPmhService {

	@Autowired
	private InterPmhDAO pdao;
	
	@Override
	public List<HashMap<String, String>> getReport() {

		List<HashMap<String, String>> rvoList = pdao.getReport();
		return rvoList;
	}
	
	@Override
	public HashMap<String, String> getReportDetail(String seq) {
		HashMap<String, String> reportMap = pdao.getReportDetail(seq);
		return reportMap;
	}

}
