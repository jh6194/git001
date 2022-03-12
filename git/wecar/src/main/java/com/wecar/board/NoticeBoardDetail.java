package com.wecar.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.BoardDao;
import com.wecar.dto.NoticeBoardDto;
import com.wecar.ucontroller.WAction;

public class NoticeBoardDetail implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BoardDao dao = new BoardDao();
		NoticeBoardDto dto = new NoticeBoardDto();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dao.update_bhit(dto);
		request.setAttribute("select", dao.select(dto));
	}
}
