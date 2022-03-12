package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

@WebServlet("/WUpassCheck")
public class WUpassCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WUpassCheck() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf8;");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setUno(Integer.parseInt(request.getParameter("uno")));
		dto.setPass(request.getParameter("pass"));
		
		out.print(dao.userPassCheck(dto));
		
	}
}
