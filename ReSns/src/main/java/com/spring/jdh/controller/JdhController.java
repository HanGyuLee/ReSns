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
				
				// jdh/loginform.tiles
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
			String user_selfi = req.getParameter("user_selfi");		// 자기소개
			
			
			
			String uimg_seq = req.getParameter("uimg_seq");			// 
			String uimg_profile_filename = req.getParameter("uimg_profile_filename");	//  WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
			String uimg_header_filename =req.getParameter("uimg_header_filename");		//	WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
			String uimg_profile_orgfilename = req.getParameter("uimg_profile_orgfilename");	// 진짜 파일명(ex) --> 강아지.png)
			String uimg_header_orgfilename = req.getParameter("uimg_header_orgfilename");	// 진짜 파일명(ex) --> 강아지.png)
			String uimg_profile_filesize = req.getParameter("uimg_profile_filesize");	// 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
			String uimg_header_filesize = req.getParameter("uimg_header_filesize");		// 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
			MultipartFile attach = req.getFile("attach");
			
			
			//String profile = req.getParameter("profile");	// 프로필 사진
			// 이미지
			
			// 첨부파일이 있는지 없는지 알아오기 
			
			// System.out.println("user_gender"+user_gender);
			
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
			uvo.setUser_selfi(user_selfi);
			
			
			ivo.setUimg_seq(Integer.parseInt(uimg_seq));
			ivo.setUimg_profile_filename(uimg_profile_filename);
			ivo.setUimg_header_filename(uimg_header_filename);
			ivo.setUimg_profile_orgfilename(uimg_profile_orgfilename);
			ivo.setUimg_header_orgfilename(uimg_header_orgfilename);
			ivo.setUimg_profile_filesize(Integer.parseInt(uimg_profile_filesize));
			ivo.setUimg_header_filesize(Integer.parseInt(uimg_header_filesize));
			ivo.setAttach(attach);
			
			if (!ivo.getAttach().isEmpty()){	// 첨부파일이 있다면..
				// attach가 비어있지 않다면(즉, 첨부파이이 있는 경우라면)
				
				/*
					1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
					>>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기.
						우리는 WAS(톰캣)의 webapp/resources/files 라는 폴더로 지정해준다.					
				*/
				
				// WAS 의 webapp 의 절대경로를 알아와야 한다.
				
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" +File.separator+ "files";
			// File.separator 은 운영체제가 Windows 이라면 "\" 를 말하고
			// File.separator 은 운영체제가 Unix 이라면 "/" 를 말한다.
			// ==> path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.
			
			System.out.println("===> 확인용 path => " + path);
			// 확인용 path => C:\SpringWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files
			
			
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화한 후 파일올리기
				String newFileName = "";
				// WAS(톰캣) 디스크에 저장할 파일명
				
				byte[] bytes = null;
				// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도
				
				long fileSize = 0;
				// 파일크기를 읽어오기 위한 용도
				
				try {
					bytes = ivo.getAttach().getBytes();
					// getBytes()는 첨부된 파일을 바이트 단위로 파일을 다 읽어 오는 것이다.
					
					//getOriginalFilename() 첨부파일의 이름을 
					newFileName = fileManager.doFileUpload(bytes, ivo.getAttach().getOriginalFilename(), path);
					// 이것이 파일을 업로드 해주는 것이다.
					// boardvo.getAttach().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다.
					
					// 3. BoardVO boardvo 에 fileName값과 orgFilename 값과 fileSize 값을 넣어주기
					// ivo.setFileName(newFileName);
					// WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
					
					ivo.setUimg_profile_filename(uimg_profile_filename);
					ivo.setUimg_profile_filename(uimg_profile_filename);
					
					ivo.setUimg_profile_orgfilename(ivo.getAttach().getOriginalFilename());
					ivo.setUimg_header_orgfilename(ivo.getAttach().getOriginalFilename());
					
					ivo.setUimg_profile_orgfilename(ivo.getAttach().getOriginalFilename());
					ivo.setUimg_header_orgfilename(ivo.getAttach().getOriginalFilename());
					// -- 진짜 파일명(강아지.png)   
					// 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
					
					fileSize = ivo.getAttach().getSize();
					// 첨부한 파일의 파일크기인데 리턴타입이 long타입이다.
					
					//ivo.setFileSize(String.valueOf(fileSize));
					// 첨부한 파일의 크기를 String 타입으로 변경해서 저장함.
					
					
					/*ivo.setUimg_profile_filesize(String.valueOf(uimg_profile_filesize));
					ivo.setUimg_header_filesize(String.valueOf(uimg_header_filesize));*/
					
					
					
				} catch (Exception e) {
					
					e.printStackTrace();
				} // multipart파일인데 파일 크기를 알아와야 한다.
				
			}
			
			// ***** 첨부파일이 있는지 없는지 알아오기 끝 ***** //
			
			//	int n = service.add(boardvo);
			
			/*==== #136. 파일첨부가 없는 경우 또는 파일첨부가 있는 경우 
						 Service 단으로 호출하기
						 먼저 위의 int n = service.add(boardvo);을 주석처리한다.*/
			
			int n = 0;
			if (ivo.getAttach().isEmpty()){
				// 파일첨부가 없다라면 기본이미지파일 넣어줌.
				n = service.add_profile(ivo);
			}
			
			else {
				// 파일첨부가 있다라면
				n = service.add_withFile(ivo);
			}
			
			req.setAttribute("n", n);
			
			
			
			int q = service.registerMember(lvo, uvo, ivo);	//ivo
			 
			
			if (q == 3) {
				String msg = "RE 회원가입이 정상적으로 처리되었습니다.";
				String loc = "/resns/login.re";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
			}
			
			return "msg.notiles";	
		}
		
		// 공지사항
		
		@RequestMapping(value="/noticeAdmMain.re", method={RequestMethod.GET})
		public String adminNotice(HttpServletRequest req, HttpSession session){
			
			List<HashMap<String, String>> noticeList = null;
			
			
			
			return "jdh/admNotice.tiles";
		}
		
		
}
