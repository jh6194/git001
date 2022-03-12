package com.wecar.ucontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUfindId implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setName(request.getParameter("findIdName"));
		dto.setEmail(request.getParameter("findIdEmail"));
		
		request.setAttribute("userFindId", dao.userFindId(dto));
	}
}
