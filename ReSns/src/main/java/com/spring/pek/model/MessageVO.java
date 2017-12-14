package com.spring.pek.model;

public class MessageVO {
	
	
	private int seq_tbl_msg; /* seq */
	private String fk_login_id; /* 쪽지받는사람 */
	private String msg_content; /* 쪽지내용 */
	private String msg_send; /* 쪽지하는사람 */
	private String msg_date; // 쪽지보낸날짜
	
	
	public MessageVO() {}
	
	public MessageVO(int seq_tbl_msg, String fk_login_id, String msg_content, String msg_send, String msg_date) {
		
		this.seq_tbl_msg = seq_tbl_msg;
		this.fk_login_id = fk_login_id;
		this.msg_content = msg_content;
		this.msg_send = msg_send;
		this.msg_date = msg_date;
	}

	public int getSeq_tbl_msg() {
		return seq_tbl_msg;
	}

	public void setSeq_tbl_msg(int seq_tbl_msg) {
		this.seq_tbl_msg = seq_tbl_msg;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_send() {
		return msg_send;
	}

	public void setMsg_send(String msg_send) {
		this.msg_send = msg_send;
	}

	public String getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}

}
