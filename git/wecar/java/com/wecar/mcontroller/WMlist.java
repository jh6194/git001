package com.wecar.mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.dto.UserPagingDto;
import com.wecar.ucontroller.WAction;

public class WMlist implements WAction{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int pstartno = 0;
		if (request.getParameter("pstartno") != null) {pstartno = Integer.parseInt(request.getParameter("pstartno"));}
		UserPagingDto paging = new UserPagingDto(pstartno);
		request.setAttribute("paging", paging);
	}
}
