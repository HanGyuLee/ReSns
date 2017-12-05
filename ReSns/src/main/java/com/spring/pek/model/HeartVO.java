package com.spring.pek.model;

public class HeartVO {
	
	private String fk_login_id;
	private String fk_seq_tbl_board; 
	private String heart_getid;
	
	public HeartVO () {}
	
	public HeartVO(String fk_login_id, String fk_seq_tbl_board, String heart_getid) {

		this.fk_login_id = fk_login_id;
		this.fk_seq_tbl_board = fk_seq_tbl_board;
		this.heart_getid = heart_getid;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}
	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}
	public String getFk_seq_tbl_board() {
		return fk_seq_tbl_board;
	}
	public void setFk_seq_tbl_board(String fk_seq_tbl_board) {
		this.fk_seq_tbl_board = fk_seq_tbl_board;
	}
	public String getHeart_getid() {
		return heart_getid;
	}
	public void setHeart_getid(String heart_getid) {
		this.heart_getid = heart_getid;
	}
	
	

}
