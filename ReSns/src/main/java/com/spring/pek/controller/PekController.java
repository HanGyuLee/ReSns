package com.spring.pek.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pek.model.MapVO;
import com.spring.pek.model.ReVO;
import com.spring.pek.model.TagVO;
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
		
		//String fk_login_id = req.getParameter("fk_login_id");
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		
		/*필요한 거(비공개 아닌 글, 삭제되지 않은 회원, 신고당하지 않은 덧글)*/
		
		//HashMap<String, String> userHashMap = service.showUser(fk_login_id);
		String str_reList = service.showRe(seq_tbl_board);
		//List<TagVO> tagList = service.showTag(seq_tbl_board);
		//MapVO locvo = service.showLoc(seq_tbl_board);
		
		//req.setAttribute("userHashMap", userHashMap);
		req.setAttribute("str_reList", str_reList);
		//req.setAttribute("tagList", tagList);
		//req.setAttribute("locvo", locvo);
		
		
		return "reListJSON.notiles";
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
