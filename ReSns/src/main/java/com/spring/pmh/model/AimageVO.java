package com.spring.pmh.model;

public class AimageVO {
	private int aimg_category; // 사용게시판 1.문의 2.신고 3.공지사항 4.FAQ
	private int aimg_seq; // 사용게시판 게시물 번호
	private String aimg_filename; // 업로드된 파일 이름
	private String aimg_orgfilename; // 업로드된 파일의 진짜 이름
	private long aimg_filesize; // 업로드된 파일의 크기
	private int aimg_status; // 0: 삭제, 1:활성화
	private String aimg_thumb; // 썸네일 이미지 이름
	
	public AimageVO() {}
	
	public AimageVO(int aimg_category, int aimg_seq, String aimg_filename, String aimg_orgfilename, long aimg_filesize,
			int aimg_status, String aimg_thumb) {
		super();
		this.aimg_category = aimg_category;
		this.aimg_seq = aimg_seq;
		this.aimg_filename = aimg_filename;
		this.aimg_orgfilename = aimg_orgfilename;
		this.aimg_filesize = aimg_filesize;
		this.aimg_status = aimg_status;
		this.aimg_thumb = aimg_thumb;
	}

	public int getAimg_category() {
		return aimg_category;
	}

	public void setAimg_category(int aimg_category) {
		this.aimg_category = aimg_category;
	}

	public int getAimg_seq() {
		return aimg_seq;
	}

	public void setAimg_seq(int aimg_seq) {
		this.aimg_seq = aimg_seq;
	}

	public String getAimg_filename() {
		return aimg_filename;
	}

	public void setAimg_filename(String aimg_filename) {
		this.aimg_filename = aimg_filename;
	}

	public String getAimg_orgfilename() {
		return aimg_orgfilename;
	}

	public void setAimg_orgfilename(String aimg_orgfilename) {
		this.aimg_orgfilename = aimg_orgfilename;
	}

	public long getAimg_filesize() {
		return aimg_filesize;
	}

	public void setAimg_filesize(long aimg_filesize) {
		this.aimg_filesize = aimg_filesize;
	}

	public int getAimg_status() {
		return aimg_status;
	}

	public void setAimg_status(int aimg_status) {
		this.aimg_status = aimg_status;
	}

	public String getAimg_thumb() {
		return aimg_thumb;
	}

	public void setAimg_thumb(String aimg_thumb) {
		this.aimg_thumb = aimg_thumb;
	}
	
}
