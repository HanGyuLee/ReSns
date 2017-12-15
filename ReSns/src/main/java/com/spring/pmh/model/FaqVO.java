package com.spring.pmh.model;

public class FaqVO {

	private String seq_tbl_faq; // 시퀀스
	private String faq_category; // 카테고리 1. 회원관련 2. 기능관련 3. 기타사항
	private String faq_title; // FAQ 제목
	private String faq_content; // FAQ 의 자주묻는질문 내용
	private String faq_answer; // FAQ 의 질문의 답변 내용
	private String faq_status; // FAQ 0: 삭제 1: 활성화
	
	public FaqVO() {}
	
	public FaqVO(String seq_tbl_faq, String faq_category, String faq_title, String faq_content, String faq_answer,
			String faq_status) {
		super();
		this.seq_tbl_faq = seq_tbl_faq;
		this.faq_category = faq_category;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_answer = faq_answer;
		this.faq_status = faq_status;
	}

	public String getSeq_tbl_faq() {
		return seq_tbl_faq;
	}

	public void setSeq_tbl_faq(String seq_tbl_faq) {
		this.seq_tbl_faq = seq_tbl_faq;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_answer() {
		return faq_answer;
	}

	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}

	public String getFaq_status() {
		return faq_status;
	}

	public void setFaq_status(String faq_status) {
		this.faq_status = faq_status;
	}
	
}
