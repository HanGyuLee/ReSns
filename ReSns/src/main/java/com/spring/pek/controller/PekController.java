package com.spring.pek.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pek.service.InterPekService;

@Controller
public class PekController {
	
	@Autowired
	private InterPekService service;
	
	// 글 목록 보기 (인기페이지)
	@RequestMapping(value = "/index.re", method = {RequestMethod.GET})
	public String index(HttpServletRequest req) {
		
		
		List<HashMap<String, String>> boardList = service.getBoardList();
		
		req.setAttribute("boardList", boardList);
		
		return "index.tiles";
	}
	
	
	
	// 글 1개 보기 (상세페이지)
	@RequestMapping(value = "/detailBoard.re", method = {RequestMethod.GET})
	public String detailBoard(HttpServletRequest req) {
		
		// 아이디도 넘겨줘야 함
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		
		/*필요한 거(비공개 아닌 글, 삭제되지 않은 회원, 신고당하지 않은 덧글)
		
		tbl_login : 별명
		tbl_uimage : 프사 이미지
		tbl_board : 내용, 시간
		tbl_re : 덧글 (덧글 쓴 사람 프사, 별명)
		tbl_tag : 태그
		tbl_map : 위치*/
		
		
		// 글 1개 select 메소드
		// 댓글 보여주기 select 메소드
		// 댓글 갯수 보여주기 select 메소드
		// 하트 보여주기 select 메소드
		// 하트 갯수 보여주기 select 메소드
		// 위치 보여주기 select 메소드
		// 게시물 이미지 보여주기 select 메소드
		// 태그 보여주기 select 메소드
		
		return "";
		// 글 내용 더보기
		// 모달
		// 사진 크게 보기
	}
	
	// 글쓰기 요청
	@RequestMapping(value = "/writeBoard.re", method = {RequestMethod.GET})
	public String writeBoard() {
		
		// 로그인 체크
		// 게시물 insert 메소드(비공개/공개 구분)
		// 맵 insert 메소드
		// 태그 insert 메소드
		// 게시물 이미지 insert 메소드
		
		return "";
	}
	
	// 글쓰기 완료
	@RequestMapping(value = "/writeBoardEnd.re", method = {RequestMethod.GET})
	public String writeBoardEnd() {
		
		// 
		
		return "";
	}
	
	// 글삭제 요청
	@RequestMapping(value = "/deleteBoard.re", method = {RequestMethod.GET})
	public String deleteBoard() {
		
		// 로그인 체크
		// 게시물 delete 메소드
		// 맵 delete 메소드
		// 태그 delete 메소드
		// 태그 delete 메소드
		// 게시물 이미지 delete 메소드
		
		return "";
	}
	
	// 글삭제 완료
	@RequestMapping(value = "/deleteBoardEnd.re", method = {RequestMethod.GET})
	public String deleteBoardEnd() {
		
		// 
		
		return "";
	}
	
	// 덧글 쓰기
	@RequestMapping(value = "/writeReply.re", method = {RequestMethod.GET})
	public String writeReply() {
		
		// 로그인 체크
		// 원댓글 답글 구분
		// 덧글 insert 메소드
		
		return "";
	}
	
	// 덧글 삭제 요청
	@RequestMapping(value = "/deleteReply.re", method = {RequestMethod.GET})
	public String deleteReply() {
		
		// 로그인 체크
		// 원댓글 답글 구분
		// 덧글 insert 메소드
		
		return "";
	}
	
	// 덧글 삭제 완료
	@RequestMapping(value = "/deleteReplyEnd.re", method ={RequestMethod.GET})
	public String deleteReplyEnd() {
		
		// 
		
		return "";
	}
	
	// 하트
	@RequestMapping(value = "/addHeart.re", method = {RequestMethod.GET})
	public String addHeart() {
		
		// 로그인 체크
		// 하트 insert 메소드
		
		return "";
	}
	
	// 하트 취소 요청
	@RequestMapping(value = "/deleteHeart.re", method = {RequestMethod.GET})
	public String deleteHeart() {
		
		// 로그인 체크
		// 하트 delete 메소드
		
		return "";
	}
	
	// 하트 취소 완료
	@RequestMapping(value = "/deleteHeartEnd.re", method = {RequestMethod.GET})
	public String deleteHeartEnd() {
		
		// 
		
		return "";
	}
		
		
	// 게시글 첨부파일 다운로드
	@RequestMapping(value = "/downloadBoard.re", method = {RequestMethod.GET})
	public String downloadBoard() {
		
		// 
		
		return "";
	}

}
