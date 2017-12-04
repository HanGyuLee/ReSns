package com.spring.pek.model;

public class TagVO {
	
	private int seq_tbl_tag; 
	private int seq_tbl_board; 
	private String tag_content;
	
	public TagVO() {}
	
	public TagVO(int seq_tbl_tag, int seq_tbl_board, String tag_content) {

		this.seq_tbl_tag = seq_tbl_tag;
		this.seq_tbl_board = seq_tbl_board;
		this.tag_content = tag_content;
	}



	public int getSeq_tbl_tag() {
		return seq_tbl_tag;
	}



	public void setSeq_tbl_tag(int seq_tbl_tag) {
		this.seq_tbl_tag = seq_tbl_tag;
	}



	public int getSeq_tbl_board() {
		return seq_tbl_board;
	}



	public void setSeq_tbl_board(int seq_tbl_board) {
		this.seq_tbl_board = seq_tbl_board;
	}



	public String getTag_content() {
		return tag_content;
	}



	public void setTag_content(String tag_content) {
		this.tag_content = tag_content;
	}
	
	

}
