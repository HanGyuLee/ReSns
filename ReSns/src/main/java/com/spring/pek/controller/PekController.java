package com.spring.pek.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.common.FileManager;
import com.spring.common.MyUtil;
import com.spring.jdh.model.LoginVO;
import com.spring.jdh.service.InterSnsService;
import com.spring.jsr.service.InterJsrService;
import com.spring.jsr.service.JsrService;
import com.spring.pek.model.BimageVO;
import com.spring.pek.model.MessageVO;
import com.spring.pek.model.TagVO;
import com.spring.pek.service.InterPekService;

@Controller
@Component
public class PekController {
	
	@Autowired
	private InterPekService service;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private InterJsrService jsrervice;
	
	// 글 목록 보기 (인기페이지)
	@RequestMapping(value = "/index.re", method = {RequestMethod.GET})
	public String index(HttpServletRequest req, HttpSession session) {
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		List<HashMap<String, String>> boardList = service.getBoardList();
		
		if(boardList != null && boardList.size() > 0) {
			
			for (int i=0; i<boardList.size(); i++) {
				
				HashMap<String, String> map = boardList.get(i);
				
				String board_content = map.get("BOARD_CONTENT");
				board_content = board_content.replaceAll("\r\n", "<br/>");
				
				map.put("BOARD_CONTENT", board_content);
				
			}// end of for---------------------------------

		}
		
		else {
			
		}
		
		req.setAttribute("loginUser", loginUser);
		req.setAttribute("boardList", boardList);		
		
		return "index.tiles";
	}
	
	
	// 모든 태그 보기 (워드 클라우드용)
	@RequestMapping(value = "/showAllTag.re", method = {RequestMethod.GET})
	public String showAllTag(HttpServletRequest req, HttpSession session) {
		
		List<TagVO> tagList = service.showAllTag();
		
		JSONArray jsonMap = new JSONArray();
		
		if (tagList != null) {
			for (TagVO tag : tagList) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("tag_content", tag.getTag_content());
				
				jsonMap.put(jsonObj);
				
			}
		}
		
		String str_tagList = jsonMap.toString();
		
		req.setAttribute("str_tagList", str_tagList);
		
		
		return "allTagJSON.notiles";
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
		
