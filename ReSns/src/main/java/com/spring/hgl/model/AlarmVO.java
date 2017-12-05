package com.spring.hgl.model;

public class AlarmVO {

	private int seq_tbl_alarm;   	// 알람번호 NOT NULL NUMBER        
	private String fk_login_id;     // 아이디 NOT NULL VARCHAR2(30)  
	private String alarm_username;  // 보낸사람 별명 NOT NULL VARCHAR2(20)  
	private String alarm_userid;    // 보낸사람 아이디 NOT NULL VARCHAR2(20)  
	private String alarm_userimage; // 프사 NOT NULL VARCHAR2(200) 
	private int alarm_type;      	// 1:팔로우,2:하트,3:질문NOT NULL NUMBER(1)     
	private int alarm_status;    	// NOT NULL NUMBER(1)     
	private String alarm_time;      // 시간 NOT NULL DATE 
	
	public AlarmVO(){}
	
	public AlarmVO(int seq_tbl_alarm, String fk_login_id, String alarm_username, String alarm_userid,
			String alarm_userimage, int alarm_type, int alarm_status, String alarm_time) {
		this.seq_tbl_alarm = seq_tbl_alarm;
		this.fk_login_id = fk_login_id;
		this.alarm_username = alarm_username;
		this.alarm_userid = alarm_userid;
		this.alarm_userimage = alarm_userimage;
		this.alarm_type = alarm_type;
		this.alarm_status = alarm_status;
		this.alarm_time = alarm_time;
	}
	
	public int getSeq_tbl_alarm() {
		return seq_tbl_alarm;
	}
	public void setSeq_tbl_alarm(int seq_tbl_alarm) {
		this.seq_tbl_alarm = seq_tbl_alarm;
	}
	public String getFk_login_id() {
		return fk_login_id;
	}
	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}
	public String getAlarm_username() {
		return alarm_username;
	}
	public void setAlarm_username(String alarm_username) {
		this.alarm_username = alarm_username;
	}
	public String getAlarm_userid() {
		return alarm_userid;
	}
	public void setAlarm_userid(String alarm_userid) {
		this.alarm_userid = alarm_userid;
	}
	public String getAlarm_userimage() {
		return alarm_userimage;
	}
	public void setAlarm_userimage(String alarm_userimage) {
		this.alarm_userimage = alarm_userimage;
	}
	public int getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(int alarm_type) {
		this.alarm_type = alarm_type;
	}
	public int getAlarm_status() {
		return alarm_status;
	}
	public void setAlarm_status(int alarm_status) {
		this.alarm_status = alarm_status;
	}
	public String getAlarm_time() {
		return alarm_time;
	}
	public void setAlarm_time(String alarm_time) {
		this.alarm_time = alarm_time;
	}
	
	
}// end of AlarmVO
