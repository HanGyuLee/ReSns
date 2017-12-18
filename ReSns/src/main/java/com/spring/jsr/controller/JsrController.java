package com.spring.jsr.controller;




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

import com.spring.common.JsrUtill;
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
	
	Object obj = session.getAttribute("loginUser");
	
	String login_id = null;	
	if (obj != null) {
		LoginVO loginUser = (LoginVO)obj;
	
	if(loginUser != null){
		login_id = loginUser.getLogin_id();
	}

	}
	
	

	HashMap<String, String> map = new HashMap<String, String>();
	map.put("follow_id", follow_id);
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
	
	else if(n == -4){
		msg = "내가 나를 팔로우 못함!";	
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
		
		
		Object obj = session.getAttribute("loginUser");
		
		String login_id = null;	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

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
	public String requireLogin_followmain(HttpServletRequest req, HttpServletResponse res, HttpSession session) {	

		String login_id = "";	
		
		Object obj = session.getAttribute("loginUser");
		
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
	
		
		
		
		//System.out.println("login_id확인::"+login_id);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		
		
		String str_Showp = req.getParameter("cShowp");
		
		int totalcount = 0; //총 게시물 건수
		int sizep = 3 ;//한페이지당 보여줄 게시물 수
		int cShowp = 0; //현재 보여줄 페이지 번호 
		int totalPage = 0;//총 페이지수(웹브라우저상에 보여줄 총 페이지수)
		int startRno = 0;//시작번호
		int endRno = 0;//끝 행 번호
		int blockSize = 5;//"페이지바"에 보여줄 페이지의 갯수
		
		if(str_Showp == null){
			cShowp =1;
			//검색화면 초기화
		}
		
		else{
			cShowp =  Integer.parseInt(str_Showp);
			//null이 아니면 현재 보고 있는 페이지 숫자를 넣어주겠다.
		}
		startRno = ( (cShowp-1)*sizep) +1;
		endRno = startRno +sizep -1;
		
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		//System.out.println("startRno확인"+startRno);
		//System.out.println("endRno확인"+endRno);
		
		//내가 팔로우 하는 사람 글목록 가져오기
		List<BoardVO> followBoard = service.followboard(map);

		
		
		totalcount = service.getFollowMainTotalCount(map);
			
		
		totalPage = (int)Math.ceil((double) totalcount/sizep);
		
		String pagebar = "<ul>";
		pagebar += JsrUtill.getPageBarFallowMain(totalcount, sizep, cShowp, totalPage, blockSize, "followmain.re");
		//pagebar += MyUtil.getPageBarWithSearch(sizep, blockSize, totalPage, cShowp, null, qsearch, null, "questionList.re");
		pagebar += "</ul>";
		
		
		String gobackURL = "followmain.re?cShowp="+cShowp+"&sizep="+sizep;
		
		
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("totalcount", totalcount);
		req.setAttribute("login_id", login_id);
		//req.setAttribute("sizep", sizep);
		//req.setAttribute("cShowp", cShowp);
		req.setAttribute("gobackURL", gobackURL);
		
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

		
	return "jsrnotiles/followreJSON.notiles";
	}
	
	
	
	//팔로우 게시글  태그 가져오기
	@RequestMapping(value="/followmainTag.re", method={RequestMethod.GET})
	public String followmainTag(HttpServletRequest req, HttpSession session) {	
		

		String seq_tbl_board = req.getParameter("seq_tbl_board");

		
		//댓글 내용 가져오기
		String str_jsonMap = service.followTag(seq_tbl_board);
		
		req.setAttribute("str_jsonMap",str_jsonMap);
	
	return "jsrnotiles/followtagJSON.notiles";
	}
	
	
	//팔로우 게시글 내용과  더 가져오기
	@RequestMapping(value="/followmainCon.re", method={RequestMethod.GET})
	public String followmainCon(HttpServletRequest req, HttpSession session) {	
		
		
		String seq_tbl_board = req.getParameter("seq_tbl_board");
		//System.out.println("seq_tbl_board확인"+seq_tbl_board);
		
		//댓글 내용 가져오기
		String str_jsonMap = service.followCon(seq_tbl_board);
		//System.out.println("str_jsonMap"+str_jsonMap);
		
		req.setAttribute("str_jsonMap",str_jsonMap);
	
	return "jsrnotiles/followConJSON.notiles";
	}
	
	
	

	//백문백답 게시판 질문 작성하는 폼 페이지 요청
	@RequestMapping(value="/questionBoardAdd.re", method={RequestMethod.GET,RequestMethod.POST})
	public String requireLogin_questionAdd(HttpServletRequest req,HttpServletResponse res,HttpSession session){
	
		String method = req.getMethod();
		if ("get".equalsIgnoreCase(method)){
			req.setAttribute("msg", "비정상적인 경로로 접근하였습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";
		}
	
		Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
	//게시판 주인 아이디를 받아 와야 한다.
	String fk_login_id = req.getParameter("fk_login_id");
	String gobackURL = req.getParameter("gobackURL");

	
	//System.out.println("gobackURL 확인"+gobackURL);
	req.setAttribute("fk_login_id", fk_login_id);	
	req.setAttribute("gobackURL", gobackURL);	
	req.setAttribute("ask_id", login_id);	
	
	return "jsr/questionBoardAdd.tiles2";
	}//end of public String questionAdd()
	
	
	
	//백문백답 게시판 질문 작성 완료 요청
	@RequestMapping(value="/questionAddEnd.re", method={RequestMethod.POST})
	public String questionAddEnd(QuestionBoardVO qboardvo, HttpServletRequest req,HttpSession session)throws Throwable{

	
	
/*	String method = req.getMethod();
	if ("get".equalsIgnoreCase(method)){
		req.setAttribute("msg", "비정상적인 경로로 접근하였습니다.");
		req.setAttribute("loc", "/resns/index.re");
		return "msg.notiles";
	}
	*/
	
	 int n=service.queAdd(qboardvo);
		
	 String fk_login_id = req.getParameter("fk_login_id");
	 String gobackURL = "questionList.re?fk_login_id="+fk_login_id;
	 
	 if (n>0){
		req.setAttribute("msg", "질문작성 성공!");
		req.setAttribute("loc", gobackURL);
		 
	 }

	req.setAttribute("fk_login_id", fk_login_id);	
	req.setAttribute("gobackURL", gobackURL);	
	
	 req.setAttribute("n", n);
	 
	return "msg.notiles";
	}//end of public String questionAddEnd()
	
	

	//백문백답 게시판 목록 요청
	@RequestMapping(value="/questionList.re", method={RequestMethod.GET})
	public String requireLogin_questionList(HttpServletRequest req,HttpServletResponse res,HttpSession session){
	
		List<QuestionBoardVO> queBoardList =null;
		LoginVO loginUser = null;
	
		//현재 로그인한 회원 아이디 가지고 오기.
		
		Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
		
		
		String fk_login_id = req.getParameter("fk_login_id");//일단 임의로 qqii를 넣어준다.
		//System.out.println("fk_login_id확인:"+fk_login_id);
		
		if(fk_login_id ==null || fk_login_id.isEmpty()){
			req.setAttribute("msg", "비정상적인 경로로 접근하였습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";		
		}
		//여기에는 게시판 주인 아이디가 들어가야 한다.		
/*		String fk_login_id = req.getParameter("fk_login_id");
			*/
		
		String qsearch = req.getParameter("qsearch");
	//게시판  주인인 경우 다른 페이지로 리턴하게 해주거나 리스트에서 보여주기를 다르게 해야한다.
		HashMap<String,String> map =  new HashMap<String,String>();
		map.put("login_id", login_id);
		map.put("fk_login_id", fk_login_id);
		map.put("qsearch", qsearch);
		
		
		
		String str_Showp = req.getParameter("cShowp");
		
		int totalcount = 0; //총 게시물 건수
		int sizep = 5 ;//한페이지당 보여줄 게시물 수
		int cShowp = 0; //현재 보여줄 페이지 번호 
		int totalPage = 0;//총 페이지수(웹브라우저상에 보여줄 총 페이지수)
		int startRno = 0;//시작번호
		int endRno = 0;//끝 행 번호
		int blockSize = 5;//"페이지바"에 보여줄 페이지의 갯수
		
		if(str_Showp == null){
			cShowp =1;
			//검색화면 초기화
		}
		
		else{
			cShowp =  Integer.parseInt(str_Showp);
			//null이 아니면 현재 보고 있는 페이지 숫자를 넣어주겠다.
		}
		startRno = ( (cShowp-1)*sizep) +1;
		endRno = startRno +sizep -1;
		
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		//System.out.println("startRno확인"+startRno);
		//System.out.println("endRno확인"+endRno);
		
		if(qsearch!=null && !qsearch.trim().isEmpty() && !qsearch.equalsIgnoreCase("null")){ //검색 있을 때
			queBoardList = service.qeBoardList2(map);
			
		}
		else {//검색어 없을 때
			queBoardList = service.qeBoardList(map);
			
		}
		
		
		//총 게시물 수를 구한다
		
		if(qsearch!=null && !qsearch.trim().isEmpty() && !qsearch.equalsIgnoreCase("null")){ //검색 있을 때
			totalcount = service.getTotalCount2(map);
		}
		
		else {//검색어 없을 때
			totalcount = service.getTotalCount(map);
			
		}
		
		totalPage = (int)Math.ceil((double) totalcount/sizep);
		
		String pagebar = "<ul>";
		pagebar += JsrUtill.getPageBarSearch(totalcount, sizep, cShowp, totalPage, blockSize, qsearch, fk_login_id, "questionList.re");
		//pagebar += MyUtil.getPageBarWithSearch(sizep, blockSize, totalPage, cShowp, null, qsearch, null, "questionList.re");
		pagebar += "</ul>";
		
		
		String gobackURL = "questionList.re?fk_login_id="+fk_login_id+"&cShowp="+cShowp+"&sizep="+sizep+"&qsearch="+qsearch;
		
		
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("totalcount", totalcount);
		req.setAttribute("qsearch", qsearch);
		req.setAttribute("queBoardList", queBoardList);
		req.setAttribute("fk_login_id", fk_login_id);
		req.setAttribute("loginUser", loginUser);
		//req.setAttribute("sizep", sizep);
		//req.setAttribute("cShowp", cShowp);
		req.setAttribute("gobackURL", gobackURL);
	

		return "jsr/questionList.tiles2";
	}//end of public String questionList()
	
	
	//백문백답 게시판 글 1개 보기
	@RequestMapping(value="/questionView.re", method={RequestMethod.GET})
	public String requireLogin2_questionView(HttpServletRequest req,HttpServletResponse res,HttpSession session){
		
		Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
		
		String seq_tbl_q = req.getParameter("seq_tbl_q");
		String gobackURL = req.getParameter("gobackURL");
		String totalcount =  req.getParameter("totalcount");
		//System.out.println("테스트seq"+seq_tbl_q);


		
		//문자 입력하였을 때 막기 끝.
		if(seq_tbl_q ==null || seq_tbl_q.isEmpty()){
			req.setAttribute("msg", "비정상적인 경로로 접근하였습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";		
		}
		
/*		  int len = seq_tbl_q.length();
		  char ch = ' ';
		   for(int i=0; i<len; i++) {
			   ch = seq_tbl_q.charAt(i);
			   if('0' <= ch && ch <= '9') {
				   req.setAttribute("msg", "문자입력했어요.");
					req.setAttribute("loc", "/resns/index.re");
					return "msg.notiles";		
			   }
			   
		   }*/
		
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
			
			req.setAttribute("msg", "데이터가 없습니다.");
			req.setAttribute("loc", "/resns/index.re");
			return "msg.notiles";
		}
		//없는 seq를 검색하였을 때 막기 끝.
		
		String q_content = getques.getQ_content();
		q_content =  q_content.replaceAll("\r\n", "<br/>");
		getques.setQ_content(q_content);
		//System.out.println("질문확인:"+getques);
		
		req.setAttribute("getques", getques);
		req.setAttribute("gobackURL", gobackURL);
		req.setAttribute("totalcount",totalcount);

		
		return "jsr/questionView.tiles2";
	}//end of public String questionView()
	
	//백문백답 답변 댓글 작성하기 요청
	@RequestMapping(value="/questionReEnd.re", method={RequestMethod.POST})
	public String requireLogin2_replyAdd(HttpServletRequest req,HttpServletResponse res,HttpSession session, QuestionBoardReplyVO qbrvo)
			throws Throwable{
		
		
		Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
		
		
		String seq_tbl_q = req.getParameter("fk_seq_tbl_q");
		String gobackURL =  req.getParameter("gobackURL");
		String q_askid = req.getParameter("q_askid");
		
		
		System.out.println(qbrvo.getA_content());
		System.out.println(qbrvo.getFk_login_id());
		System.out.println(qbrvo.getFk_seq_tbl_q());
		
		int result = service.QboardRe(qbrvo,q_askid);
		
		
		if(result >0){
			
			req.setAttribute("msg","답변 쓰기 완료" );
		}
		
		else {
			req.setAttribute("msg","답변 쓰기 실패" );
			
		}
         
		String reflasyVeiw= "/resns/questionView.re?seq_tbl_q="+seq_tbl_q;
		req.setAttribute("loc", reflasyVeiw);
		
		req.setAttribute("seq_tbl_q", seq_tbl_q);
		req.setAttribute("gobackURL", gobackURL);
		
		return "jsrnotiles/msg2.notiles";
	}//end of public String replyAdd()
	

	
	//백문백답 답변 삭제 요청
	@RequestMapping(value="/questionReDel.re", method={RequestMethod.POST})
	public String requireLogin2_qreplyDel(HttpServletRequest req,HttpServletResponse res,HttpSession session) throws Throwable{
	
		Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
		
		String fk_seq_tbl_q = req.getParameter("fk_seq_tbl_q");
		String gobackURL = req.getParameter("gobackURL");
		String reflasyVeiw= "/resns/questionView.re?seq_tbl_q="+fk_seq_tbl_q;
		String fk_login_id= req.getParameter("fk_login_id");
		
		if(login_id.equalsIgnoreCase(fk_login_id)){
	
		//System.out.println("gobackURL확인::"+gobackURL);
		
		int result = service.qreplyDel(fk_seq_tbl_q);
		

		if (result == 1){
			
			req.setAttribute("msg", "댓글 삭제 성공!");
			req.setAttribute("loc", reflasyVeiw);
			req.setAttribute("seq_tbl_q", fk_seq_tbl_q);
			req.setAttribute("gobackURL", gobackURL);
			
		}
		
		else{
			req.setAttribute("msg", "댓글 삭제 실패!");
			req.setAttribute("loc", reflasyVeiw);
			req.setAttribute("seq_tbl_q", fk_seq_tbl_q);
			req.setAttribute("gobackURL", gobackURL);
		}
		
		}
		
		else {
		req.setAttribute("msg", "게시판 주인인 회원만 삭제 가능합니다.");
		req.setAttribute("loc", gobackURL);
		req.setAttribute("loc", reflasyVeiw);
		req.setAttribute("seq_tbl_q", fk_seq_tbl_q);
		
		}
		
		return "jsrnotiles/msg2.notiles";
	}//end of public String replyDel()
	

	
	//백문백답 질문 삭제 요청
	@RequestMapping(value="/questionDel.re", method={RequestMethod.POST})
	public String requireLogin2_questionDelEnd(HttpServletRequest req,HttpServletResponse res,HttpSession session){
		String seq_tbq_q = req.getParameter("seq_tbl_q");
		System.out.println("삭제 seq_tbq_q::"+seq_tbq_q);
		String gobackURL = req.getParameter("gobackURL");
		String fk_login_id = req.getParameter("fk_login_id");
		
		
	Object obj = session.getAttribute("loginUser");
		
		String login_id = "";	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}
		
		if(login_id.equalsIgnoreCase(fk_login_id)){	
		int result = service.qdel(seq_tbq_q);

		
		if (result == 1){
			req.setAttribute("msg", "삭제 성공!");
			req.setAttribute("loc", gobackURL);
			
		}
		
		else{
			req.setAttribute("msg", "삭제 실패!");
			req.setAttribute("loc", gobackURL);
		}
		
			req.setAttribute("result", result);;
			req.setAttribute("seq_tbq_q", seq_tbq_q);
			req.setAttribute("fk_login_id", fk_login_id);
			req.setAttribute("gobackURL", gobackURL);
		}
		
		else {
			req.setAttribute("msg", "게시판 주인인 회원만 삭제 가능합니다.");
			req.setAttribute("loc", gobackURL);
			req.setAttribute("gobackURL", gobackURL);
			
		}

			
		return "jsrnotiles/msg2.notiles";
	}//end of public String questionDel()
	
	
	//자동완성
	@RequestMapping(value="/searchAutoEnd.re", method={RequestMethod.GET})
	public String searchAuto(HttpServletRequest req){
		
		String qsearch = req.getParameter("qsearch");
		String fk_login_id = req.getParameter("fk_login_id");
		//System.out.println("qsearch::"+qsearch);
		//System.out.println("fk_login_id::"+fk_login_id);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qsearch", qsearch);
		map.put("fk_login_id", fk_login_id);
		
		String str_jsonMap = service.wordQSearch(map);
		
		req.setAttribute("str_jsonMap", str_jsonMap);
		
		
		return "jsrnotiles/qsearchJSON.notiles";
	}//end of searchAuto
	

// ----------------------------------------------------------------------------------------------------------------------------------------------
	
	//은경씨에게 이야기 할거----> 게시글 비공개 처리 하면서 태그랑 지워버리고, 그 후에 다시  글 공개로 돌리면 태그는 null이 되면서 리스트가 이상해짐 ㅠㅠ...
	// 대댓글 접기 가능!
	//규리씨에게 이야기 할거--> 알람 테이블이 자식테이블이여서 글을 삭제 할수가 없음...ㅠㅠ......fk할 때 온케스케이드를 붙이거나, 참조가 아니게 하기.
	
	
	
	//블락 하기!!!!

	@RequestMapping(value="/followBlock.re", method={RequestMethod.GET})
	public String followma(HttpServletRequest req, HttpSession session) {	
	
		String block_id = req.getParameter("fk_login_id");	
		
		Object obj = session.getAttribute("loginUser");
		
		String login_id = null;	
		if (obj != null) {
			LoginVO loginUser = (LoginVO)obj;
		
		if(loginUser != null){
			login_id = loginUser.getLogin_id();
		}

		}


		HashMap<String, String> map = new HashMap<String, String>();
		map.put("block_id", block_id);
		map.put("login_id", login_id);
		
		//int n = service.blockAdd(map);
		
		
	
	return "";
	}
	
	
	
}
