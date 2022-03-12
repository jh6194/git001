package com.wecar.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.rcontroller.WRdelete;
import com.wecar.rcontroller.WRdetail;
import com.wecar.rcontroller.WRlist;
import com.wecar.rcontroller.WRselect;
import com.wecar.rcontroller.WRupdate;
import com.wecar.ucontroller.WAction;

@WebServlet("*.reserve")
public class ReserveFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReserveFrontController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}
	
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = request.getServletPath();
		String url = "";
		
		WAction controller = null;
		
		if(path.equals("/select.reserve")) {
			// 예약확인
			controller = new WRselect();
			controller.execute(request, response);
			
			url = "reserve/reserve_select.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if(path.equals("/list.reserve")) {
			// 예약리스트
			controller = new WRlist();
			controller.execute(request, response);

		} else if(path.equals("/detail.reserve")) {
			// 예약상세보기
			controller = new WRdetail();
			controller.execute(request, response);
			
			url = "reserve/reserve_select.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if(path.equals("/delete.reserve")) {
			// 예약취소
			controller = new WRdelete();
			controller.execute(request, response);
	
		} else if(path.equals("/update.reserve")) {
			// 인수반납 
			controller = new WRupdate();
			controller.execute(request, response);
	
		}
	}
}