		return "/pek/writeBoard.tiles";
	}
	
	// 글쓰기 완료
	@RequestMapping(value = "/writeBoardEnd.re", method = {RequestMethod.POST})
	public String writeBoardEnd(BimageVO bimagevo, HttpServletRequest req, HttpSession session) {
		
		String map_we = req.getParameter("map_we");
		String map_ky = req.getParameter("map_ky");
		String map_name = req.getParameter("map_name");
		
		//System.out.println("경도 위도 위치: "+map_we+map_ky+map_name);
		
		String board_status = req.getParameter("board_status");
		String board_content = req.getParameter("board_content");
		String tag_content = req.getParameter("tag_content");
		
		//System.out.println("태그내용: "+tag_content);
		
		//String bimg_orgfilename = req.getParameter("bimg_orgfilename");
		
		//System.out.println("파일이름: "+bimg_orgfilename);
		
		String loc = req.getParameter("loc");
		
		//System.out.println("위치켜기: "+loc);
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("map_we", map_we);
		map.put("map_ky", map_ky);
		map.put("map_name", map_name);
		map.put("board_status", board_status);
		map.put("board_content", board_content);
		map.put("tag_content", tag_content);
		map.put("login_id", login_id);
		
		
		int boardResult = service.addBoard(map);
		
		if (boardResult == 1) {
			
			int maxSeq = service.maxSeq();
			
			map.put("maxseq", String.valueOf(maxSeq));        
			
			if (!tag_content.trim().isEmpty()) {		// 해시태그를 썼다면	
				service.addTag(map);
			}
			
			if (Integer.parseInt(loc) == 1) {		// 위치를 켰다면
				service.addLoc(map);
			}
			
			if (!bimagevo.getAttach().isEmpty()) {	// 파일이 있다면
				
				//System.out.println("파일: "+bimagevo.getAttach());
				String root = session.getServletContext().getRealPath("/");
				String path = root + "resources"+File.separator+"images";
				
				
				String newFileName = "";
				
				byte[] bytes = null;
				
				long fileSize = 0;
				
				
				try {
						bytes = bimagevo.getAttach().getBytes();
					    // getBytes()는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다. 
				   
						newFileName = fileManager.doFileUpload(bytes, bimagevo.getAttach().getOriginalFilename(), path);
						// 이것이 파일을 업로드 해주는 것이다.
						// boardvo.getAttach().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다. 
						
					
						map.put("newFileName", newFileName);
						// WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
						
						map.put("originalFilename", bimagevo.getAttach().getOriginalFilename());
						// -- 진짜 파일명(강아지.png)   
						// 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
						
						fileSize = bimagevo.getAttach().getSize();
						// 첨부한 파일의 파일크기인데 리턴타입이 long 타입이다.
						
						map.put("fileSize", String.valueOf(fileSize));
						// 첨부한 파일의 크기를 String 타입으로 변경해서 저장함.
						
				   } catch (Exception e) {
						
						e.printStackTrace();
				   }
				
				
				service.addBimage(map);
			}

		}
		
		req.setAttribute("n", boardResult);
				
		return "/pek/writeBoardEnd.tiles";
			
	}

	
	// 글삭제
	@RequestMapping(value = "/deleteBoard.re", method = {RequestMethod.GET})
	public String requireLoginPEK_deleteBoard(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		
		//System.out.println(seq_tbl_board);
		
		
		int n = service.deleteAll(seq_tbl_board);
		
		if (n == 1) {
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources"+File.separator+"images";
			
			String fileName = service.fileName(seq_tbl_board);
			
			
			try {
				
				fileManager.doFileDelete(fileName, path);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			service.deleteImg(seq_tbl_board);
		}
		
		
		req.setAttribute("n", n);
		
		return "/pek/deleteBoardEnd.tiles";
	}
	
	// 덧글 쓰기
	@RequestMapping(value = "/writeReply.re", method = {RequestMethod.GET})
	public String requireLoginPEK_writeReply(HttpServletRequest req, HttpServletResponse response, HttpSession session) {

		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();	
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String re_content = req.getParameter("re_content");
		String fk_login_id = req.getParameter("fk_login_id");
		
		String maxGroupno = service.maxGroupno(); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("re_content", re_content);
		map.put("login_id", login_id);
		map.put("maxGroupno", maxGroupno);
		map.put("fk_login_id", fk_login_id);
		map.put("status", "2");
		
		int n = 0;
		
		try {
			
			n = service.writeReply(map);
		
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObj = new JSONObject();
		
		
		if (n == 1) {
			
			jsonObj.put("msg", "댓글 쓰기에 성공하였습니다.");
			
			String str_writeReply = jsonObj.toString();
			
			req.setAttribute("str_writeReply", str_writeReply);
			
			//System.out.println("====> 댓글insert 함");

		}	
		
		return "writeReplyJSON.notiles";
	}
		
	
	// 대댓글 쓰기
	@RequestMapping(value = "/writeReRe.re", method = {RequestMethod.GET})
	public String requireLoginPEK_writeReRe(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
		String re_seq = req.getParameter("re_seq");
		String re_groupno = req.getParameter("re_groupno");
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String re_content = req.getParameter("re_content");
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		String fk_login_id = req.getParameter("fk_login_id");
		String re_id = req.getParameter("re_id");
		
		/*System.out.println("====================================");
		System.out.println(re_id);*/
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("re_seq", re_seq);
		map.put("re_groupno", re_groupno);
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("re_content", re_content);
		map.put("login_id", login_id);
		map.put("fk_login_id", fk_login_id);
		map.put("re_id", re_id);
		map.put("status", "2");
		
		int n = 0;
		try {
			
			n = service.writeReRe(map);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
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
	public String requireLoginPEK_addHeart(HttpServletRequest req, HttpServletResponse response, HttpSession session) {

		String seq_tbl_board = req.getParameter("seq_tbl_board");
		String fk_login_id = req.getParameter("fk_login_id");
		
		String login_id = "";
		
		Object obj = session.getAttribute("loginUser");
		
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
			
			login_id = loginUser.getLogin_id();
		}
		
		//System.out.println(seq_tbl_board+ fk_login_id+ login_id);

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq_tbl_board", seq_tbl_board);
		map.put("fk_login_id", fk_login_id);
		map.put("login_id", login_id);
		map.put("status", "1");
		
		
		int n = 0;
		try {
			
			n = service.addHeart(map);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
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
	public String requireLoginPEK_deleteHeart(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
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
	

	// 받은 메세지 보기
	@RequestMapping (value="/message.re", method={RequestMethod.GET})
	public String requireLoginPEK_message(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		List<HashMap<String, String>> msgList = service.getMessage(login_id);
		
		req.setAttribute("msgList", msgList);
		
		return "/pek/message.notiles";
	}
	
	// 메세지 상세 보기
	@RequestMapping (value="/msgDetail.re", method={RequestMethod.GET})
	public String msgDetail(HttpServletRequest req) {
		
		String seq_tbl_msg = req.getParameter("seq_tbl_msg");
		
		HashMap<String, String> oneMsg = service.msgDetail(seq_tbl_msg);
		
		String msg_content = oneMsg.get("MSG_CONTENT");
		
		oneMsg.put("MSG_CONTENT", msg_content.replaceAll("\r\n", "<br/>"));
		
		req.setAttribute("oneMsg", oneMsg);
		
		return "/pek/msgDetail.notiles";
	}
	
	
	// 보낸 메세지 보기
	@RequestMapping (value="/sendingMsg.re", method={RequestMethod.GET})
	public String requireLoginPEK_sendingMsg(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		List<HashMap<String, String>> msgList = service.sendedMsg(login_id);
		
		req.setAttribute("msgList", msgList);
		
		return "/pek/sendedMsg.notiles";
	}
	
	// 메세지 폼 호출
	@RequestMapping (value="/writeMsg.re", method={RequestMethod.GET})
	public String writeMsg(HttpServletRequest req, HttpSession session) {
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		
		String login_name = req.getParameter("login_name");
		String msg_send = req.getParameter("msg_send");
		
		if (login_name == null) {
			
			List<HashMap<String, String>> followList = jsrervice.followList(map);
			
			req.setAttribute("followList", followList);
			
			req.setAttribute("login_name", "");

		}
		else {
			req.setAttribute("login_name", login_name);
			req.setAttribute("msg_send", msg_send);
		}
		
		return "/pek/writeMsg.notiles";
	}
	
	
	// 메세지 쓰기 
	@RequestMapping (value="/writeMsgEnd.re", method={RequestMethod.POST})
	public String writeMsgEnd(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		
		String fk_login_id = req.getParameter("fk_login_id");
		String msg_content = req.getParameter("msg_content");
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		//System.out.println("보내는 사람 아이디: "+login_id);
		//System.out.println("받는 사람 아이디: "+fk_login_id);
		//System.out.println("쪽지내용: "+msg_content);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("fk_login_id", fk_login_id);
		map.put("msg_content", msg_content);
		map.put("login_id", login_id);
		map.put("status", "8");
		
		int n= 0;
		
		try {
			
			n = service.writeMsg(map);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		req.setAttribute("n", n);
		
		return "/pek/writeMsgEnd.notiles";
	}
	
	
	// 쪽지 지우기
	@RequestMapping (value="/deleteMsg.re", method={RequestMethod.GET})
	public String deleteMsg(HttpServletRequest req, HttpSession session) {
		
		String seq_tbl_msg = req.getParameter("seq_tbl_msg");
		
		int n = service.deleteMsg(seq_tbl_msg);
		
		req.setAttribute("n", n);
		
		return "/pek/deleteMsgEnd.notiles";
	}

}
