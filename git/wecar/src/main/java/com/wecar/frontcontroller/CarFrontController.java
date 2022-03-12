package com.wecar.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.ccontroller.WCdelete;
import com.wecar.ccontroller.WCinsert;
import com.wecar.ccontroller.WClist;
import com.wecar.ccontroller.WCprice;
import com.wecar.ccontroller.WCreserve;
import com.wecar.ccontroller.WCreserveDo;
import com.wecar.ccontroller.WCsearchAjax;
import com.wecar.ccontroller.WCsearchDetail;
import com.wecar.ccontroller.WCselect;
import com.wecar.ccontroller.WCupdate;
import com.wecar.ucontroller.WAction;

@WebServlet("*.car")
public class CarFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarFrontController() {
        super();
    }

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
		
		if (path.equals("/list.car")) {
			// 관리
			controller = new WClist();
			controller.execute(request, response);
			
			url = "car/car_list.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/listSearch.car")) {
			// 검색
			url = "car/car_list_search.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/insertView.car")) {
			// 등록(V)
			url = "car/car_insert.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/insertDo.car")) {
			// 등록
			controller = new WCinsert();
			controller.execute(request, response);
		
		} else if (path.equals("/detail.car")) {
			// 정보
			controller = new WCselect();
			controller.execute(request, response);
			
			url = "car/car_detail.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/edit.car")) {
			// 수정
			controller = new WCupdate();
			controller.execute(request, response);
		
		} else if (path.equals("/delete.car")) {
			// 삭제
			controller = new WCdelete();
			controller.execute(request, response);
			
		} else if (path.equals("/search.car")) {
			// 렌트카 검색
			url = "car/car_search.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/ajax.car")) {
			// 렌트카 검색 ajax
			controller = new WCsearchAjax(); 
			controller.execute(request, response);
			
		} else if (path.equals("/searchDetail.car")) {
			// 렌트카 상세보기
			controller = new WCsearchDetail();
			controller.execute(request, response);
			
			url = "car/car_search_detail.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		} else if (path.equals("/price.car")) {
			// 총금액(ajax)
			controller = new WCprice(); 
			controller.execute(request, response);
			
		} else if (path.equals("/reserveView.car")) {
			// 예약
			controller = new WCreserve(); 
			controller.execute(request, response);
			
//			url = "car/car_reserve.jsp";
//			request.getRequestDispatcher(url).forward(request, response);
			 
		} else if (path.equals("/reserveDo.car")) {
			// 예약완료
			controller = new WCreserveDo();
			controller.execute(request, response);
			
			url = "car/car_reserve_result.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
