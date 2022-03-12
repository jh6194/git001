package com.wecar.ccontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.CDao;
import com.wecar.ucontroller.WAction;

public class WClist implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CDao dao = new CDao();
		
		request.setAttribute("list", dao.carList());
	}
}
