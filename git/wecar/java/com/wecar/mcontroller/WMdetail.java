package com.wecar.mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.RDao;
import com.wecar.dao.WMDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

public class WMdetail implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		WMDao dao = new WMDao();
		RDao rdao = new RDao();
		WDto dto = new WDto();
		
		dto.setUno(Integer.parseInt(request.getParameter("uno")));
				
		request.setAttribute("list", rdao.userReserveList(dto));
		request.setAttribute("detail", dao.detail(dto));
	}
}
