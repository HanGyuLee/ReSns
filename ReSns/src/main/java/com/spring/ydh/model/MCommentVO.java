package com.spring.ydh.model;

public class MCommentVO {
	
	
	private String seq_tbl_remusic;        //동영상답변 시퀀스
	private	String re_ycontent;             //동영상답변내용
	private	String re_ydate;         		//동영상답변 단 날짜
	private	String re_login_id;      		//동영상답변남긴사람 아이디(원게시물)
	private	String seq_tbl_music ;   		//동영상시퀀스
	private	String fk_login_id;      		//동영상올린사람의아이디
	
	
	public MCommentVO(){}
	
	public MCommentVO(String seq_tbl_remusic, String re_ycontent, String re_ydate, String re_login_id,
			String seq_tbl_music, String fk_login_id) {
		super();
		this.seq_tbl_remusic = seq_tbl_remusic;
		this.re_ycontent = re_ycontent;
		this.re_ydate = re_ydate;
		this.re_login_id = re_login_id;
		this.seq_tbl_music = seq_tbl_music;
		this.fk_login_id = fk_login_id;
	}

	public String getSeq_tbl_remusic() {
		return seq_tbl_remusic;
	}

	public void setSeq_tbl_remusic(String seq_tbl_remusic) {
		this.seq_tbl_remusic = seq_tbl_remusic;
	}

	public String getRe_ycontent() {
		return re_ycontent;
	}

	public void setRe_ycontent(String re_ycontent) {
		this.re_ycontent = re_ycontent;
	}

	public String getRe_ydate() {
		return re_ydate;
	}

	public void setRe_ydate(String re_ydate) {
		this.re_ydate = re_ydate;
	}

	public String getRe_login_id() {
		return re_login_id;
	}

	public void setRe_login_id(String re_login_id) {
		this.re_login_id = re_login_id;
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
	
	
	

}
