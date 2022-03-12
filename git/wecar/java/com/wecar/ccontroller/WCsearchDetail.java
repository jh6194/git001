package com.wecar.ccontroller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dao.CDao;
import com.wecar.dto.CDto;
import com.wecar.dto.CRVDto;
import com.wecar.dto.RDto;
import com.wecar.ucontroller.WAction;

public class WCsearchDetail implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CDto cdto = new CDto();
		RDto rdto = new RDto();
		CRVDto rvdto = new CRVDto();
		CDao dao = new CDao();
		
		cdto.setCno(request.getParameter("cno"));
		rvdto.setCno(request.getParameter("cno"));
		
		String pdate = request.getParameter("pdate");
		String rdate = request.getParameter("rdate");
		
		if (request.getParameter("pdate").equals("1")) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				pdate = sdf.format(cal.getTime());
				cal.add(Calendar.DATE, 1);
				rdate = sdf.format(cal.getTime());
			} catch (Exception e) {  e.printStackTrace(); }
		}
		rdto.setPdate(pdate);
		rdto.setRdate(rdate);			
		
		request.setAttribute("list", dao.searchDetail(cdto, rdto));
		request.setAttribute("review", dao.reviewList(rvdto));
		request.setAttribute("pdate", pdate);
		request.setAttribute("rdate", rdate);
	}
}
