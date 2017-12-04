package com.spring.pek.model;

public class BoardVO {
	
	
	private int seq_tbl_board; 		// 글번호
	private String fk_login_id; 	// 아이디
	private String board_content;	// 내용
	private int board_status;		// 상태
	private String board_time;		// 날짜
	private int board_heart;		// 하트 카운트
	private int board_recnt;		// 댓글 카운트
	
	
	public BoardVO() {}

	public BoardVO(int seq_tbl_board, String fk_login_id, String board_content, int board_status, String board_time,
			int board_heart, int board_recnt) {
		this.seq_tbl_board = seq_tbl_board;
		this.fk_login_id = fk_login_id;
		this.board_content = board_content;
		this.board_status = board_status;
		this.board_time = board_time;
		this.board_heart = board_heart;
		this.board_recnt = board_recnt;
	}

	public int getSeq_tbl_board() {
		return seq_tbl_board;
	}

	public void setSeq_tbl_board(int seq_tbl_board) {
		this.seq_tbl_board = seq_tbl_board;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_status() {
		return board_status;
	}

	public void setBoard_status(int board_status) {
		this.board_status = board_status;
	}

	public String getBoard_time() {
		return board_time;
	}

	public void setBoard_time(String board_time) {
		this.board_time = board_time;
	}

	public int getBoard_heart() {
		return board_heart;
	}

	public void setBoard_heart(int board_heart) {
		this.board_heart = board_heart;
	}

	public int getBoard_recnt() {
		return board_recnt;
	}

	public void setBoard_recnt(int board_recnt) {
		this.board_recnt = board_recnt;
	}


	
	
	

}
