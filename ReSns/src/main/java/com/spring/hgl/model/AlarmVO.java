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
	
}// end of AlarmVO
