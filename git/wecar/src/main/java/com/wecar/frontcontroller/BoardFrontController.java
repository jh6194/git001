package com.wecar.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wecar.board.EventDelete;
import com.wecar.board.EventDetail;
import com.wecar.board.EventEdit;
import com.wecar.board.EventList;
import com.wecar.board.EventWrite;
import com.wecar.board.NoticeBoardDelete;
import com.wecar.board.NoticeBoardDetail;
import com.wecar.board.NoticeBoardEdit;
import com.wecar.board.NoticeBoardList;
import com.wecar.board.NoticeBoardWrite;
import com.wecar.dao.WUDao;
import com.wecar.dto.WDto;
import com.wecar.ucontroller.WAction;

@WebServlet("*.board")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BoardFrontController() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}
	
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String path = request.getServletPath();
		String url = "";
		
		WAction controller = null;
		
		// noticeBoard 공지사항
		// noticeBoard 공지사항
		
		if(path.equals("/noticeList.board")) {
			// 목록(V)
			controller = new NoticeBoardList();
			controller.execute(request, response);
			
			url = "board/noticeBoard_list.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/noticeWrite_view.board")) {
			// 작성(V)
			url = "board/noticeBoard_write.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/noticeWrite.board")) {
			// 작성
			controller = new NoticeBoardWrite();
			controller.execute(request, response);
			
		} else if (path.equals("/noticeDetail.board")) {
			// 상세보기(V)
			controller = new NoticeBoardDetail();
			controller.execute(request, response);
			
			url = "board/noticeBoard_detail.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/noticeEdit_view.board")) {
			// 수정(V)
			controller = new NoticeBoardDetail();
			controller.execute(request, response);
			
			url = "board/noticeBoard_edit.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/noticeEdit.board")) {
			// 수정
			controller = new NoticeBoardEdit();
			controller.execute(request, response);
			
			url = "noticeDetail.board?bno="+request.getParameter("bno");
			out.print("<script>alert('성공'); location.href = '"+url+"';</script>");
			
		} else if (path.equals("/noticeDelete_view.board")) {
			// 삭제(V)
			url = "board/noticeBoard_delete.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/noticeDelete.board")) {
			// 삭제
			controller = new NoticeBoardDelete();
			controller.execute(request, response);
			url = "noticeList.board";
			out.print("<script>alert('성공'); location.href = '"+url+"';</script>");
		} 	
		
		// eventBoard 이벤트
		// eventBoard 이벤트
		
		if(path.equals("/eventList.board")) {
			// 목록(V)
			controller = new EventList();
			controller.execute(request, response);
			
			url = "board/event_list.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/eventWrite_view.board")) {
			// 작성(V)
			WUDao dao = new WUDao();
			WDto dto = new WDto();
			
			HttpSession session = request.getSession();
			WDto user = (WDto) session.getAttribute("user");
			
			if (user != null) {
				dto.setUno(user.getUno());
				request.setAttribute("user", dao.userSelect(dto));
			}
			
			url = "board/event_write.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/eventWrite.board")) {
			// 작성
			controller = new EventWrite();
			controller.execute(request, response);
			
		} else if (path.equals("/eventDetail.board")) {
			// 상세보기(V)
			controller = new EventDetail();
			controller.execute(request, response);
			
			url = "board/event_detail.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/eventEdit_view.board")) {
			// 수정(V)
			controller = new EventDetail();
			controller.execute(request, response);
			
			url = "board/event_edit.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/eventEdit.board")) {
			// 수정
			controller = new EventEdit();
			controller.execute(request, response);
			
			url = "eventDetail.board?eno="+request.getParameter("eno");
			out.print("<script>alert('성공'); location.href = '"+url+"';</script>");
			
		} else if (path.equals("/eventDelete_view.board")) {
			// 삭제(V)
			url = "board/event_delete.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/eventDelete.board")) {
			// 삭제
			controller = new EventDelete();
			controller.execute(request, response);
			url = "eventList.board";
			out.print("<script>alert('성공'); location.href = '"+url+"';</script>");
		}
	}
}
