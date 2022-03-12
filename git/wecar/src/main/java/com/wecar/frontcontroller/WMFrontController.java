package com.wecar.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.mcontroller.WMdelete;
import com.wecar.mcontroller.WMdetail;
import com.wecar.mcontroller.WMinfoUpdate;
import com.wecar.mcontroller.WMlist;
import com.wecar.mcontroller.WMpassUpdate;
import com.wecar.mcontroller.WMsearch;
import com.wecar.ucontroller.WAction;


public class WMFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WMFrontController() { super();  }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);;
	}
	
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String path = request.getServletPath();
		
		WAction controller = null;
		
		if(path.equals("/userList.manager")) {
			/* (M)유저관리 */
			controller = new WMlist();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/manager/manager_userList.jsp").forward(request, response);
			
		} else if(path.equals("/userDetail.manager")) {
			/* (M)유저상세보기 */
			controller = new WMdetail();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/manager/manager_userDetail.jsp").forward(request, response);
			
		} else if(path.equals("/userInfoUpdate.manager")) {
			/* (M)유저수정(비번x) */
			controller = new WMinfoUpdate();
			controller.execute(request, response);
			
		} else if(path.equals("/userPassUpdate.manager")) {
			/* (M)유저수정(비번o) */
			controller = new WMpassUpdate();
			controller.execute(request, response);
		
		} else if(path.equals("/userDelete.manager")) {
			/* (M)유저삭제 */
			controller = new WMdelete();
			controller.execute(request, response);
			
			out.print("<script>alert('회원삭제 성공'); location.href='userList.manager';</script>");
			
		} else if(path.equals("/userSearch.manager")) {
			/* (M)유저검색 */
			controller = new WMsearch();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/manager/manager_userSearch.jsp").forward(request, response);
		}
	}
}
