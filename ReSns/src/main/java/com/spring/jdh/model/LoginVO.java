package com.spring.jdh.model;

public class LoginVO {
	
	String login_id;	// 아이디
	String login_pwd;	// 비밀번호
	String login_name;	// 별명
	int login_status;	// 상태값
	
	public LoginVO(){}

	public LoginVO(String login_id, String login_pwd, String login_name, int login_status) {
		
		this.login_id = login_id;
		this.login_pwd = login_pwd;
		this.login_name = login_name;
		this.login_status = login_status;
	}



	public String getLogin_id() {
		return login_id;
	}



	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}



	public String getLogin_pwd() {
		return login_pwd;
	}



	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}



	public String getLogin_name() {
		return login_name;
	}



	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}



	public int getLogin_status() {
		return login_status;
	}



	public void setLogin_status(int login_status) {
		this.login_status = login_status;
	}

}
