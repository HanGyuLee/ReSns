package com.spring.pmh.service;

import java.util.HashMap;
import java.util.List;


public interface InterPmhService {

	List<HashMap<String, String>> getReport(); // DB에서 신고 목록을 가지고 오는 메소드
	
	HashMap<String, String> getReportDetail(String seq); // DE에서 신고 하나의 자세한 정보를 가지고 오는 메소드

}
