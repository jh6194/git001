package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUdelete implements WAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setUno(Integer.parseInt(request.getParameter("deleteNo")));
		dto.setPass(request.getParameter("deletePass"));
		
		if (dao.userDelete(dto) < 1) {
			String url = "userDeleteView.we";
			out.print("<script>alert('회원탈퇴 실패\\n관리자에게 문의바랍니다.'); location.href = '"+url+"';</script>");
		} else {
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			
			String cookie = request.getHeader("Cookie");
			if (cookie != null) {
				Cookie[] cookies = request.getCookies();
				for (Cookie i : cookies) {
					if (i.getName().equals("remember")) {
						i.setMaxAge(0);
						response.addCookie(i);
					}
				}
			}
		}
	}
}
