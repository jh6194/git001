package com.wecar.ccontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.wecar.dao.CDao;
import com.wecar.ucontroller.WAction;

public class WCprice implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		CDao dao = new CDao();
		
		ArrayList<String> list = dao.priceSelect(Integer.parseInt(request.getParameter("insu")),Integer.parseInt(request.getParameter("cprice")));
		
		JsonObject arr = new JsonObject();
		
        arr.addProperty("result", list.get(0));
        arr.addProperty("price", list.get(1));

		out.print(arr);
	}
}
