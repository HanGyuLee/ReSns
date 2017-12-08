package com.spring.jdh.model;

public class MemberImageVO {

	int uimg_seq;
	String fk_login_id;
	String uimg_profile_filename;
	String uimg_header_filename;
	String uimg_profile_orgfilename;
	String uimg_header_orgfilename;
	int uimg_profile_filesize;
	int uimg_header_filesize; 
	
	public MemberImageVO() {}
	
	public MemberImageVO(int uimg_seq, String fk_login_id, String uimg_profile_filename, String uimg_header_filename,
			String uimg_profile_orgfilename, String uimg_header_orgfilename, int uimg_profile_filesize,
			int uimg_header_filesize) {
		
		this.uimg_seq = uimg_seq;
		this.fk_login_id = fk_login_id;
		this.uimg_profile_filename = uimg_profile_filename;
		this.uimg_header_filename = uimg_header_filename;
		this.uimg_profile_orgfilename = uimg_profile_orgfilename;
		this.uimg_header_orgfilename = uimg_header_orgfilename;
		this.uimg_profile_filesize = uimg_profile_filesize;
		this.uimg_header_filesize = uimg_header_filesize;
	}


	public int getUimg_seq() {
		return uimg_seq;
	}


	public void setUimg_seq(int uimg_seq) {
		this.uimg_seq = uimg_seq;
	}


	public String getFk_login_id() {
		return fk_login_id;
	}


	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}


	public String getUimg_profile_filename() {
		return uimg_profile_filename;
	}


	public void setUimg_profile_filename(String uimg_profile_filename) {
		this.uimg_profile_filename = uimg_profile_filename;
	}


	public String getUimg_header_filename() {
		return uimg_header_filename;
	}


	public void setUimg_header_filename(String uimg_header_filename) {
		this.uimg_header_filename = uimg_header_filename;
	}


	public String getUimg_profile_orgfilename() {
		return uimg_profile_orgfilename;
	}


	public void setUimg_profile_orgfilename(String uimg_profile_orgfilename) {
		this.uimg_profile_orgfilename = uimg_profile_orgfilename;
	}


	public String getUimg_header_orgfilename() {
		return uimg_header_orgfilename;
	}


	public void setUimg_header_orgfilename(String uimg_header_orgfilename) {
		this.uimg_header_orgfilename = uimg_header_orgfilename;
	}


	public int getUimg_profile_filesize() {
		return uimg_profile_filesize;
	}


	public void setUimg_profile_filesize(int uimg_profile_filesize) {
		this.uimg_profile_filesize = uimg_profile_filesize;
	}


	public int getUimg_header_filesize() {
		return uimg_header_filesize;
	}


	public void setUimg_header_filesize(int uimg_header_filesize) {
		this.uimg_header_filesize = uimg_header_filesize;
	}
	
	
	
	
}
