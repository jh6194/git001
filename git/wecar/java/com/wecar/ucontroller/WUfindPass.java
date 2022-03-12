package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUfindPass implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setId(request.getParameter("findPassId"));
		dto.setEmail(request.getParameter("findPassEmail"));
		
		if (dao.userFindPass(dto) != 1) {
			String url = "findPopPassView.we";
			out.print("<script>alert('입력하신 정보와 일치하는 정보가 존재하지 않습니다.'); location.href = '"+url+"';</script>");
		}
	}
}
