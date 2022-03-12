package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUdeleteView implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		HttpSession session = request.getSession();
		WDto user = (WDto) session.getAttribute("user");
		dto.setUno(user.getUno());
			
		if (dao.userSelect(dto) == null) {
			String url = "mypageView.we";
			out.print("<script>alert('정보 불러오기 실패//n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		} else {
			request.setAttribute("userinfo", dao.userSelect(dto));
		}
	}
}
