package com.spring.hgl.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.FileManager;
import com.spring.hgl.service.InterHglService;
import com.spring.jdh.model.LoginVO;
import com.spring.jsr.controller.JsrController;
import com.spring.jsr.service.InterJsrService;

@Controller
@Component

public class HglController {
	@Autowired
	private InterHglService service;
	@Autowired
	private InterJsrService JsrService;
	
	@Autowired
	private FileManager fileManager;
	
	
	JsrController JsrCont;
	
	
	// 자기 페이지 
	@SuppressWarnings("null")
	@RequestMapping(value="/mypage.re", method={RequestMethod.GET})
	public String requireLogin2_mypage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
		
		String userid = null;
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		
		userid = loginUser.getLogin_id();			
		
		List<HashMap<String, Object>> myBoardList = service.getMyBoardList(userid);
		List<HashMap<String, Object>> myFollowerList = service.getmyFollowerList(userid);
		List<HashMap<String, Object>> myFollowingList = service.getmyFollowingList(userid);
		
		int myFollowerCnt = service.getmyFollowerCnt(userid);
		int myFollowingCnt = service.getmyFollowingCnt(userid);
		int myBoardCnt = myBoardList.size();
		
		HashMap<String,String> profile = service.getMyProfile(userid);
		HashMap<String,String> mypage =  null;
		HashMap<String,String> insertMypage =  new HashMap<String,String>();
		
		
		String textinput = loginUser.getLogin_name() + "'s Page";
		String textarea = loginUser.getLogin_name() + "의 페이지 입니다";
		
		insertMypage.put("textinput",textinput);
		insertMypage.put("textarea",textarea.replaceAll("\r\n", "<br/>"));
		insertMypage.put("userid",userid);
		
		
		mypage=	service.getMypage(userid);
		
