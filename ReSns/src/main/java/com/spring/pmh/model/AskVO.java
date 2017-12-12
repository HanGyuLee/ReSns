package com.spring.pmh.model;

import org.springframework.web.multipart.MultipartFile;

public class AskVO {
	private String seq_tbl_ask;
	private String fk_login_id; // tbl_user 의 FK(유저 아이디 받아오기)
	private String ask_cate; // 문의 분류 1: 회원정보 2: 이용관련 3: 버그문의 4: 기타
	private String ask_title; // 문의 제목
	private String ask_content; // 문의 내용
	private String ask_reply; // 문의 답변
	private String ask_date1; // 문의 날짜
	private String ask_status; // 게시물 상태 0: 삭제 1: 안 삭제 2: 안 삭제(비밀글)
	private String ask_secret; // 게시물 비밀글 여부 0: 비밀글 1: 비밀글 아님
	private String ask_groupno; // 게시물 그룹번호(이 밑으로 컬럼 3개는 답글형 게시판을 만들기 위해 필요) 
	private String ask_fk_seq; // 원글번호
	private String ask_depthno; // 답글깊이
		
	private String fileName;     // WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
 	private String orgFilename;  // 진짜 파일명(강아지.png). 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
 	private String fileSize;     // 파일크기
 	
 	private MultipartFile file; // 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.

 	public AskVO() {}

	public AskVO(String seq_tbl_ask, String fk_login_id, String ask_cate, String ask_title, String ask_content,
			String ask_reply, String ask_date1, String ask_status, String ask_secret, String ask_groupno,
			String ask_fk_seq, String ask_depthno, String fileName, String orgFilename, String fileSize,
			MultipartFile file) {
		super();
		this.seq_tbl_ask = seq_tbl_ask;
		this.fk_login_id = fk_login_id;
		this.ask_cate = ask_cate;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.ask_reply = ask_reply;
		this.ask_date1 = ask_date1;
		this.ask_status = ask_status;
		this.ask_secret = ask_secret;
		this.ask_groupno = ask_groupno;
		this.ask_fk_seq = ask_fk_seq;
		this.ask_depthno = ask_depthno;
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.file = file;
	}

	public String getSeq_tbl_ask() {
		return seq_tbl_ask;
	}

	public void setSeq_tbl_ask(String seq_tbl_ask) {
		this.seq_tbl_ask = seq_tbl_ask;
	}

	public String getFk_login_id() {
		return fk_login_id;
	}

	public void setFk_login_id(String fk_login_id) {
		this.fk_login_id = fk_login_id;
	}

	public String getAsk_cate() {
		return ask_cate;
	}

	public void setAsk_cate(String ask_cate) {
		this.ask_cate = ask_cate;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public String getAsk_reply() {
		return ask_reply;
	}

	public void setAsk_reply(String ask_reply) {
		this.ask_reply = ask_reply;
	}

	public String getAsk_date1() {
		return ask_date1;
	}

	public void setAsk_date1(String ask_date1) {
		this.ask_date1 = ask_date1;
	}

	public String getAsk_status() {
		return ask_status;
	}

	public void setAsk_status(String ask_status) {
		this.ask_status = ask_status;
	}

	public String getAsk_secret() {
		return ask_secret;
	}

	public void setAsk_secret(String ask_secret) {
		this.ask_secret = ask_secret;
	}

	public String getAsk_groupno() {
		return ask_groupno;
	}

	public void setAsk_groupno(String ask_groupno) {
		this.ask_groupno = ask_groupno;
	}

	public String getAsk_fk_seq() {
		return ask_fk_seq;
	}

	public void setAsk_fk_seq(String ask_fk_seq) {
		this.ask_fk_seq = ask_fk_seq;
	}

	public String getAsk_depthno() {
		return ask_depthno;
	}

	public void setAsk_depthno(String ask_depthno) {
		this.ask_depthno = ask_depthno;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOrgFilename() {
		return orgFilename;
	}

	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
 	
}
