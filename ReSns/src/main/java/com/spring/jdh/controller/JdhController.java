package com.spring.jdh.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.FileManager;
import com.spring.common.GoogleMail;
import com.spring.common.MyUtil;
import com.spring.jdh.model.LoginVO;
import com.spring.jdh.model.MemberImageVO;
import com.spring.jdh.model.NoticeVO;
import com.spring.jdh.model.UserVO;
import com.spring.jdh.service.InterSnsService;


@Controller
public class JdhController {
	
	// ==== 의존객체 주입하기(DI : Dependency Injection)====
		@Autowired
		private InterSnsService service;
		
	// 파일업로드 및 다운로드를 해주는 FileManager 클래스를 의존객체 주입하기(DI : Dependency Injection) ====
		@Autowired
		private FileManager fileManager;
	
	// ==== 메인 페이지 요청. =====
		@RequestMapping(value="/loginmain.re", method={RequestMethod.GET})
		public String index(HttpServletRequest req) {
			
			
			
			return "jdh/mainlogin.tiles";
			
			// /WEB-INF/views/main/index.jsp ---> 메인 페이지
			
		}// end of public String index()-----------------
		
		// ==== 로그인 폼 페이지 요청. =====
		
		@RequestMapping(value="/login.re", method={RequestMethod.GET})
		public String login() {
			return "jdh/loginform.tiles";
			// WEB-INF/views/login/loginform.jsp파일을 생성한다.
		}// end of String login()-----------------------
		
		
		
		// ==== 로그인 완료 요청. =====
		@RequestMapping(value="/loginEnd.re", method={RequestMethod.POST})	
		public String loginEnd(HttpServletRequest req, HttpSession session, UserVO uservo, LoginVO loginUser) {
			
			String id = req.getParameter("id"); // 뷰단에서 가져온값
			String pwd = req.getParameter("pwd");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);
			
			/*
				로그인을 하려면 아이디와 암호가 일치할때만 로그인이 되어지도록 한다.
				먼저 서비스단에서 로그인 여부결과를 인트타입(1 또는 0 또는 -1)으로 받아오겠다.
			*/
			
			int n = service.loginEnd(map);		// 메소드 생성
			/*
				1은 아이디와 암호가 일치하는 경우
				0은  비밀번호가 틀린 경우
				-1은 아이디와 존재하지 않는 경우
			*/
			
			// 로그인 결과(1 OR 0 OR -1)를 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
			req.setAttribute("n", n);
			
			if(n == 1){
				uservo = service.getloginMember(id);
				loginUser = service.getloginSession(id);
				req.setAttribute("uservo", uservo);
				session.setAttribute("loginUser", loginUser);
				
				// 세션에 저장된 돌아갈 페이지(url)정보를 불러온다.
				String gobackURL = (String)session.getAttribute("gobackURL");
				
				req.setAttribute("gobackURL", gobackURL);
				
				session.removeAttribute("gobackURL");
			}
			
