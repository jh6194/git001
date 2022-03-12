package com.wecar.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wecar.dao.BoardDao;
import com.wecar.dto.NoticeBoardDto;
import com.wecar.ucontroller.WAction;

public class NoticeBoardEdit implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String path = request.getServletContext().getRealPath("/board/upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
			
			BoardDao dao = new BoardDao();
			NoticeBoardDto dto2 = new NoticeBoardDto();
			
			String bimg = multi.getFilesystemName("after_bimg");
			
			if (bimg == null) {
				NoticeBoardDto dto = new NoticeBoardDto();
				dto.setBno(Integer.parseInt(request.getParameter("bno")));
				NoticeBoardDto before_img = dao.select(dto);
				bimg = before_img.getBimg();
			}
			
			dto2.setBtitle(multi.getParameter("btitle"));
			dto2.setBcontent(multi.getParameter("bcontent"));
			dto2.setBno(Integer.parseInt(request.getParameter("bno")));
			dto2.setBpass(multi.getParameter("bpass"));
			dto2.setBimg(bimg);
			dto2.setBip(InetAddress.getLocalHost().getHostAddress());
			
			if (dao.update(dto2) < 1) {
				out.print("<script>alert('글 수정 실패'); location.href='noticeDetail.board?bno="+dto2.getBno()+"';</script>");
			} else {
				out.print("<script>alert('글 수정 성공'); location.href='noticeDetail.board?bno="+dto2.getBno()+"';</script>");
			}
		} catch (Exception e) {e.printStackTrace();}
	}
}
