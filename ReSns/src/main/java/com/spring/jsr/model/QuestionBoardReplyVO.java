package com.spring.jsr.model;

public class QuestionBoardReplyVO {
	private String fk_seq_tbl_q; //질문게시판  seq 
	private String fk_login_id;//게시판 주인 답변자 아이디 */
	private String a_content;// 답변내용 
	private String a_date;// 답변날짜 
	
	public QuestionBoardReplyVO() {}
	
	public QuestionBoardReplyVO(String fk_seq_tbl_q, String fk_login_id, String a_content, String a_date) {

		this.fk_seq_tbl_q = fk_seq_tbl_q;
		this.fk_login_id = fk_login_id;
		this.a_content = a_content;
		this.a_date = a_date;
	}

	public String getFk_seq_tbl_q() {
		return fk_seq_tbl_q;
	}

	public void setFk_seq_tbl_q(String fk_seq_tbl_q) {
		this.fk_seq_tbl_q = fk_seq_tbl_q;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	
	
	
	
	
                                     
                                     
}
