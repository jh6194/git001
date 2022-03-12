package com.wecar.ccontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.CDao;
import com.wecar.dto.CDto;
import com.wecar.dto.COPDto;
import com.wecar.dto.CRVDto;
import com.wecar.ucontroller.WAction;

public class WCselect implements WAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CDto cdto = new CDto();
		COPDto odto = new COPDto();
		CRVDto rvdto = new CRVDto();
		CDao dao = new CDao();
		
		cdto.setCno(request.getParameter("cno"));
		odto.setCno(request.getParameter("cno"));
		rvdto.setCno(request.getParameter("cno"));
		
		request.setAttribute("list", dao.carSelect(cdto));
		request.setAttribute("dto", dao.optionSelect(odto));
		request.setAttribute("review", dao.reviewList(rvdto));
	}
}
