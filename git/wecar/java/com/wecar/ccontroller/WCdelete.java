package com.wecar.ccontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.CDao;
import com.wecar.dto.CDto;
import com.wecar.dto.COPDto;
import com.wecar.ucontroller.WAction;

public class WCdelete implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		COPDto odto = new COPDto();
		CDto cdto = new CDto();
		CDao dao = new CDao();
		
		String cno = request.getParameter("cno");
		
		odto.setCno(cno);
		cdto.setCno(cno);

		if (dao.optionDelete(odto) < 1 || dao.carDelete(cdto) < 1) {
			out.print("<script>alert('삭제 실패'); location.href = 'detail.car?cno="+cno+"';</script>");
		} else {
			out.print("<script>alert('삭제 성공'); location.href = 'list.car';</script>");
		}
	}
}
