package com.spring.pek.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.jdh.model.LoginVO;
import com.spring.pek.model.HeartVO;
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
	public String index(HttpServletRequest req, HttpSession session) {
		
		//String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		List<HashMap<String, String>> boardList = service.getBoardList();
		
		req.setAttribute("loginUser", loginUser);
		req.setAttribute("boardList", boardList);
		
		return "index.tiles";
	}
	
	// 한 사람의 별명과 프사 보기(ajax) 
	@RequestMapping(value = "/showUser.re", method = {RequestMethod.GET})
	public String showUser(HttpServletRequest req) {
		
		String fk_login_id = req.getParameter("fk_login_id");
		
		//필요한 거(비공개 아닌 글, 삭제되지 않은 회원, 신고당하지 않은 덧글)
		
		String str_user = service.showUser(fk_login_id);
		
		req.setAttribute("str_user", str_user);

		return "showUserJSON.notiles";
	}
	
	// 한 게시글의 덧글 보기(ajax) 
	@RequestMapping(value = "/reList.re", method = {RequestMethod.GET})
	public String reList(HttpServletRequest req) {
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");

		//필요한 거(비공개 아닌 글, 삭제되지 않은 회원, 신고당하지 않은 덧글)

		String str_reList = service.showRe(seq_tbl_board);

		req.setAttribute("str_reList", str_reList);

		
		return "reListJSON.notiles";
	}
	
	// 한 게시글의 태그 보기(ajax) 
	@RequestMapping(value = "/tagList.re", method = {RequestMethod.GET})
	public String tagList(HttpServletRequest req) {
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		String str_tagList = service.showTag(seq_tbl_board);

		req.setAttribute("str_tagList", str_tagList);
		

		return "tagListJSON.notiles";
	}
	
	// 한 게시글의 위치주소 보기(ajax) 
	@RequestMapping(value = "/showLoc.re", method = {RequestMethod.GET})
	public String showLoc(HttpServletRequest req) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		String str_loc = service.showLoc(seq_tbl_board);

		req.setAttribute("str_loc", str_loc);

		return "showLocJSON.notiles";
	}
	
	// 하트 찍었는지 확인하기(ajax) 
	@RequestMapping(value = "/heartCheck.re", method = {RequestMethod.GET})
	public String heartCheck(HttpServletRequest req) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String login_id = req.getParameter("login_id");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("login_id", login_id);
		
		String str_heartcheck = service.heartCheck(map);
		
		req.setAttribute("str_heartcheck", str_heartcheck);

		return "heartCheckJSON.notiles";
	}
	
	// 하트 갯수 갱신하기(ajax) 
	@RequestMapping(value = "/heartCounting.re", method = {RequestMethod.GET})
	public String heartCounting(HttpServletRequest req) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		String str_heartCounting = service.heartCounting(seq_tbl_board);
		
		req.setAttribute("str_heartCounting", str_heartCounting);

		return "heartCountingJSON.notiles";
	}
	
	// 댓글 갯수 갱신하기(ajax) 
	@RequestMapping(value = "/reCounting.re", method = {RequestMethod.GET})
	public String reCounting(HttpServletRequest req) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		String str_reCounting = service.reCounting(seq_tbl_board);
		
		req.setAttribute("str_reCounting", str_reCounting);

		return "reCountingJSON.notiles";
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
	public String writeReply(HttpServletRequest req, HttpSession session) {
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String re_content = req.getParameter("re_content");
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		String maxGroupno = service.maxGroupno(); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("re_content", re_content);
		map.put("login_id", login_id);
		map.put("maxGroupno", maxGroupno);
		
		int n = service.writeReply(map);
		
		JSONObject jsonObj = new JSONObject();
		
		
		if (n == 1) {
			
			jsonObj.put("msg", "댓글 쓰기에 성공하였습니다.");
			
			String str_writeReply = jsonObj.toString();
			
			req.setAttribute("str_writeReply", str_writeReply);
			
			return "writeReplyJSON.notiles";
			
		}
		else {
			
			String msg = "댓글 쓰기에 실패하였습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";

		}
	}
	
	// 대댓글 쓰기
	@RequestMapping(value = "/writeReRe.re", method = {RequestMethod.GET})
	public String writeReRe(HttpServletRequest req, HttpSession session) {
		
		String re_seq = req.getParameter("re_seq");
		String re_groupno = req.getParameter("re_groupno");
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String re_content = req.getParameter("re_content");
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("re_seq", re_seq);
		map.put("re_groupno", re_groupno);
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("re_content", re_content);
		map.put("login_id", login_id);
		
		int n = service.writeReRe(map);
		
		JSONObject jsonObj = new JSONObject();
		
		if (n == 1) {
			
			jsonObj.put("msg", "댓글 쓰기에 성공하였습니다.");
			
			String str_writeReRe = jsonObj.toString();
			
			req.setAttribute("str_writeReRe", str_writeReRe);
			
			return "writeReReJSON.notiles";
			
		}
		else {
			
			String msg = "댓글 쓰기에 실패하였습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";

		}
		
		
	}
	
	// 덧글 삭제
	@RequestMapping(value = "/deleteReply.re", method = {RequestMethod.GET})
	public String deleteReply(HttpServletRequest req) {
		
		String re_seq = req.getParameter("re_seq");
		String re_groupno = req.getParameter("re_groupno");
		String re_depthno = req.getParameter("re_depthno");
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("re_seq", re_seq);
		map.put("re_groupno", re_groupno);
		map.put("re_depthno", re_depthno);
		
		int n = service.deleteReply(map);
		
		JSONObject jsonObj = new JSONObject();
		
		if (n == 1) {
			
			jsonObj.put("msg", "댓글이 삭제되었습니다.");
			
			String str_deleteRe = jsonObj.toString();
			
			req.setAttribute("str_deleteRe", str_deleteRe);
			
			return "deleteReJSON.notiles";
			
		}
		else {
			
			String msg = "댓글 삭제에 실패하였습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";

		}
	}
	
	// 하트
	@RequestMapping(value = "/addHeart.re", method = {RequestMethod.GET})
	public String addHeart(HttpServletRequest req, HttpSession session) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String fk_login_id = req.getParameter("fk_login_id");
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		//System.out.println(seq_tbl_board+ fk_login_id+ login_id);

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("fk_login_id", fk_login_id);
		map.put("login_id", login_id);
		
		
		int n = service.addHeart(map);
		
		JSONObject jsonObj = new JSONObject();
		
		
		if (n == 1) {
			
			jsonObj.put("msg", "좋아요 성공!");
			
			String str_addHeart = jsonObj.toString();
			
			req.setAttribute("str_addHeart", str_addHeart);
			
			return "addHeartJSON.notiles";
			
		}
		else {
			
			String msg = "좋아요 누르기에 실패하였습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";

		}
		
		
	}
	
	// 하트 취소
	@RequestMapping(value = "/deleteHeart.re", method = {RequestMethod.GET})
	public String deleteHeart(HttpServletRequest req, HttpSession session) {
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		//System.out.println(seq_tbl_board+ fk_login_id+ login_id);

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("login_id", login_id);
		
		
		int n = service.deleteHeart(map);
		
		JSONObject jsonObj = new JSONObject();
		
		
		if (n == 1) {
			
			jsonObj.put("msg", "취소 성공!");
			
			String str_deleteHeart = jsonObj.toString();
			
			req.setAttribute("str_deleteHeart", str_deleteHeart);
			
			return "deleteHeartJSON.notiles";
			
		}
		else {
			
			String msg = "좋아요 누르기에 실패하였습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";

		}
	}
		
	// 게시글 첨부파일 다운로드
	@RequestMapping(value = "/downloadBoard.re", method = {RequestMethod.GET})
	public String downloadBoard() {
		
		// 
		
		return "";
	}

}
