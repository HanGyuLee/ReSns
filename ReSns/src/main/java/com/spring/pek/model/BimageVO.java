package com.spring.pek.model;

public class BimageVO {
	
	
	int bimg_seq; /* seq */
	int seq_tbl_board; /* 글번호 */
	String bimg_filename; /* 파일이름 */
	String bimg_orgfilename; /* 파일원래이름 */
	String bimg_filesize;	// 파일 사이즈
	
	
	public BimageVO() {}
	
	public BimageVO(int bimg_seq, int seq_tbl_board, String bimg_filename, String bimg_orgfilename,
			String bimg_filesize) {
		this.bimg_seq = bimg_seq;
		this.seq_tbl_board = seq_tbl_board;
		this.bimg_filename = bimg_filename;
		this.bimg_orgfilename = bimg_orgfilename;
		this.bimg_filesize = bimg_filesize;
	}

	public int getBimg_seq() {
		return bimg_seq;
	}

	public void setBimg_seq(int bimg_seq) {
		this.bimg_seq = bimg_seq;
	}

	public int getSeq_tbl_board() {
		return seq_tbl_board;
	}

	public void setSeq_tbl_board(int seq_tbl_board) {
		this.seq_tbl_board = seq_tbl_board;
	}

	public String getBimg_filename() {
		return bimg_filename;
	}

	public void setBimg_filename(String bimg_filename) {
		this.bimg_filename = bimg_filename;
	}

	public String getBimg_orgfilename() {
		return bimg_orgfilename;
	}

	public void setBimg_orgfilename(String bimg_orgfilename) {
		this.bimg_orgfilename = bimg_orgfilename;
	}

	public String getBimg_filesize() {
		return bimg_filesize;
	}

	public void setBimg_filesize(String bimg_filesize) {
		this.bimg_filesize = bimg_filesize;
	}
	
	
	
	

}
