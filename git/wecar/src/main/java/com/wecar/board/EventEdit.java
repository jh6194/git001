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

public class EventEdit implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String path = request.getServletContext().getRealPath("/board/upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
			
			EventDao dao = new EventDao();
			EventDto dto2 = new EventDto();
			
			String eimg = multi.getFilesystemName("after_eimg");
			
			if (eimg == null) {
				EventDto dto = new EventDto();
				dto.setEno(Integer.parseInt(request.getParameter("eno")));
				EventDto before_img = dao.select(dto);
				eimg = before_img.getEimg();
			}
			
			dto2.setEtitle(multi.getParameter("etitle"));
			dto2.setEcontent(multi.getParameter("econtent"));
			dto2.setEno(Integer.parseInt(request.getParameter("eno")));
			dto2.setEpass(multi.getParameter("epass"));
			dto2.setEimg(eimg);
			dto2.setEip(InetAddress.getLocalHost().getHostAddress());
			
			if (dao.update(dto2) < 1) {
				out.print("<script>alert('글 수정 실패'); location.href='eventDetail.board?eno="+dto2.getEno()+"';</script>");
			} else {
				out.print("<script>alert('글 수정 성공'); location.href='eventDetail.board?eno="+dto2.getEno()+"';</script>");
			}
		} catch (Exception e) {e.printStackTrace();}
	}
}
