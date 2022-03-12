package com.wecar.ucontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;

public class WUKakaoLogin implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setKakao(request.getParameter("kakaoEmail"));
		if (dao.kakaoLogin(dto) == null) {
			String url = "loginView.we";
			out.print("<script>alert('로그인 실패\\n간편 로그인을 등록해주세요.'); location.href = '"+url+"';</script>");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", dao.kakaoLogin(dto));
			
			out.print("<script>location.href = 'kakaoLogin.jsp?uno="+dao.kakaoLogin(dto).getUno()+"';</script>");
		}
	}
}
