package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.api.EmailMethod;

public class WUEmail implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf8;");
			PrintWriter out = response.getWriter();
			
			EmailMethod email = new EmailMethod();
			
			String number = email.sendMail(request.getParameter("email"));
			
			out.print(number);
		}
	}