		if(mypage == null){			
			service.insertMyPage(insertMypage);			
			insertMypage = service.getMypage(userid);
			mypage = insertMypage;
		
		}
		req.setAttribute("myBoardCnt", myBoardCnt);
		req.setAttribute("myFollowerCnt", myFollowerCnt);
		req.setAttribute("myFollowingCnt", myFollowingCnt);
		req.setAttribute("mypage", mypage);
		req.setAttribute("profile", profile);
		req.setAttribute("myBoardList", myBoardList);
		req.setAttribute("myFollowerList", myFollowerList);
		req.setAttribute("myFollowingList", myFollowingList);
		
		
		return  "hgl/mypage.tiles2";
		
		
	}// end of mypage
		
	
	// 내 배경사진 바꾸기
	@RequestMapping(value="/updateMyBgEnd.re", method={RequestMethod.POST})
	public String updateMyBgEnd(MultipartHttpServletRequest req,HttpSession session) throws Exception{
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String userid = "";		
		userid = loginUser.getLogin_id();	
		MultipartFile bgFile = req.getFile("fileBg");
		System.out.println("bgFile : "+ bgFile);
		if(bgFile==null){
			String msg = "파일을 선택해주세요 ^^ * ";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}else{
		
		session =  req.getSession();
		ServletContext svlCtx = session.getServletContext();
		String upDir = svlCtx.getRealPath("/images");
		System.out.println("확인용 : " +  upDir);
	
		HashMap<String, Object> bgmap = new HashMap<String, Object>();
		
	
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "images";
		
		String originalFilename = bgFile.getOriginalFilename();
		
		String newFileName = "";
		
		
		byte[] bytes = null;
		
		long fileSize = 0;
		
		 bytes = bgFile.getBytes();
		 
		 newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
		 
		 fileSize = bgFile.getSize();
		 
			
				
			bgmap.put("newFileName", newFileName);
			bgmap.put("originalFilename", originalFilename);
			bgmap.put("fileSize",  String.valueOf(fileSize));
			bgmap.put("userid",userid);
		
					  
		int n = service.updateMyBg(bgmap);
		
		String msg  = (n>0) ? "배경사진 변경 성공 ! "  : "배경사진 변경 실패! ";
		String loc = (n>0) ? "/resns/mypage.re?fk_login_id="+userid : "javascript:history.back();" ;
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";}
	}//  end of updateMyBgEnd
	
	
	// 프로필 사진 바꾸기
	@RequestMapping(value="/updateMyPfEnd.re", method={RequestMethod.POST})
	public String updateMyPfEnd(MultipartHttpServletRequest req,HttpSession session) throws Exception{
		
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String userid = "";		
		userid = loginUser.getLogin_id();	
		MultipartFile pfFile = req.getFile("filePf");
		System.out.println("pfFile: "+ pfFile);
		if(pfFile==null){
			String msg = "파일을 선택해주세요 ^^ * ";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}else{
		
		session =  req.getSession();
		ServletContext svlCtx = session.getServletContext();
		String upDir = svlCtx.getRealPath("/images");
		System.out.println("확인용 : " +  upDir);
	
		HashMap<String, Object> pfmap = new HashMap<String, Object>();
		
	
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "images";
		
		String originalFilename = pfFile.getOriginalFilename();
		
		String newFileName = "";
		
		
		byte[] bytes = null;
		
		long fileSize = 0;
		
		 bytes = pfFile.getBytes();
		 
		 newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
		 
		 fileSize = pfFile.getSize();
		 
			
				
		 pfmap.put("newFileName", newFileName);
		 pfmap.put("originalFilename", originalFilename);
		 pfmap.put("fileSize",  String.valueOf(fileSize));
		 pfmap.put("userid",userid);
		
					  
		int n = service.updateMyPf(pfmap);
		
		String msg  = (n>0) ? "프로필사진 변경 성공 ! "  : "프로필사진 변경 실패! ";
		String loc = (n>0) ? "/resns/mypage.re?fk_login_id="+userid : "javascript:history.back();" ;
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";}
	}// end of updateMyPfEnd
		
	
	// 내페이지의 타이틀, 소개 내용글 변경하기
	@RequestMapping(value="/saveEnd.re", method={RequestMethod.POST})
	public String saveEnd(HttpServletRequest req,HttpSession session){
		
		String userid = "";
		String msg = "";
		String loc = "";
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		
		userid = loginUser.getLogin_id();			
		
		String textinput = req.getParameter("textinput");
		String textarea = req.getParameter("textarea");
		
		if(userid != null){
			HashMap<String,String> map = new HashMap<String,String>();
			map.put( "textinput",textinput);
			map.put( "textarea",textarea);
			map.put("userid",userid);
			int result =0;
			int existCnt = service.existTblMypage(userid);
			
			if(existCnt>0){ // update
				result =  service.updateMyPage(map);
			}else{// insert
				result = service.insertMyPage(map);
			}
			
			
			if(result > 0){
				 msg = "저장 완료" ;
				 loc = "/resns/mypage.re?fk_login_id="+userid;
				
				
			}else{
				 msg = "저장 실패" ;
				 loc = "javascript:history.back();";
			}
			
		}else{
			 msg = "먼저 로그인 하세요" ;
			 loc = "/resns/loginform.re";
		}
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "msg.notiles";
			
		
	}// end of saveEnd
	
	
	// 다른사람 팔로우하기 
	@RequestMapping(value="/followAddEnd.re", method={RequestMethod.POST})
	public String requireLoginPEK_followAddEnd(HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Throwable{
		
		String follow_id = req.getParameter("followId");	
		String msg = "";
		String loc = "";
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");
		String login_id = null;	
		//임시로 로그인 체크
		
		login_id = loginUser.getLogin_id();
		

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("follow_id", follow_id.trim());
		map.put("login_id", login_id);
		
		
		int n = JsrService.followAdd(map);
		System.out.println("n 값 : "  +n);
		
		
		if(n==1){
			msg = "팔로우 성공!";
		}
		else if(n == 0){
			msg = "팔로우 실패!";
		}
		else if(n == -3){
			msg = "이미 팔로우 함!";
		}
		else if(n == -4){
			msg = "내가 나를 팔로우 못함!";	
		}
		loc = "javascript:history.back();";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		return "msg.notiles";
		
		
	}// end of requireLoginPEK_followAddEnd
		
		
		
	// 다른 사용자 페이지
	@RequestMapping(value="/otherspage.re", method={RequestMethod.GET})
	public String otherspage(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
		String userid  = req.getParameter("fk_login_id"); // 페이지주인
		String username = service.getUsername(userid); // 페이지주인 이름
		int alreadyFollowing = 0;
	//	int alreadyMyFollowing=0;
		
		List<HashMap<String, Object>> myBoardList = service.getMyBoardList(userid);
		List<HashMap<String, Object>> myFollowerList = service.getmyFollowerList(userid);
		List<HashMap<String, Object>> myFollowingList = service.getmyFollowingList(userid);
		
		//
		
		//System.out.println(myFollowingList.get(1).get("follow_id"));
		
		
		HashMap<String,String> profile = service.getMyProfile(userid);			
		HashMap<String,String> mypage =  null;
		HashMap<String,String> insertMypage =  new HashMap<String,String>();
	
		
		int myFollowerCnt = myFollowerList.size();
		int myFollowingCnt = myFollowingList.size();
		int myBoardCnt = myBoardList.size();
		
	
		
		String textinput =username+ "'s Page";
		String textarea = username+ "의 페이지 입니다";
				
		
		insertMypage.put("textinput",textinput);
		insertMypage.put("textarea",textarea);
		insertMypage.put("userid",userid);
		
		
		mypage=	service.getMypage(userid);
		
		if(mypage == null){			
			service.insertMyPage(insertMypage);			
			insertMypage = service.getMypage(userid);
			mypage = insertMypage;
			
		}
		
		int n=0;
		if(session.getAttribute("loginUser")!=null){
			
		
		HashMap<String, Object> map = new HashMap<String,Object>();
			
			
			
		
		String loginId = null; // 나
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");		
		loginId = loginUser.getLogin_id();	
		List<String> loginUserFollowingId  = service.getFollowingId(loginId);
		
		System.out.println(loginUserFollowingId);
		System.out.println(loginId);
		
		
		
		for(int i=0; i<loginUserFollowingId.size(); i++){
			if(loginUserFollowingId.get(i).equals(userid)){
				
				alreadyFollowing = 1;
				
			}// end of if
		}// end of for
		
				
		HashMap<String,String> blockmap = new HashMap<String,String>();
			
			blockmap.put("fk_login_id",userid);
			blockmap.put("login_id",loginId);
			
			n = JsrService.followblock(blockmap);
			req.setAttribute("loginUserFollowingName", loginUserFollowingId);
		
			
			
		/*	
			
			for(int i=0; i<myFollowerList.size(); i++){
			
				String id = (String)myFollowerList.get(i).get("fk_login_id");
				
				for(int j=0; j<loginUserFollowingId.size();  j++){
					if(loginUserFollowingId.get(j).equals(id)){
						
						alreadyMyFollowing = 1;
						
					}// end of if
					
				}// end of inner for
				map.put("num"+i, alreadyMyFollowing);
				
				
			}// end of outer for
			
			
			
			System.out.println(myFollowerList);
			*/
			/*req.setAttribute("alreadyFollower", map);
			*/
			
			
		}// end of loginUser if
	
		req.setAttribute("mypage", mypage);	
		req.setAttribute("userid", userid);
		req.setAttribute("profile", profile);
		req.setAttribute("username", username);
		
		req.setAttribute("myFollowerCnt", myFollowerCnt);
		req.setAttribute("myFollowingCnt", myFollowingCnt);		
		req.setAttribute("myBoardCnt", myBoardCnt);
		
		if(n<1){
			req.setAttribute("myBoardList", myBoardList);
			req.setAttribute("alreadyFollowing", alreadyFollowing);
			req.setAttribute("myFollowerList", myFollowerList);
			req.setAttribute("myFollowingList", myFollowingList);
			}
		
		return  "hgl/otherspage.tiles2";
		
		
	}// end of otherspage	
		
	
	// 알람리스트 받아오기
	@SuppressWarnings("null")
	@RequestMapping(value="/myalarm.re", method={RequestMethod.GET})
	public String requireLogin2_myAlarm(HttpServletRequest req,HttpServletResponse response,HttpSession session){		
		
		//List<Integer> theSeq = null;
		
		
		String userid = null;
	//	String alarmMsg = null;
		LoginVO loginUser = (LoginVO)session.getAttribute("loginUser");		
		
		userid = loginUser.getLogin_id();			
		
	//	System.out.println(userid + "유저넘어옴");
		List<HashMap<String, Object>> myAlarmList = service.getMyAlarmList(userid);
		
		String theSeq= "";
	
		JSONArray jsonMap = new JSONArray();
		
		if (myAlarmList != null) {
			for (HashMap<String, Object> alarm : myAlarmList) {
				JSONObject jsonObj = new JSONObject();
				
				String board = (String) alarm.get("fk_seq_tbl_board");
						
				String follow = (String) alarm.get("fk_follow_seq");
				String q = (String) alarm.get("fk_seq_tbl_q");
				String music = (String) alarm.get("fk_seq_tbl_music");
				String msg = (String) alarm.get("fk_seq_tbl_msg");
				
				if(!"0".equals(board)){
					//theSeq.add(board);
					theSeq = board;
				}else if(!"0".equals(follow)){
					//theSeq.add(follow);
					theSeq = follow;
				}else if(!"0".equals(q)){
					//theSeq.add(q);
					theSeq = q;
				}else if(!"0".equals(music)){
					//theSeq.add(music);
					theSeq = music;
				}else if(!"0".equals(msg)){
					//theSeq.add(music);
					theSeq = msg;
				}
				
				
				String alarm_type = (String) alarm.get("alarm_type");
				String url = "";
				switch(alarm_type){
				case "1": 
					alarm_type =" 게시물을 좋아합니다";
					url = "/resns/alaramBoard.re?seq_tbl_board="+theSeq;
					break;
				case "2": 
					alarm_type =" 게시물에 댓글을 남겼습니다 ";
					url = "/resns/alaramBoard.re?seq_tbl_board="+theSeq;
					break;
				case "3": 
					alarm_type =" 내 댓글에 대댓글을 남겼습니다";
					url = "/resns/alaramBoard.re?seq_tbl_board="+theSeq;
					break;
				case "4": 
					alarm_type =" 나를 팔로우합니다";
					url = "/resns/otherspage.re?fk_login_id="+alarm.get("fk_login_id");
					break;
				case "5": 
					alarm_type =" 문답게시판에 질문을 남겼습니다";
					url = "/resns/questionViewAra.re?seq_tbl_q="+theSeq;
					break;
				case "6": 
					alarm_type =" 내가 남긴 질문에 답변을 남겼습니다";
					url = "/resns/questionViewAra.re?seq_tbl_q="+theSeq;
					break;
				case "7": 
					alarm_type =" 동영상에 댓글을 남겼습니다";
					url = "/resns/music.re?fk_login_id="+userid;
					break;
				case "8": 
					alarm_type =" 나에게 메세지를 보냈습니다";
					url = "/resns/msgDetail.re?seq_tbl_msg="+theSeq;
					break;
				
				}
				
			/*	
			 
			  switch(alarm_type){
				case "1": 
					alarm_type =" 게시물을 좋아합니다";
					url = "/resns/mypage.re?fk_login_id="+userid+"&fk_seq_tbl_board="+theSeq;
					break;
				case "2": 
					alarm_type =" 게시물에 댓글을 남겼습니다 ";
					url = "/resns/mypage.re?fk_login_id="+userid+"&fk_seq_tbl_board="+theSeq;
					break;
				case "3": 
					alarm_type =" 내 댓글에 대댓글을 남겼습니다";
					url = "/resns/mypage.re?fk_login_id="+alarm.get("fk_rere_id")+"&fk_seq_tbl_board="+theSeq;
					break;
				case "4": 
					alarm_type =" 나를 팔로우합니다";
					url = "/resns/otherspage.re?fk_login_id="+alarm.get("fk_login_id");
					break;
				case "5": 
					alarm_type =" 문답게시판에 질문을 남겼습니다";
					url = "/resns/questionList.re?fk_login_id="+userid;
					break;
				case "6": 
					alarm_type =" 내가 남긴 질문에 답변을 남겼습니다";
					url = "/resns/questionList.re?fk_login_id="+userid;
					break;
				case "7": 
					alarm_type =" 동영상에 댓글을 남겼습니다";
					url = "/resns/music.re?fk_login_id="+userid;
					break;
				case "8": 
					alarm_type =" 나에게 메세지를 보냈습니다";
					url = "/resns/msgDetail.re?seq_tbl_msg="+theSeq;
					break;
				
				}
			  
			  
			  
			  switch(alarm_type){
				case "1": 
					alarm_type =" <span style='color:red;'>게시물을 좋아합니다";
					url = "/resns/mypage.re?fk_login_id="+userid+"&fk_seq_tbl_board="+theSeq;
					break;
				case "2": 
					alarm_type =" <span style='color:darkblue;'>게시물에 댓글을 남겼습니다 ";
					url = "/resns/mypage.re?fk_login_id="+userid+"&fk_seq_tbl_board="+theSeq;
					break;
				case "3": 
					alarm_type =" <span style='color:darkgrey;'>내 댓글에 대댓글을 남겼습니다";
					url = "/resns/mypage.re?fk_login_id="+alarm.get("fk_rere_id")+"&fk_seq_tbl_board="+theSeq;
					break;
				case "4": 
					alarm_type =" <span style='skyblue;'>나를 팔로우합니다";
					url = "/resns/otherspage.re?fk_login_id="+alarm.get("fk_login_id");
					break;
				case "5": 
					alarm_type =" <span style='color:orange;'>문답게시판에 질문을 남겼습니다";
					url = "/resns/questionList.re?fk_login_id="+theSeq;
					break;
				case "6": 
					alarm_type =" <span style='color:red;'>내가 남긴 질문에 답변을 남겼습니다";
					url = "/resns/questionList.re?fk_login_id="+theSeq;
					break;
				case "7": 
					alarm_type =" <span style='color:blue;'>동영상에 댓글을 남겼습니다";
					url = "/resns/music.re?fk_login_id="+theSeq;
					break;
				case "8": 
					alarm_type =" <span style='color:green;'>나에게 메세지를 보냈습니다";
					url = "/resns/msgDetail.re?seq_tbl_msg="+theSeq;
					break;
				
				}*/
				
				jsonObj.put("theSeq",theSeq);
				jsonObj.put("url",url);
				jsonObj.put("alarm_type",alarm_type);
				jsonObj.put("fk_login_id",alarm.get("fk_login_id"));
				jsonObj.put("alarm_userid",alarm.get("alarm_userid"));
				jsonObj.put("alarm_time",alarm.get("alarm_time"));
				jsonObj.put("alarm_status",alarm.get("alarm_status"));
				jsonObj.put("login_name",alarm.get("login_name"));
				jsonObj.put("imgsrc",alarm.get("uimg_profile_filename"));
				jsonObj.put("fk_rere_id",alarm.get("fk_rere_id"));
				
				
				
				jsonMap.put(jsonObj);
				
			}
		}
		
		String alarmList = jsonMap.toString();
		
		System.out.println("alarmList 하하하 : " + alarmList);
		
		/*List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
				
		System.out.println("/////"+myAlarmList);
		int j=0;
		for(int i=0; i<myAlarmList.size(); i++){
				
			String board = (String) myAlarmList.get(i).get("fk_seq_tbl_board");
			String follow = (String) myAlarmList.get(i).get("fk_follow_seq");
			String q = (String) myAlarmList.get(i).get("fk_seq_tbl_q");
			String music = (String) myAlarmList.get(i).get("fk_seq_tbl_music");
			
			
			System.out.println("board  " + board);
			System.out.println("follow  " + follow);
			System.out.println("q  " + q);
			System.out.println("music  " + music);
			
			
			
			if(!"0".equals(board)){
				//theSeq.add(board);
				theSeq = board;
			}else if(!"0".equals(follow)){
				//theSeq.add(follow);
				theSeq = follow;
			}else if(!"0".equals(q)){
				//theSeq.add(q);
				theSeq = q;
			}else if(!"0".equals(music)){
				//theSeq.add(music);
				theSeq = music;
			}
			
			System.out.println("theSeq  " + theSeq);
			
			String fk_login_id = (String) myAlarmList.get(i).get("fk_login_id");
			String alarm_userid = (String) myAlarmList.get(i).get("alarm_userid");
			String alarm_type = (String) myAlarmList.get(i).get("alarm_type");
			String alarm_time = (String) myAlarmList.get(i).get("alarm_time");
			String alarm_status = (String) myAlarmList.get(i).get("alarm_status");
			
			switch(alarm_type){
			case "1": 
				alarm_type =" 누가 내 게시물 하트";
				break;
			case "2": 
				alarm_type ="누가 내 게시물 댓글";
				break;
			case "3": 
				alarm_type ="누가 내 댓글에 대댓글 ";
				break;
			case "4": 
				alarm_type =" 누가 나를 팔로우 	";
				break;
			case "5": 
				alarm_type ="누가 내 문답게시판에 질문 	";
				break;
			case "6": 
				alarm_type ="내가 남긴 질문에 답변";
				break;
			case "7": 
				alarm_type =" 누가 내 동영상에 댓글";
				break;
			
			
			}// end of switch
			
			
			map.put("fk_login_id", fk_login_id);
			map.put("alarm_userid", alarm_userid);
			map.put("alarm_type", alarm_type);
			map.put("alarm_time", alarm_time);
			map.put("alarm_status", alarm_status);
			map.put("theSeq",theSeq);
			
		// System.out.println("j  "+j);
		
		//	map.put
			
			list.add(j, map);
			
			//System.out.println("j  "+j + ",map" + map);
		//	list.add(map);
			System.out.println("/////"+list);
			
		} // end of for
		//list.add(map);
		System.out.println("-------/////"+list);
		*/
		
		req.setAttribute("list", alarmList);
		
		
		return  "myalarm.notiles";
		
		
	}// end of alarm
		
	
	
	
}// end of HglController
