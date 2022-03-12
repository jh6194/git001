package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUemailUpdate implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setUno(Integer.parseInt(request.getParameter("hiddenNo")));
		dto.setEmail(request.getParameter("updateEmail"));
		
		if (dao.userEmailUpdate(dto) < 1) {
			String url = "userDetail.we";
			out.print("<script>alert('정보수정 실패/n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		}
	}
}
