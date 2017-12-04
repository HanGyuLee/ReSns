package com.spring.jsr.model;

public class QuestionBoardVO {

	private String seq_tbl_q; //질문 seq
	private String fk_login_id; //게시판 주인 아이디 
	private String q_content; // 질문  내용
	private int q_status; //질문 답변 달렸는지 상태 1: 달림 0:달리지 않음 
	private String q_date; //질문날짜 
	private String q_askid; //질문하는 사람  아이디
	
	public QuestionBoardVO(){}
	
	public QuestionBoardVO(String seq_tbl_q, String fk_login_id, String q_content, int q_status, String q_date,
			String q_askid) {
	
		this.seq_tbl_q = seq_tbl_q;
		this.fk_login_id = fk_login_id;
		this.q_content = q_content;
		this.q_status = q_status;
		this.q_date = q_date;
		this.q_askid = q_askid;
	}

	public String getSeq_tbl_q() {
		return seq_tbl_q;
	}

	public void setSeq_tbl_q(String seq_tbl_q) {
		this.seq_tbl_q = seq_tbl_q;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public int getQ_status() {
		return q_status;
	}

	public void setQ_status(int q_status) {
		this.q_status = q_status;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getQ_askid() {
		return q_askid;
	}

	public void setQ_askid(String q_askid) {
		this.q_askid = q_askid;
	}
	
	
	
	
	
	
}
