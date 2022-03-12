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

public class NoticeBoardWrite implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/* String path = "C:\\upload"; */
		String path = request.getServletContext().getRealPath("/board/upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
														//요청	처리경로		용량		인코딩파일명	동일할때 새로운이름처리
			BoardDao dao = new BoardDao();
			NoticeBoardDto dto = new NoticeBoardDto();

			String bimg = multi.getFilesystemName("bimg");
			
			dto.setBname(multi.getParameter("bname"));
			dto.setBpass(multi.getParameter("bpass"));
			dto.setBtitle(multi.getParameter("btitle"));
			dto.setBcontent(multi.getParameter("bcontent"));
			dto.setBimg(bimg);
			dto.setBip(InetAddress.getLocalHost().getHostAddress());
			
			if (dao.insert(dto) < 1) {
				out.print("<script>alert('글 작성 실패'); location.href = 'noticeList.board'</script>");
			} else {
				out.print("<script>alert('글 작성 성공'); location.href = 'noticeList.board'</script>");
			}
		} catch (Exception e) { e.printStackTrace(); }
	}
}
