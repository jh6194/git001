package com.wecar.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.BoardDao;
import com.wecar.dto.NoticeBoardDto;
import com.wecar.ucontroller.WAction;

public class NoticeBoardDelete implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		BoardDao dao = new BoardDao();
		NoticeBoardDto dto = new NoticeBoardDto();
		
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setBpass(request.getParameter("bpass"));
		
		if (dao.delete(dto) < 1) {
			out.print("<script>alert('글 삭제 실패'); location.href='noticeDelete_view.board?bno="+dto.getBno()+"';</script>");
			return;
		}
	}
}
