package com.spring.jsr.model;

public class FollowVO {
	
	private String follow_seq; //시퀀스 
	private String fk_login_id; //팔로우 하는 로그인 유저 아이디 
	private String follow_id; //팔로우 당하는 유저 아이디
	
	
	public FollowVO(){}
	
	public FollowVO(String follow_seq, String fk_login_id, String follow_id) {
	
		this.follow_seq = follow_seq;
		this.fk_login_id = fk_login_id;
		this.follow_id = follow_id;
	}
	
	

	public String getFollow_seq() {
		return follow_seq;
	}

	public void setFollow_seq(String follow_seq) {
		this.follow_seq = follow_seq;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getFollow_id() {
		return follow_id;
	}

	public void setFollow_id(String follow_id) {
		this.follow_id = follow_id;
	}
	
	
	
	
	
	
	
	
	

}
