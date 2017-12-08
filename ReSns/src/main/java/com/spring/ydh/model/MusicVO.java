package com.spring.ydh.model;

public class MusicVO {
	
	private String seq_tbl_music; 					//동영상 시퀀스
	private String fk_login_id;       			//동영상게시물올린사람 아이디
	private String music_link ;      			//유튭링크
	private String music_name ;       		 //동영상 게시글 이름
	private String music_content ;    		  //동영상 게시글 내용
	private String music_date;     			//동영상 올린 날자 default sysdate 
	private String music_commentCount ;    //댓글수 default 0
	
	public MusicVO() { }
	
	public MusicVO(String seq_tbl_music, String fk_login_id, String music_link, String music_name, String music_content,
			String music_date, String music_commentCount) {
	
		this.seq_tbl_music = seq_tbl_music;
		this.fk_login_id = fk_login_id;
		this.music_link = music_link;
		this.music_name = music_name;
		this.music_content = music_content;
		this.music_date = music_date;
		this.music_commentCount = music_commentCount;
	}

	public String getSeq_tbl_music() {
		return seq_tbl_music;
	}

	public void setSeq_tbl_music(String seq_tbl_music) {
		this.seq_tbl_music = seq_tbl_music;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getMusic_link() {
		return music_link;
	}

	public void setMusic_link(String music_link) {
		this.music_link = music_link;
	}

	public String getMusic_name() {
		return music_name;
	}

	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}

	public String getMusic_content() {
		return music_content;
	}

	public void setMusic_content(String music_content) {
		this.music_content = music_content;
	}

	public String getMusic_date() {
		return music_date;
	}

	public void setMusic_date(String music_date) {
		this.music_date = music_date;
	}

	public String getMusic_commentCount() {
		return music_commentCount;
	}

	public void setMusic_commentCount(String music_commentCount) {
		this.music_commentCount = music_commentCount;
	}
	
	
}
