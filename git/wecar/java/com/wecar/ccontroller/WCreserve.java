package com.wecar.ccontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.RDao;
import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WCreserve implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WDto dto = new WDto();
		WUDao dao = new WUDao();
		RDao rdao = new RDao();
		
		HttpSession session = request.getSession();
		WDto user = (WDto) session.getAttribute("user");
		System.out.println(rdao.check(request.getParameter("cno"), request.getParameter("pdate"), request.getParameter("rdate")));
		if (user == null) { 
			response.sendRedirect("loginView.we");
		} else if (rdao.check(request.getParameter("cno"), request.getParameter("pdate"), request.getParameter("rdate")) > 0) {
			out.println("<script>alert('현재 예약이 불가능한 차량입니다.'); location.href='/wecar/list.jsp?uno="+user.getUno()+"';</script>");
		} else {		
			dto.setUno(user.getUno());
			request.setAttribute("userinfo", dao.userSelect(dto));
			request.setAttribute("cno", request.getParameter("cno"));
			request.setAttribute("insu", request.getParameter("insu"));
			request.setAttribute("strprice", request.getParameter("strPrice"));
			request.setAttribute("price", request.getParameter("totalPrice"));
			request.setAttribute("pdate", request.getParameter("pdate"));
			request.setAttribute("rdate", request.getParameter("rdate"));
			String url = "car/car_reserve.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
