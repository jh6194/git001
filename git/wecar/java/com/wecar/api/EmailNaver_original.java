package com.wecar.api;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/mail.we")*/
public class EmailNaver_original extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmailNaver_original() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String subject = "[위카] 인증번호";
		String content = "인증번호 : ";
		for (int i = 0; i < 6; i++) { content += (int)(Math.random() * 10); }
		
	    String host     = "smtp.naver.com";
		final String user   = "";    
		final String password  = "";
		  /* 1)보내는 쪽의 메일설정부분
		  final String user   = "NAVER_ID";  
		  final String password  = "PASSWORD"; */
		 String to2 = request.getParameter("insertEmailAddress");
		 String to  = to2;
 
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
		    
		   //message.setText("메일 본문 내용 HTML 코딩");
		   message.setText(content);
		   message.setContent( content , "text/html;charset=euc-kr");
		    
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   
		    PrintWriter out = response.getWriter();
		    out.println("<script>alert('메일보내기에 성공했습니다.'); location.href='"+request.getContextPath()+"/user/user_insert.jsp?insertEmail="+to2+"&insertEmailNum="+content+"';</script>");

		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
	}
}
