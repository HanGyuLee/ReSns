package com.spring.pek.model;

public class ReVO {
	
	private int re_seq; 
	private int seq_tbl_board;
	private String re_id;
	private String re_content;
	private String re_date;
	private int re_status;
	private int re_fk_seq; 
	private int re_groupno; 
	private int re_depthno;
	
	public ReVO() {}
	
	public ReVO(int re_seq, int seq_tbl_board, String re_id, String re_content, String re_date, int re_status,
			int re_fk_seq, int re_groupno, int re_depthno) {
		this.re_seq = re_seq;
		this.seq_tbl_board = seq_tbl_board;
		this.re_id = re_id;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_status = re_status;
		this.re_fk_seq = re_fk_seq;
		this.re_groupno = re_groupno;
		this.re_depthno = re_depthno;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getSeq_tbl_board() {
		return seq_tbl_board;
	}

	public void setSeq_tbl_board(int seq_tbl_board) {
		this.seq_tbl_board = seq_tbl_board;
	}

	public String getRe_id() {
		return re_id;
	}

	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_date() {
		return re_date;
	}

	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}

	public int getRe_status() {
		return re_status;
	}

	public void setRe_status(int re_status) {
		this.re_status = re_status;
	}

	public int getRe_fk_seq() {
		return re_fk_seq;
	}

	public void setRe_fk_seq(int re_fk_seq) {
		this.re_fk_seq = re_fk_seq;
	}

	public int getRe_groupno() {
		return re_groupno;
	}

	public void setRe_groupno(int re_groupno) {
		this.re_groupno = re_groupno;
	}

	public int getRe_depthno() {
		return re_depthno;
	}

	public void setRe_depthno(int re_depthno) {
		this.re_depthno = re_depthno;
	}
	
	

}
