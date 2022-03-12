package com.wecar.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dto.BoardPagingDto;
import com.wecar.ucontroller.WAction;

public class NoticeBoardList implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int pstartno = 0;
		if (request.getParameter("pstartno") != null) {pstartno = Integer.parseInt(request.getParameter("pstartno"));}
		BoardPagingDto paging = new BoardPagingDto(pstartno);
		request.setAttribute("paging", paging);
	}
}
