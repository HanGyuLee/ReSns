package com.spring.jdh.model;

public class UserVO {
	
	String fk_login_id;	// 아이디
	String user_email;	// 이메일
	String user_birth;	// 생년월일
	int user_gender;	// 성별
	int user_status;	// status
	int user_ing;		// 팔로잉
	int user_ed;		// 팔로워
	int user_boardcnt;	// 내 게시물수
	int user_report;	// 신고당한횟수
	
	
	
	public UserVO() {}
	
	public UserVO(String fk_login_id, String user_email, String user_birth, int user_gender, int user_status,
			int user_ing, int user_ed, int user_boardcnt, int user_report) {
		
		this.fk_login_id = fk_login_id;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.user_status = user_status;
		this.user_ing = user_ing;
		this.user_ed = user_ed;
		this.user_boardcnt = user_boardcnt;
		this.user_report = user_report;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public int getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(int user_gender) {
		this.user_gender = user_gender;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public int getUser_ing() {
		return user_ing;
	}

	public void setUser_ing(int user_ing) {
		this.user_ing = user_ing;
	}

	public int getUser_ed() {
		return user_ed;
	}

	public void setUser_ed(int user_ed) {
		this.user_ed = user_ed;
	}

	public int getUser_boardcnt() {
		return user_boardcnt;
	}

	public void setUser_boardcnt(int user_boardcnt) {
		this.user_boardcnt = user_boardcnt;
	}

	public int getUser_report() {
		return user_report;
	}

	public void setUser_report(int user_report) {
		this.user_report = user_report;
	}
	
	
}
