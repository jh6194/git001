package com.wecar.rcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.RDao;
import com.wecar.ucontroller.WAction;

public class WRupdate implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RDao dao = new RDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int state = Integer.parseInt(request.getParameter("state"));
		
		if (dao.reserveUpdate(rno,state) < 1) {
			out.print("<script>alert('변경 실패'); location.href = 'detail.reserve?rno="+rno+"';</script>");
		} else {
			out.print("<script>alert('변경 완료'); location.href = 'detail.reserve?rno="+rno+"';</script>");
		}
	}
}
