package com.spring.pmh.model;

import java.util.HashMap;
import java.util.List;

public interface InterPmhDAO {

	List<HashMap<String, String>> getReport(); // DB에서 신고정보를 가져오는 메소드

	HashMap<String, String> getReportDetail(String seq); // DB에서 신고 정보 하나를 가지고 오는 메소드
}
