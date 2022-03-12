package com.wecar.mcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WMDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WMdelete implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WMDao dao = new WMDao();
		WDto dto = new WDto();
		
		int uno = Integer.parseInt(request.getParameter("detailUno"));
		
		dto.setUno(uno);
	
		if (dao.delete(dto) < 1) {
			String url = "userDetail.manager?uno="+uno;
			out.print("<script>alert('회원삭제 실패'); location.href = '"+url+"';</script>");
		}
	}
}
