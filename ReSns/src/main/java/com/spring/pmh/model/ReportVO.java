package com.spring.pmh.model;

public class ReportVO {
	
	private String fk_seq_tbl_board; // 신고당한 글번호
	private String fk_login_id; // 신고당한 사람
	private String report_user; // 신고한 사람
	private String seq_tbl_report; // 신고게시판의 신고글 순번
	private String report_content; //신고내용
	private String report_cate; // 신고사유 1: 다른 사람 비방 2: 유해성 게시물 3: 스팸광고 4: 기타
	private String report_date1; // 신고날짜
	private String report_date2; // 처리날짜
	private String report_status; // 처리상태 0. 처리완료 1. 처리완료(비밀글) 2. 처리안된신고 3. 처리안된신고(비밀글)
	
	public ReportVO() {}

	public ReportVO(String fk_seq_tbl_board, String fk_login_id, String report_user, String seq_tbl_report,
			String report_content, String report_cate, String report_date1, String report_date2, String report_status) {
		super();
		this.fk_seq_tbl_board = fk_seq_tbl_board;
		this.fk_login_id = fk_login_id;
		this.report_user = report_user;
		this.seq_tbl_report = seq_tbl_report;
		this.report_content = report_content;
		this.report_cate = report_cate;
		this.report_date1 = report_date1;
		this.report_date2 = report_date2;
		this.report_status = report_status;
	}

	public String getFk_seq_tbl_board() {
		return fk_seq_tbl_board;
	}

	public void setFk_seq_tbl_board(String fk_seq_tbl_board) {
		this.fk_seq_tbl_board = fk_seq_tbl_board;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getReport_user() {
		return report_user;
	}

	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}

	public String getSeq_tbl_report() {
		return seq_tbl_report;
	}

	public void setSeq_tbl_report(String seq_tbl_report) {
		this.seq_tbl_report = seq_tbl_report;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_cate() {
		return report_cate;
	}

	public void setReport_cate(String report_cate) {
		this.report_cate = report_cate;
	}

	public String getReport_date1() {
		return report_date1;
	}

	public void setReport_date1(String report_date1) {
		this.report_date1 = report_date1;
	}

	public String getReport_date2() {
		return report_date2;
	}

	public void setReport_date2(String report_date2) {
		this.report_date2 = report_date2;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	
	
	
}
