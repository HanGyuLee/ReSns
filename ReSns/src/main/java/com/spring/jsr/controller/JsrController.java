package com.spring.jsr.controller;



import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.jdh.model.LoginVO;
import com.spring.jsr.model.QuestionBoardReplyVO;
import com.spring.jsr.model.QuestionBoardVO;
import com.spring.jsr.service.InterJsrService;
import com.spring.pek.model.BoardVO;


@Controller
@Component  //주 업무 클래스 선언
public class JsrController {
	
	//의존객체 주입(DI:Dependency injection)
	@Autowired
	private InterJsrService service;
	
	
	//팔로우,팔로워 리스트 페이지 요청
	@RequestMapping(value="/followList.re", method={RequestMethod.GET})
	public String followListView(HttpServletRequest req, HttpSession session){	

		//HashMap<String,String> map = new HashMap<String,String>();

		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = null;

		
		if(loginUser == null){	
			return "jdh/loginform.tiles";
		}

		else{
			login_id = loginUser.getLogin_id();
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		//String userid = "qqii";// 세션이 없어서 일단 qqii로 시작 하기.

		List<HashMap<String, String>> followList = service.followList(map);
		List<HashMap<String, String>> followerList = service.followerList(map);
		
		req.setAttribute("followList", followList); //팔로우
		req.setAttribute("followerList", followerList);//팔로워
		

		return "jsr/followList.tiles";
	}//end of public String followListView(HttpServletRequest req, HttpSession session)

	
	//팔로우 하기
	@RequestMapping(value="/followAdd.re", method={RequestMethod.POST})
	public String requireLogin2_followAdd(HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Throwable{	
	
		
	String follow_id = req.getParameter("followId");	
	
	LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
	String login_id = null;	
	//임시로 로그인 체크
	
	
	if(loginUser != null){
		login_id = loginUser.getLogin_id();
	}



	HashMap<String, String> map = new HashMap<String, String>();
	map.put("follow_id", follow_id.trim());
	map.put("login_id", login_id);
	
	
	
	int n = service.followAdd(map);
	
	String msg = "";
	
	if (n <= 0){
	if(n == 0){
	msg = "팔로우 실패!";
	
	}
	
	else if(n == -3){
	msg = "이미 팔로우 함!";
	
	}
	String loc = "javascript:history.back();";
	
	req.setAttribute("msg", msg);
	req.setAttribute("loc", loc);
	return "msg.notiles";	
	}
	
	//리스트 실시간으로 다시 확인 위해 리스트 값 넘겨주기
	else{
		List<HashMap<String, String>> followList = service.followList(map);
		req.setAttribute("followList", followList);
	}
	
	
	return "jsr/followList.tiles";	
	}//end of 
	
	
	//언팔로우 하기
	@RequestMapping(value="/unFollowAdd.re", method={RequestMethod.POST})
	public String requireLogin2_unFollowAdd(HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Throwable{	
		
		String unFollow_id = req.getParameter("unFollowId");	
		
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = null;	
		//임시로 로그인 체크
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

			
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("follow_id", unFollow_id.trim());
		map.put("login_id", login_id);
		
		int n = service.unFollow(map);
		
		String msg = "";

		if(n == 0){
		msg = "언팔로우 실패!";
		
		}
		
		else if(n == -3){
		msg = "이미 언팔로우 하였거나, 팔로우 상태가 아닙니다.";
		
		}
		

		
		//리스트 실시간으로 다시 확인 위해 리스트 값 넘겨주기 , 이건 나중에 지워도 됨
		else{
			
			msg = "언 팔로우 성공!";
			List<HashMap<String, String>> followList = service.followList(map);
			req.setAttribute("followList", followList);
		}
		
		String loc = "javascript:history.back();";
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
	return "msg.notiles";
	}
	
	
	//팔로우 메인 확인하기
	@RequestMapping(value="/followmain.re", method={RequestMethod.GET})
	public String requireLogin2_followmain(HttpServletRequest req, HttpServletResponse res, HttpSession session) {	

		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		//System.out.println("login_id확인::"+login_id);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		
		//내가 팔로우 하는 사람 글목록 가져오기
		List<BoardVO> followBoard = service.followboard(map);
	
		req.setAttribute("followBoard", followBoard);
		
		
		
	return "jsr/followmain.tiles";
	}
	

	
	//팔로우 게시글 리스트 댓글 가져오기
	@RequestMapping(value="/followmainre.re", method={RequestMethod.GET})
	public String followmainre(HttpServletRequest req, HttpSession session) {	
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");

		//댓글 내용 가져오기
		String str_jsonMap = service.followre(seq_tbl_board);
		
		req.setAttribute("str_jsonMap",str_jsonMap);

		
	return "followreJSON.notiles";
	}
	
	
	
	//팔로우 게시글 내용과 태그 가져오기
	@RequestMapping(value="/followmainConTag.re", method={RequestMethod.GET})
	public String followmainConTag(HttpServletRequest req, HttpSession session) {	
		

		String seq_tbl_board = req.getParameter("seq_tbl_board");

		
		//댓글 내용 가져오기
		String str_jsonMap = service.followConTag(seq_tbl_board);
		
		req.setAttribute("str_jsonMap",str_jsonMap);
	
	return "followtagJSON.notiles";
	}
	

	//백문백답 게시판 질문 작성하는 폼 페이지 요청
	@RequestMapping(value="/questionBoardAdd.re", method={RequestMethod.GET})
	public String requireLogin2_questionAdd(HttpServletRequest req,HttpServletResponse res,HttpSession session){
	
	//게시판 주인 아이디를 받아 와야 한다.
		
		
	return "jsr/questionBoardAdd.tiles2";
	}//end of public String questionAdd()
	
	
	
	//백문백답 게시판 질문 작성 완료 요청
	@RequestMapping(value="/questionAddEnd.re", method={RequestMethod.POST})
	public String questionAddEnd(QuestionBoardVO qboardvo, HttpServletRequest req,HttpSession session){
	

	 int n=service.queAdd(qboardvo);
	
	 req.setAttribute("n", n);
		
	return "jsr/questionAddEnd.tiles2";
	}//end of public String questionAddEnd()
	
	

	//백문백답 게시판 목록 요청
	@RequestMapping(value="/questionList.re", method={RequestMethod.GET})
	public String requireLogin2_questionList(HttpServletRequest req,HttpServletResponse res,HttpSession session){
	
		List<QuestionBoardVO> queBoardList =null;
		
		//현재 로그인한 회원 아이디 가지고 오기.
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = loginUser.getLogin_id();
		
		String fk_login_id = "qqii";//일단 임의로 qqii를 넣어준다.
		//여기에는 게시판 주인 아이디가 들어가야 한다.
		
		//게시판  주인인 경우 다른 페이지로 리턴하게 해주거나 리스트에서 보여주기를 다르게 해야한다.
		
		
		HashMap<String,String> map =  new HashMap<String,String>();
		map.put("login_id", login_id);
		map.put("fk_login_id", fk_login_id);
		
		queBoardList = service.qeBoardList(map);
		
		req.setAttribute("queBoardList", queBoardList);
	
		
		return "jsr/questionList.tiles2";
	}//end of public String questionList()
	
	
	//백문백답 게시판 글 1개 보기
	@RequestMapping(value="/questionView.re", method={RequestMethod.GET})
	public String requireLogin2_questionView(HttpServletRequest req,HttpServletResponse res,HttpSession session){
		
		String seq_tbl_q = req.getParameter("seq_tbl_q");
		//System.out.println("테스트seq"+seq_tbl_q);
		
		int numberck=0;
		
		
		if(seq_tbl_q != null){//사용자가 임의로 seq를 문자로 입력하였을 때 막기
	    for(int i=0; i<seq_tbl_q.length(); i++) {
            char ch = seq_tbl_q.charAt(i);
        
            if(ch<'0' || ch>'9') {
    			numberck= 1;
    			//return "msg.notiles";
            }
        }
		}	
		if(numberck == 1){
			req.setAttribute("msg", "비정상적인 경로로 접속하였습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";	
		}
		
		
		//문자 입력하였을 때 막기 끝.
		
		//답변 가져오기
		QuestionBoardReplyVO replay = service.getReply(seq_tbl_q);
		if (replay != null){
			String a_content = replay.getA_content();
			a_content = a_content.replaceAll("\r\n", "<br/>");
			replay.setA_content(a_content);		
			req.setAttribute("replay", replay);
		}
		else{
			req.setAttribute("replay", replay);
		}
		//질문 가져오기
		QuestionBoardVO getques =  service.getQView(seq_tbl_q);	
		
		//없는 seq를 검색하였을 때
		if(getques == null){
			
			req.setAttribute("msg", "비정상적인 경로로 접속하였습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";
		}
		//없는 seq를 검색하였을 때 막기 끝.
		
		String q_content = getques.getQ_content();
		q_content =  q_content.replaceAll("\r\n", "<br/>");
		getques.setQ_content(q_content);
		//System.out.println("질문확인:"+getques);
		
		req.setAttribute("getques", getques);

		
		return "jsr/questionView.tiles2";
	}//end of public String questionView()
	
	//백문백답 답변 댓글 작성하기 요청
	@RequestMapping(value="/questionReEnd.re", method={RequestMethod.POST})
	public String requireLogin2_replyAdd(HttpServletRequest req,HttpServletResponse res,HttpSession session, QuestionBoardReplyVO qbrvo)
			throws Throwable{
		String seq_tbl_q = req.getParameter("fk_seq_tbl_q");
		System.out.println(qbrvo.getA_content());
		System.out.println(qbrvo.getFk_login_id());
		System.out.println(qbrvo.getFk_seq_tbl_q());
		int result = service.QboardRe(qbrvo);
		
		
		if(result >0){
			
			req.setAttribute("msg","답변 쓰기 완료" );
		}
		
		else {
			req.setAttribute("msg","답변 쓰기 실패" );
			
		}
         
		String gobackURL= "/resns/questionView.re?seq_tbl_q="+seq_tbl_q;
		req.setAttribute("loc", gobackURL);
		
		req.setAttribute("seq_tbl_q", seq_tbl_q);
		
		return "msg.notiles";
	}//end of public String replyAdd()
	

	
	//백문백답 답변 삭제 요청
	@RequestMapping(value="/questionReDel.re", method={RequestMethod.POST})
	public String qreplyDel(HttpServletRequest req,HttpServletResponse res,HttpSession session) throws Throwable{
		String fk_seq_tbl_q = req.getParameter("fk_seq_tbl_q");
		String gobackURL = req.getParameter("gobackURL");
		
		
		int result = service.qreplyDel(fk_seq_tbl_q);
		
		if (result == 1){
			gobackURL = "/resns/questionView.re?seq_tbl_q="+fk_seq_tbl_q;
			req.setAttribute("msg", "댓글 삭제 성공!");
			req.setAttribute("loc", gobackURL);
			
		}
		
		else{
			req.setAttribute("msg", "댓글 삭제 실패!");
			req.setAttribute("loc", gobackURL);
		}
		
		
		
		return "msg.notiles";
	}//end of public String replyDel()
	

	
	//백문백답 질문 삭제 요청
	@RequestMapping(value="/questionDel.re", method={RequestMethod.POST})
	public String questionDelEnd(HttpServletRequest req,HttpServletResponse res,HttpSession session){
		String seq_tbq_q = req.getParameter("seq_tbl_q");
		System.out.println("삭제 seq_tbq_q::"+seq_tbq_q);
		int result = service.qdel(seq_tbq_q);
		
		if (result == 1){
			req.setAttribute("msg", "삭제 성공!");
			req.setAttribute("loc", "/resns/questionList.re");
			
		}
		
		else{
			req.setAttribute("msg", "삭제 실패!");
			req.setAttribute("loc", "/resns/questionList.re");
		}
		
	
			req.setAttribute("result", result);;
		return "msg.notiles";
	}//end of public String questionDel()
	


	
	
}
