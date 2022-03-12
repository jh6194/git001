package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUInsert implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setId(request.getParameter("insertId"));
		dto.setPass(request.getParameter("insertPass"));
		dto.setName(request.getParameter("insertName"));
		dto.setBirth(request.getParameter("insertBirth"));
		dto.setPhone(request.getParameter("insertPhone"));
		dto.setEmail(request.getParameter("insertEmail"));
		dto.setPost(request.getParameter("insertPostcode"));
		dto.setAddress(request.getParameter("insertAddress"));
		dto.setAddress_detail(request.getParameter("insertAddress2"));
		
		if (dao.userInsert(dto) < 1) {
			String url = "loginView.we";
			out.print("<script>alert('회원가입 실패/n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		}
	}
}
