package com.wecar.rcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.RDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WRdetail implements WAction {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		RDao rdao = new RDao();
		
		HttpSession session = request.getSession();
		WDto user = (WDto) session.getAttribute("user");
		
		request.setAttribute("uno", user.getUno());
		request.setAttribute("map", rdao.reserveSelect(Integer.parseInt(request.getParameter("rno"))));	
	}
}
