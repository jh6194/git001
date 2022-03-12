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

public class WUlogin implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		WUDao dao = new WUDao();
		WDto dto = new WDto();
		
		dto.setId(request.getParameter("loginId"));
		dto.setPass(request.getParameter("loginPass"));
		
		if (request.getParameter("idRemember") != null) {	// 아이디 저장을 체크 했다면
			String cookie = request.getHeader("Cookie");
			if (cookie != null) {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("remember")) {	// 그 전의 쿠키가 존재한다면 지우고 새로 추가
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						Cookie create = new Cookie("remember", request.getParameter("loginId"));
						response.addCookie(create);
					} else {	// 그 전의 쿠키가 없으면 새로 추가
						Cookie create = new Cookie("remember", request.getParameter("loginId"));
						response.addCookie(create);
					}
				}
			}
		} else {	// 아이디 저장 체크를 안했다면
			String cookie = request.getHeader("Cookie");
			if (cookie != null) {
				Cookie[] cookies = request.getCookies();
				for (Cookie i : cookies) {
					if (i.getName().equals("remember")) {	// 해당 쿠키를 지워서 빈칸으로 만든다.
						i.setMaxAge(0);
						response.addCookie(i);
					}
				}
			} 
		}
		
		if (dao.userLogin(dto) == null) {
			out.print("<script>alert('로그인 실패\\n아이디와 비밀번호를 확인해주세요.'); location.href = 'loginView.we';</script>");
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", dao.userLogin(dto));
			out.print("<script>location.href = 'login.jsp?uno="+dao.userLogin(dto).getUno()+"';</script>");
		}
	}
}
