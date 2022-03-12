package com.wecar.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.EventDao;
import com.wecar.dto.EventDto;
import com.wecar.ucontroller.WAction;

public class EventDelete implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		EventDao dao = new EventDao();
		EventDto dto = new EventDto();
		
		dto.setEno(Integer.parseInt(request.getParameter("eno")));
		dto.setEpass(request.getParameter("epass"));
		
		if (dao.delete(dto) < 1) {
			out.print("<script>alert('글 삭제 실패'); location.href='eventDelete_view.board?eno="+dto.getEno()+"';</script>");
			return;
		}
	}
}
