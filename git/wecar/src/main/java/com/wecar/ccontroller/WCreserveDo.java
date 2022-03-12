package com.wecar.ccontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.RDao;
import com.wecar.dto.RDto;
import com.wecar.ucontroller.WAction;

public class WCreserveDo implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RDto rdto = new RDto();
		RDao rdao = new RDao();
		
		rdto.setRprice(Integer.parseInt(request.getParameter("rprice")));
		rdto.setPdate(request.getParameter("pdate"));
		rdto.setRdate(request.getParameter("rdate"));
		rdto.setCno(request.getParameter("cno"));
		rdto.setUno(Integer.parseInt(request.getParameter("uno")));
		rdto.setInsu(request.getParameter("insu"));
		
		if (rdao.reserveInsert(rdto) < 1) {
			out.print("<script>alert('예약 실패'); location.href = 'search.car';</script>");
		}
	}
}
