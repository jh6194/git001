package com.wecar.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wecar.dao.EventDao;
import com.wecar.dto.EventDto;
import com.wecar.ucontroller.WAction;

public class EventWrite implements WAction {

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
			EventDao dao = new EventDao();
			EventDto dto = new EventDto();

			String eimg = multi.getFilesystemName("eimg");
			
			dto.setEname(multi.getParameter("ename"));
			dto.setEpass(multi.getParameter("epass"));
			dto.setEtitle(multi.getParameter("etitle"));
			dto.setEcontent(multi.getParameter("econtent"));
			dto.setEimg(eimg);
			dto.setEip(InetAddress.getLocalHost().getHostAddress());
			
			if (dao.insert(dto) < 1) {
				out.print("<script>alert('글 작성 실패'); location.href = 'eventList.board'</script>");
			} else {
				out.print("<script>alert('글 작성 성공'); location.href = 'eventList.board'</script>");
			}
		} catch (Exception e) { e.printStackTrace(); }
	}
}
