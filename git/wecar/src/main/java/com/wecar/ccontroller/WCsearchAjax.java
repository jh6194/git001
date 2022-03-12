package com.wecar.ccontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.wecar.dao.CDao;
import com.wecar.dto.AjaxDto;
import com.wecar.dto.CDto;
import com.wecar.dto.RDto;
import com.wecar.ucontroller.WAction;

public class WCsearchAjax implements WAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RDto rdto = new RDto();
		CDto cdto = new CDto();
		CDao dao = new CDao();

		String price_start = request.getParameter("price_start");
		String price_end = request.getParameter("price_end");
			
		rdto.setPdate(request.getParameter("pdate"));
		rdto.setRdate(request.getParameter("rdate"));
		
		cdto.setLno(request.getParameter("lno"));
		cdto.setBrand(request.getParameter("brand"));
		cdto.setModel(request.getParameter("model"));
		cdto.setType(request.getParameter("type"));
		cdto.setFuel(request.getParameter("fuel"));
		cdto.setPersonnel(request.getParameter("personnel"));
		cdto.setVehicle_year(request.getParameter("year"));
		
		JsonArray arr = new JsonArray();
		
		for (AjaxDto i : dao.searchAjax(rdto, cdto, price_start, price_end)) {
			JsonObject obj = new JsonObject();
			obj.addProperty("cno", i.getCno());
			obj.addProperty("model", i.getModel());
			obj.addProperty("personnel", i.getPersonnel());
			obj.addProperty("vehicle_year", i.getVehicle_year());
			obj.addProperty("cprice", i.getCprice());
			obj.addProperty("cimg", i.getCimg());
			obj.addProperty("tname", i.getTname());
			obj.addProperty("fname", i.getFname());
			obj.addProperty("brname", i.getBrname());
			obj.addProperty("lname", i.getLname());
			obj.addProperty("smoking", i.getSmoking());
			obj.addProperty("navigation", i.getNavigation());
			obj.addProperty("smart", i.getSmart());
			obj.addProperty("rear", i.getRear());
			obj.addProperty("bluetooth", i.getBluetooth());
			obj.addProperty("cnt", i.getCnt());
			obj.addProperty("star", dao.searchAvgAjax(i.getCno()));
			arr.add(obj);
		}
		out.print(arr);
	}
}
