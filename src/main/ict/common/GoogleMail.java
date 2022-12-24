package main.ict.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GoogleMail {
	
	//구글 이메일 보내기 함수
	//매개변수
	// 1. String receiveMail : 받을 이메일 주소
	// 2. String mailSubject : 이메일 제목
	// 3. String sendMsg	 : 이메일 내용
	public void authumMail(String receiveMail, String mailSubject, String sendMsg) {
		sendMsg = "<h2>" + sendMsg + "</h2>";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("wnsvy1919@gmail.com", "yfbphxycxbsfmsrv");
			}//end of getPasswordAuthentication() method overriding
		});
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(receiveMail, "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveMail));
			message.setSubject(mailSubject);
			message.setContent(sendMsg, "text/html; charset=utf-8");
			
			Transport.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}//end of try-catch
		
	}//end of authumMail() method
	
}//end of GoogleMail class
