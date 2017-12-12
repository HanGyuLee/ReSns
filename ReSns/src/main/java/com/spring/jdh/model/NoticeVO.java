package com.spring.jdh.model;

public class NoticeVO {

	int seq_tbl_notice;
	String notice_title;
	String notice_content;
	int notice_date;
	int notice_status;
	int notice_cate;
	
	
	public NoticeVO(){}
	
	
	public NoticeVO(int seq_tbl_notice, String notice_title, String notice_content, int notice_date, int notice_status,
			int notice_cate) {
		
		this.seq_tbl_notice = seq_tbl_notice;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_status = notice_status;
		this.notice_cate = notice_cate;
	}


	public int getSeq_tbl_notice() {
		return seq_tbl_notice;
	}


	public void setSeq_tbl_notice(int seq_tbl_notice) {
		this.seq_tbl_notice = seq_tbl_notice;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public int getNotice_date() {
		return notice_date;
	}


	public void setNotice_date(int notice_date) {
		this.notice_date = notice_date;
	}


	public int getNotice_status() {
		return notice_status;
	}


	public void setNotice_status(int notice_status) {
		this.notice_status = notice_status;
	}


	public int getNotice_cate() {
		return notice_cate;
	}


	public void setNotice_cate(int notice_cate) {
		this.notice_cate = notice_cate;
	}
	
	
	
}
