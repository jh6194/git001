package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUfindPassChange implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setId(request.getParameter("hiddenId"));
		dto.setPass(request.getParameter("afterPass"));
		
		if (dao.userFindPassChange(dto) < 1) {
			String url = "findPopPassDoView.we";
			out.print("<script>alert('비밀번호 변경을 실패했습니다.//n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		}
	}
}
