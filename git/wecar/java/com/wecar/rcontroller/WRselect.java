package com.wecar.rcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.dao.RDao;
import com.wecar.dto.RDto;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WRselect implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		RDto rdto = new RDto();
		RDao rdao = new RDao();
		
		HttpSession session = request.getSession();
		WDto user = (WDto) session.getAttribute("user");

		rdto.setUno(user.getUno());
		
		int rno = rdao.rnoSelect(rdto);
		
		request.setAttribute("uno", user.getUno());
		request.setAttribute("map", rdao.reserveSelect(rno));
		}
	}
