package com.wecar.ucontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.RDao;
import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUselect implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		WUDao dao = new WUDao();
		RDao rdao = new RDao();
		WDto dto = new WDto();
		
		HttpSession session = request.getSession();
		WDto user = (WDto) session.getAttribute("user");
		dto.setUno(user.getUno());
			
		request.setAttribute("list", rdao.userReserveList(dto));
		request.setAttribute("userinfo", dao.userSelect(dto));
	}
}
