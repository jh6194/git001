package com.wecar.rcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.RDao;
import com.wecar.ucontroller.WAction;

public class WRdelete implements WAction {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RDao dao = new RDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));

		if (dao.reserveDelete(rno) < 1) {
			out.print("<script>alert('취소 실패'); location.href = 'detail.reserve?rno="+rno+"';</script>");
		} else {
			out.print("<script>alert('취소 완료'); location.href = 'list.reserve';</script>");
		}
	}
}
