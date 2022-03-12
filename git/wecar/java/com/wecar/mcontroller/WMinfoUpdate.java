package com.wecar.mcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.WMDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WMinfoUpdate implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WMDao dao = new WMDao();
		WDto dto = new WDto();
		
		int uno = Integer.parseInt(request.getParameter("detailUno"));
		
		dto.setUno(uno);
		dto.setPass(request.getParameter("updatePass"));
		dto.setEmail(request.getParameter("updateEmail"));
		dto.setRank(Integer.parseInt(request.getParameter("updateRank")));
		dto.setPhone(request.getParameter("updatePhone"));
		dto.setPost(request.getParameter("updatePostcode"));
		dto.setAddress(request.getParameter("updateAddress1"));
		dto.setAddress_detail(request.getParameter("updateAddress2"));
		
		String url = "userDetail.manager?uno="+uno;
		if (dao.infoUpdate(dto) < 1) {
			out.print("<script>alert('회원정보 수정 실패'); location.href = '"+url+"';</script>");
		} else {
			out.print("<script>alert('회원정보 수정 성공'); location.href='"+url+"';</script>");
		}
	}
}
