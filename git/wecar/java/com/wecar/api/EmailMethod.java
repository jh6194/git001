package com.wecar.api;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailMethod {
	
	public EmailMethod() { super(); }

	public String sendMail(String email) {
	String id = UUID.randomUUID().toString();
	String[] arr = id.split("-");
	String number = arr[0];
		
	String subject = "WECAR 인증번호";
	String content = "안녕하세요 위카입니다.<br/>회원님께서 요청하신 인증번호입니다.<br/>인증번호 : " + number;
	
    String host     = "smtp.naver.com";
	final String user   = "email";    
	final String password  = "password";
	
	 String to = email;

	 Properties props = new Properties();
	 props.put("mail.smtp.host", host);
	 props.put("mail.smtp.auth", "true");
	 props.put("mail.smtp.port", "587"); 
	  
		
	 props.put("mail.smtp.starttls.enable", "true");
	 props.put("mail.smtp.ssl.trust", "smtp.naver.com");
	 props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		 

	  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	    protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication(user, password);
	   }
	  });

	  try {
	   MimeMessage message = new MimeMessage(session);
	   message.setFrom(new InternetAddress(user));
	   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	   message.setSubject(subject);
	    
		/* message.setText(content); */
	   message.setContent( content , "text/html;charset=euc-kr");
	    
	   Transport.send(message);
	   System.out.println("전송성공");

	  } catch (MessagingException e) { e.printStackTrace(); System.out.println("전송실패");}
	  
	  return number;
	}
}
