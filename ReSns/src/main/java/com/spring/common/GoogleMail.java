package com.spring.common;


import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class GoogleMail {

	public void sendmail(String recipient, String certificationCode) 
	       throws Exception {
		
		// 1. 정보를 담아주는 객체
		Properties prop = new Properties();
		
		// 2. SMTP(Simple Mail Transfer Protocol) 를 
		//    무엇으로 사용할 것인지 설정을 해주어야 한다.
		//    우리는 Google gmail 를 사용하도록 하겠다.
		//    그러므로 gmail 계정이 있어야 한다.
		prop.put("mail.smtp.user", "kkana4578@gmail.com");
		
		// 3. SMTP 서버 정보 설정
		//    Google gmail 를 사용하는 경우 "smtp.gmail.com" 
		prop.put("mail.smtp.host", "smtp.gmail.com");
		
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.debug", "true");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		prop.put("mail.smtp.socketFactory.fallback", "false");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
		
		Authenticator smtpAuth = new MySMTPAuthenticator();
		Session ses = Session.getInstance(prop, smtpAuth);
		
		// 메일을 보내는 상황을 콘솔에 출력해본다.
		ses.setDebug(true);
		
		// 메일의 내용을 담기 위한 객체생성
		MimeMessage msg = new MimeMessage(ses);
		
		// 제목설정
		String subject = "localhost:9090/resns/ 사이트에서 회원님의 비밀번호 찾기를 위한 인증코드 발송"; 
		msg.setSubject(subject);
		
		// 보내는 사람의 메일주소
		String sender = "kkana4578@gmail.com";
		Address fromAddr = new InternetAddress(sender);
		msg.setFrom(fromAddr);
		
		// 받는 사람의 메일주소
		Address toAddr = new InternetAddress(recipient);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		
		// 메시지 본문의 내용과 형식, 캐릭터셋 설정하기
		msg.setContent("발송된 인증코드 : <span style='font-size:14pt; color:red;'>"+certificationCode+"</span>", "text/html;charset=UTF-8"); 
		
		// 메일발송
		Transport.send(msg);
		
		
	}// end of sendmail(String recipient, String certificationCode)-----------
	
	
	public void sendmail_OrderFinish(String recipient, String emailContents) 
		       throws Exception {
			
			// 1. 정보를 담아주는 객체
			Properties prop = new Properties();
			
			// 2. SMTP(Simple Mail Transfer Protocol) 를 
			//    무엇으로 사용할 것인지 설정을 해주어야 한다.
			//    우리는 Google gmail 를 사용하도록 하겠다.
			//    그러므로 gmail 계정이 있어야 한다.
			prop.put("mail.smtp.user", "kkana4578@gmail.com");
			
			// 3. SMTP 서버 정보 설정
			//    Google gmail 를 사용하는 경우 "smtp.gmail.com" 
			prop.put("mail.smtp.host", "smtp.gmail.com");
			
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.debug", "true");
			prop.put("mail.smtp.socketFactory.port", "465");
			prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
			prop.put("mail.smtp.socketFactory.fallback", "false");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
			
			Authenticator smtpAuth = new MySMTPAuthenticator();
			Session ses = Session.getInstance(prop, smtpAuth);
			
			// 메일을 보내는 상황을 콘솔에 출력해본다.
			ses.setDebug(true);
			
			// 메일의 내용을 담기 위한 객체생성
			MimeMessage msg = new MimeMessage(ses);
			
			// 제목설정
			String subject = "localhost:9090/MyMVC/ 사이트에서 회원님의 비밀번호 찾기를 위한 인증코드 발송"; 
			msg.setSubject(subject);
			
			// 보내는 사람의 메일주소
			String sender = "kkana4578@gmail.com";
			Address fromAddr = new InternetAddress(sender);
			msg.setFrom(fromAddr);
			
			// 받는 사람의 메일주소
			Address toAddr = new InternetAddress(recipient);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			// 메시지 본문의 내용과 형식, 캐릭터셋 설정하기
			msg.setContent("발송된 인증코드 : <span style='font-size:14pt; color:red;'>"+emailContents+"</span>", "text/html;charset=UTF-8"); 
			
			// 메일발송
			Transport.send(msg);
			
			
		}// end of sendmail(String recipient, String certificationCode)-----------
	
	
}