			return "jdh/loginEnd.tiles";
			// /WEB-INF/views/login/loginEnd.jsp 파일을 생성한다.
			
		}// end of String loginEnd()-------------------
			
	
				
	// ====  로그아웃 완료 요청. =====
		@RequestMapping(value="/logout.re", method={RequestMethod.GET})
		public String logout(HttpSession session) {
			
			session.invalidate();	// 몽땅 지움
			// session.removeAttribute("loginuser");	// 특정한것만 지움
			
			return "jdh/logout.tiles";
			// WEB-INF/views/login/logout.jsp 파일을 생성한다.
			
		}// end of String logout()
		
		
		
		
			////// 아이디 찾기
			@RequestMapping(value="/idFind.re", method={RequestMethod.POST})	
			public String idFind (HttpServletRequest req) {
				
				String email = req.getParameter("email"); // 뷰단에서 가져온값
				String nickname = req.getParameter("nickname");
				String method = req.getMethod();
				
				if (email != null && nickname != null && !email.equals("") && !nickname.equals("") && method.equals("POST")) {
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("email", email);
					map.put("nickname", nickname);
				
					String userid = service.getUserid(map);
					
					JSONObject jobj = new JSONObject();
					jobj.put("userid", userid);
					String str_json = jobj.toString();
					req.setAttribute("str_json", str_json);
				}
				
				
				return "idfindjson.notiles";
			}
		
			
		
			// 비밀번호 찾기
			@RequestMapping(value="pwdFind.re", method={RequestMethod.GET, RequestMethod.POST})
			public String pwdfind (HttpServletRequest req){
				String userid = req.getParameter("userid");
				String email = req.getParameter("email");
				String method = req.getMethod();
				int n = 0;
				  // 비밀번호 찾기 modal창에서 "찾기"버튼 클릭시
				if(userid != null && email != null && !userid.equals("") && !email.equals("") && method.equalsIgnoreCase("post")) {
				    req.setAttribute("userid", userid);
				    req.setAttribute("email", email);
				    req.setAttribute("method", method);
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("userid", userid);
					map.put("email", email);
					n = service.getUserExists(map);
				}
				if (n == 1) { // 비밀번호 찾기를 위해 입력한 사용자아이디와 이메일이 DB에 등록된 경우...  인증키 메일 발송
					GoogleMail mail = new GoogleMail();
					Random rnd = new Random();
					try {
						char randchar = ' ';
						int randnum = 0;
						String certificationCode = "";
						// 랜덤한 영문소문자를 5개를 생성
						 for (int i = 0; i < 5; i++) {  // min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면...
							 randchar = (char)(rnd.nextInt('z' - 'a' + 1) + 'a');
							 certificationCode += randchar;
						 }
						 	// 랜덤한 숫자(0-9)를 7개를 생성
				            for (int i = 0; i < 7; i++) {
				               randnum = rnd.nextInt(9 - 0 + 1) + 0;
				               certificationCode += randnum;
				            }
				            mail.sendmail(email, certificationCode);
				            req.setAttribute("certificationCode", certificationCode);
				        } catch (Exception e) {  // 비밀번호 찾기를 위해 입력한 사용자아이디와 이메일은 존재하지만 메일발송이 실패한 경우
				           e.printStackTrace();
				           n = -1;
				           req.setAttribute("sendFailmsg", "메일발송이 실패했습니다.");
				        } // end of try~catch-------------------------
				     } else {  // 비밀번호 찾기를 위해 입력한 사용자아이디와 이메일이 DB에 없는 경우
				        n = 0;
				     }
					 req.setAttribute("n", n);
				     req.setAttribute("userid", userid);
				     req.setAttribute("email", email);
				     return "jdh/pwdFind.tiles";
				     
				     // return "jdh/pwdFind.tiles";
			} // end of 비밀번호 
			
			// 비밀번호 재설정
			 @RequestMapping(value="/pwdConfirm.re")
			   public String pwdConfirm(HttpServletRequest req) {  // 비밀번호 변경
			      String method = req.getMethod();
			      String userid = req.getParameter("userid");
			      req.setAttribute("method", method);
			      req.setAttribute("userid", userid);
			      
			      
			      if(method.equalsIgnoreCase("post")) {
			         String pwd = req.getParameter("pwd");
			         String pwd2 = req.getParameter("pwd2");
			         
			         HashMap<String, String> map = new HashMap<String, String>();
			         map.put("userid", userid);
			         map.put("pwd", pwd);
			         map.put("pwd2", pwd2);
			         
			         int n = service.updatePwd(map);
			         
			         req.setAttribute("n", n);
			         req.setAttribute("pwd", pwd);
			         req.setAttribute("pwd2", pwd2);
			      }
			      return "jdh/pwdConfirm.tiles";
			   }
			 
			 
		// 회원가입 
		@RequestMapping(value="/reRegister.re", method={RequestMethod.GET})
		public String register() {
			
			return "jdh/reregister.tiles";
		}
		
		// 회원가입 메소드
		//@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
		@RequestMapping(value="/reRegisterEnd.re", method={RequestMethod.POST})
		public String reRegisterEnd(MultipartHttpServletRequest req, HttpSession session) throws Throwable{
			
			// 1. 폼에서 넘어온 값을 받기
			String login_id = req.getParameter("login_id");			// 아이디 
			String login_pwd = req.getParameter("login_pwd");		// 비밀번호
			String login_name = req.getParameter("login_name");		// 닉네임
			
			String user_gender = req.getParameter("user_gender");	// 성별		
			String user_email = req.getParameter("user_email");		// 이메일			
			String user_birth = req.getParameter("user_birth");		// 생년월일
			
			
			
			
			MultipartFile attach = req.getFile("attach");
			
			
			LoginVO lvo = new LoginVO(); 
			UserVO uvo = new UserVO();
			MemberImageVO ivo = new MemberImageVO();
			
			/////////////////////////////////////////////
			lvo.setLogin_id(login_id);
			lvo.setLogin_pwd(login_pwd);
			lvo.setLogin_name(login_name);	
			
			uvo.setFk_login_id(login_id);
			uvo.setUser_email(user_email);
			uvo.setUser_birth(user_birth);
			uvo.setUser_gender(Integer.parseInt(user_gender));
			
			
			if(attach == null || attach.isEmpty()){
				ivo.setAttach(null);
			} else {
				ivo.setAttach(attach);
			}
			
			
			
			if (ivo.getAttach() != null && !ivo.getAttach().isEmpty()){	// 첨부파일이 있다면..
				
				
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" +File.separator+ "files";
			
			//System.out.println("===> 확인용 path => " + path);
			
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화한 후 파일올리기
				String newFileName = "";
				
				byte[] bytes = null;
				
				long fileSize = 0;
				
				try {
					bytes = ivo.getAttach().getBytes();
					
					newFileName = fileManager.doFileUpload(bytes, ivo.getAttach().getOriginalFilename(), path);
					
					ivo.setFk_login_id(login_id);
					
					ivo.setUimg_profile_filename(newFileName);
					ivo.setUimg_header_filename(newFileName);
					
					ivo.setUimg_profile_orgfilename(ivo.getAttach().getOriginalFilename());
					ivo.setUimg_header_orgfilename(ivo.getAttach().getOriginalFilename());
					
					
					fileSize = ivo.getAttach().getSize();
					// 첨부한 파일의 파일크기인데 리턴타입이 long타입이다.
					
					ivo.setUimg_profile_filesize((int)(long)fileSize);
					ivo.setUimg_header_filesize((int)(long)fileSize);
					
					
				} catch (Exception e) {
					
					e.printStackTrace();
				} // multipart파일인데 파일 크기를 알아와야 한다.
				
			} else {
				ivo.setFk_login_id(login_id);
				// System.out.println("확인 : " + login_id);
				
				ivo.setUimg_profile_filename("profile0.png");
				ivo.setUimg_header_filename("header0.png");
				
				ivo.setUimg_profile_orgfilename("profile0.png");
				ivo.setUimg_header_orgfilename("header0.png");
				
				ivo.setUimg_profile_filesize(20673);
				ivo.setUimg_header_filesize(20019);
			}
			
			
			
			int q = service.registerMember(lvo, uvo, ivo);	//ivo
			 
			
			if (q == 3) {
				String msg = "RE 회원가입이 정상적으로 처리되었습니다.";
				String loc = "/resns/login.re";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
			}
			
			return "msg.notiles";	
		}
		
		//////////////////////////////////// 공지사항 ////////////////////////////////////////
		
		// 관리자 공지사항
		
		@RequestMapping(value="/noticeAdmMain.re", method={RequestMethod.GET})
		public String adminNotice(HttpServletRequest req, HttpSession session){
			
			HashMap<String, String> map = new HashMap<String, String>();
			
				String str_currentShowPageNo = req.getParameter("currentShowPageNo");
			
				
				int totalCount = service.noticePage();
				
			
			int sizePerPage = 5;			// 한페이지당 보여줄 게시물수
			
			int totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
			
			int currentShowPageNo = 0;		// 현재 보여주는 페이지번호로서, 초기치는 1페이지로 한다.
			
			int blockSize = 3;				// "페이지바"에 보여줄 페이지의 갯수
			
			
			
			if (str_currentShowPageNo == null) {
				// 게시판의 초기화면
				currentShowPageNo = 1;
			}
			else {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			}
			
			
			int startRno = ((currentShowPageNo - 1)*sizePerPage) + 1;
			int endRno = startRno + sizePerPage - 1;
			//System.out.println("확인용"+startRno);
			//System.out.println("확인용"+endRno);
			
			// ===== #109. 페이징처리를 위해서 startRno , endRno 를 map 에 추가하여 
			//				파라미터로 넘겨서 select 되도록 한다.
			map.put("startRno",String.valueOf(startRno));
			map.put("endRno", String.valueOf(endRno));
			/////////////////////////////////////////////////////////////// 페이징
			
			List <NoticeVO> noticeList = null;
			
			noticeList = service.getNoticeList(map);
			String pageBar = MyUtil.getPageBar(sizePerPage, blockSize, totalPage, currentShowPageNo, "noticeAdmMain.re");
			
			req.setAttribute("noticeList", noticeList);
			req.setAttribute("pageBar", pageBar);
			
			
			return "jdh/admNotice.tiles";
		}
		
		// 관리자 공지사항 디테일 뿌리기
		
		@RequestMapping(value="/noticeDetail.re", method={RequestMethod.GET})
		public String helpDetail(HttpServletRequest req, HttpSession session) {
			HashMap<String, String> map = new HashMap<String, String>(); // xml에 키값을 주기위한 조치
			
			String seq = req.getParameter("seq");
			map.put("seq", seq);
			
			NoticeVO nvo = service.getNoticeDetail(map);
			
			req.setAttribute("vo", nvo);
			return "jdh/admNoticeDetail.tiles2";
		}
		
		
		// 회원용 공지사항
		
		@RequestMapping(value="/noticeMemMain.re", method={RequestMethod.GET})
		public String memberNotice(HttpServletRequest req, HttpSession session){
			
			
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		
			
			int totalCount = service.noticePage();
			
		
		int sizePerPage = 5;			// 한페이지당 보여줄 게시물수
		
		int totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
		
		int currentShowPageNo = 0;		// 현재 보여주는 페이지번호로서, 초기치는 1페이지로 한다.
		
		int blockSize = 3;				// "페이지바"에 보여줄 페이지의 갯수
		
		
		
		if (str_currentShowPageNo == null) {
			// 게시판의 초기화면
			currentShowPageNo = 1;
		}
		else {
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
		}
		
		
		int startRno = ((currentShowPageNo - 1)*sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		//System.out.println("확인용"+startRno);
		//System.out.println("확인용"+endRno);
		
		// ===== #109. 페이징처리를 위해서 startRno , endRno 를 map 에 추가하여 
		//				파라미터로 넘겨서 select 되도록 한다.
		map.put("startRno",String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		/////////////////////////////페이징 ///////////////////////////////////////
			
			List <NoticeVO> noticeList = null;
			
			noticeList = service.getMemNotice(map);
			
			String pageBar = MyUtil.getPageBar(sizePerPage, blockSize, totalPage, currentShowPageNo, "noticeMemMain.re");
			
			req.setAttribute("noticeList", noticeList);
			req.setAttribute("pageBar", pageBar);
						
			return "jdh/memNotice.tiles";
		}
		
		// 회원용 공지사항 디테일
		
		@RequestMapping(value="/MemnoticeDetail.re", method={RequestMethod.GET})
		public String memberNotiDetail(HttpServletRequest req, HttpSession session){
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			String seq = req.getParameter("seq");
			
			map.put("seq", seq);
			
			NoticeVO nvo = service.getMemNoticeDe(map);
			
			req.setAttribute("vo", nvo);
			return "jdh/memNoticeDe.tiles2";
		}
		
		// 공지사항 등록하기
		@RequestMapping(value="/noticeregister.re", method={RequestMethod.GET}) 
			public String noticeRegister(HttpServletRequest req){
			
			
			return "jdh/noticeRegister.tiles2"; 
		}
		
		// 공지사항 등록하기
		@RequestMapping(value="/noticeregisterEnd.re", method={RequestMethod.POST}) 
		public String noticeRegisterEnd(HttpServletRequest req){
			String notice_title = req.getParameter("notice_title");
			String notice_content = req.getParameter("notice_content");
			String notice_cate = req.getParameter("notice_cate");
			
			NoticeVO nvo = new NoticeVO();
			
			nvo.setNotice_title(notice_title);
			nvo.setNotice_content(notice_content);
			nvo.setNotice_cate(Integer.parseInt(notice_cate));
			
			int n = service.noticeRegister(nvo);
			
			
			if (n == 1) {
				String msg = "공지사항이 등록되었습니다.";
				String loc = "/resns/noticeAdmMain.re";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
			}
			
			return "msg.notiles";
		}
		
		// 공지사항 삭제하기
		@RequestMapping(value="noticeDelete.re", method={RequestMethod.POST})
		public String deleteNotice(HttpServletRequest req){	//, HttpSession session
			
			String seq = req.getParameter("seq");
			
			/*String login_id = req.getParameter("loginid");
			
			LoginVO loginUser = (LoginVO) session.getAttribute("loginUser");
			
			String sessionid = "";
			
			if (loginUser != null) {	// 유저라면
				if (!login_id.equals(sessionid) && loginUser.getLogin_status() != 9) {
					req.setAttribute("msg", "삭제는 관리자만 가능합니다.");
					req.setAttribute("loc", "/resns/noticeAdmMain.re?seq=" + seq);
													
					return "msg.notiles2";
				}
			}
			
			else {
				req.setAttribute("msg", "삭제는 관리자만 가능합니다.");
				req.setAttribute("loc", "/resns/noticeAdmMain.re?seq=" + seq);
				
				return "msg.notiles2";
			}*/
			
			int n = service.updateNoticeDelete(seq);	// 공지사항 삭제
			
			if (n > 0) {
				req.setAttribute("msg", "공지사항 삭제 성공");
				req.setAttribute("loc", "/resns/noticeAdmMain.re");
			}
			else {
				req.setAttribute("msg", "게시물 삭제 실패");
				req.setAttribute("loc", "/resns/noticeAdmMain.re");
			}
				
			return "msg.notiles2";
			
		}// end of public String modifyNotice(HttpServletRequest req, HttpSession session)
		
		// 공지사항 수정하기
		@RequestMapping(value="noticeModify.re", method={RequestMethod.POST})
		public String noticeModify(HttpServletRequest req){
			
			HashMap<String, Object> notimodiMap = new HashMap<String, Object>();
			
			String seq_tbl_notice = req.getParameter("seq_tbl_notice");
			String notice_title = req.getParameter("notice_title");
			String notice_content = req.getParameter("notice_content");
			String notice_date = req.getParameter("notice_date");
			String notice_cate = req.getParameter("notice_cate");
			
			notimodiMap.put("seq_tbl_notice", seq_tbl_notice);
			notimodiMap.put("notice_title", notice_title);
			notimodiMap.put("notice_content", notice_content);
			notimodiMap.put("notice_date", notice_date);
			notimodiMap.put("notice_cate", notice_cate);
			
			int n = 0;
			
			n = service.noticeModify(notimodiMap);
			
			
			if (n > 0) {
				req.setAttribute("msg", "수정 완료!");
				req.setAttribute("loc", "/resns/noticeAdmMain.re");
			}
			
			return "msg.notiles2";
			
		}
		
		////////////////////////////회원관리 /////////////////////////////////////////////////////
		
		// 회원관리 리스트 뽑기
		
		@RequestMapping(value="memberSupervise.re", method={RequestMethod.GET, RequestMethod.POST})
		public String memberSV(HttpServletRequest req){
			
			
			List<HashMap<String, String>> memList = null;
			
			memList = service.getMemList();
			
			req.setAttribute("memList", memList);
			
			String colname = req.getParameter("colname");
			String search = req.getParameter("search");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("colname", colname);
			map.put("search", search);
			
			String str_currentShowPageNo = req.getParameter("currentShowPageNo");
			
			int totalCount = 0; 			// 총게시물 건수
			int sizePerPage = 5;			// 한페이지당 보여줄 게시물수
			int currentShowPageNo = 0;		// 현재 보여주는 페이지번호로서, 초기치는 1페이지로 한다.
			int totalPage = 0;				// 총 페이지수(웹브라우저상에 보여줄 총 페이지수)
			
			int startRno = 0;				// 시작 행 번호
			int endRno = 0;					// 끝 행 번호
			
			int blockSize = 10;				// "페이지바"에 보여줄 페이지의 갯수
			
			if (str_currentShowPageNo == null) {
				// 게시판의 초기화면
				currentShowPageNo = 1;
			}
			else {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			}
			
			
			startRno = ((currentShowPageNo - 1)*sizePerPage) + 1;
			endRno = startRno + sizePerPage - 1;
			
			// ===== #109. 페이징처리를 위해서 startRno , endRno 를 map 에 추가하여 
			//				파라미터로 넘겨서 select 되도록 한다.
			map.put("startRno",String.valueOf(startRno));
			map.put("endRno", String.valueOf(endRno));
			
			if ( (colname != null && search != null) &&
					(!colname.trim().isEmpty() && !search.trim().isEmpty() ) && 
					(!colname.equals("null") && !search.equals("null") )
					) {	// 검색어가 있는 경우
				memList = service.memberList2(map);
					}
			
			else {// 검색어가 없는 경우
				memList = service.memberList1(map);
			}
			
			
			/*===== #111. 페이지바 만들기(먼저 페이지바에 나타낼 총 페이지 갯수 구하기) =====
			
				검색조건이 없을때의 총 페이지 수와 
				검색조건이 있을때의 총 페이지 수를 구해야 한다.
				
				검색조건이 없을때의 총 페이지수 ---> colname 과 search 의 값이 없는 경우이다.
				검색조건이 있을때의 총 페이지수 ---> colname 과 search 의 값이 있는 경우이다.*/
			
			
			// 총 게시물 건수를 구한다.
			
			if ( (colname != null && search != null) &&
					(!colname.trim().isEmpty() && !search.trim().isEmpty() ) && 
					(!colname.equals("null") && !search.equals("null") )
					) {	// 검색어가 있는 경우
					totalCount = service.getTotalCount2(map);
					}
			
			else {// 검색어가 없는 경우
					totalCount = service.getTotalCount1();
					}
			
			// totalPage 구하기
			
			totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
			
			String pagebar = "<ul>";
			
			pagebar += MyUtil.getPageBarWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, colname, search, null, "list.action");
			
			pagebar += "</ul>";
			
			req.setAttribute("pagebar", pagebar);
			
			req.setAttribute("memList", memList);
			req.setAttribute("colname", colname);
			req.setAttribute("search", search);
			
			
			return "jdh/memberSV.tiles2";
		}
		
		
		// 회원관리 회원 삭제하기
		@RequestMapping(value="/memberDelete.re", method={RequestMethod.POST, RequestMethod.GET})
		public String MemDelete(HttpServletRequest req){
			
			String method = req.getMethod();
			//System.out.println("method : " + method);
			String id = req.getParameter("id");
			//System.out.println("id : " + id);
			/*String login_id = req.getParameter("loginid");
			
			LoginVO loginUser = (LoginVO) session.getAttribute("loginUser");
			
			String sessionid = "";
			
			if (loginUser != null) {	// 유저라면
				if (!login_id.equals(sessionid) && loginUser.getLogin_status() != 9) {
					req.setAttribute("msg", "삭제는 관리자만 가능합니다.");
					req.setAttribute("loc", "/resns/noticeAdmMain.re?seq=" + seq);
													
					return "msg.notiles2";
				}
			}
			
			else {
				req.setAttribute("msg", "삭제는 관리자만 가능합니다.");
				req.setAttribute("loc", "/resns/noticeAdmMain.re?seq=" + seq);
				
				return "msg.notiles2";
			}*/
			
			int n = service.updateMemberDelete(id);	// 회원 삭제
			
			if (n > 0) {
				req.setAttribute("msg", "회원 삭제 성공");
				req.setAttribute("loc", "/resns/memberSupervise.re");
			}
			
			return "msg.notiles2";
		}
		
		
		// 회원정보 수정하기
		@RequestMapping(value="memberEdit.re", method={RequestMethod.POST})
		public String MemEdit(HttpServletRequest req){
		
			
		HashMap<String, Object> editMemberMap = new HashMap<String, Object>();
		
		String login_id = req.getParameter("login_id");
		String login_name = req.getParameter("login_name");
		
		editMemberMap.put("login_id", login_id);
		editMemberMap.put("login_name", login_name);
		
		int n = 0;
		
		n = service.memberEdit(editMemberMap);
		
		if (n > 0) {
			req.setAttribute("msg", "수정 완료!");
			req.setAttribute("loc", "/resns/memberSupervise.re");
		}
		
		return "msg.notiles2";
		
		}
		
		
		// 회원 복원
		@RequestMapping(value="memberRestore.re", method={RequestMethod.POST, RequestMethod.GET})
		public String MemRestore(HttpServletRequest req){
			
			String method = req.getMethod();
			
			String id = req.getParameter("id");
			
			int n = service.updateMemberRestore(id);	// 회원 삭제
			
			if (n > 0) {
				req.setAttribute("msg", "회원 복구 성공");
				req.setAttribute("loc", "/resns/memberSupervise.re");
			}
			
			return "msg.notiles2";
			
		}
		
		// 아이디 중복체크		
		@RequestMapping(value="/memberIdDuplicateCheck.re")
		   public String idDuplicateCheck(HttpServletRequest req) {
		      String method = req.getMethod();
		      String userid = req.getParameter("userid");
		      req.setAttribute("method", method);
		      
		      if(userid != null) {
		         req.setAttribute("userid", userid);
		         boolean isUseuserid = service.idDuplicateCheck(userid);
		         req.setAttribute("isUseuserid", isUseuserid);
		      }
		      
		      return "jdh/idDuplicateCheck.notiles";
		   }
		
		
		// 별명 중복체크		
				@RequestMapping(value="/memberNickDuplicateCheck.re")
				   public String nickDuplicateCheck(HttpServletRequest req) {
					
				      String method = req.getMethod();
				      String login_name = req.getParameter("login_name");
				      req.setAttribute("method", method);
				      
				      if(login_name != null) {
				         req.setAttribute("login_name", login_name);
				         boolean isUseusernick = service.nickDuplicateCheck(login_name);
				         req.setAttribute("isUseusernick", isUseusernick);
				      }
				      
				      return "jdh/nickDuplicateCheck.notiles";
				   }
		
		
		
}
