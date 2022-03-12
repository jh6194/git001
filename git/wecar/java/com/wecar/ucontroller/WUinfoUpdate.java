package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUinfoUpdate implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setUno(Integer.parseInt(request.getParameter("hiddenNo")));
		dto.setPhone(request.getParameter("afterPhone"));
		dto.setPost(request.getParameter("afterPostcode"));
		dto.setAddress(request.getParameter("afterAddress1"));
		dto.setAddress_detail(request.getParameter("afterAddress2"));
		
		if (dao.userInfoUpdate(dto) < 1) {
			String url = "userDetail.we";
			out.print("<script>alert('정보수정 실패/n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		}
	}
}
