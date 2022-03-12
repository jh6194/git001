package com.wecar.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Me")
public class Me extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Me() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		URL url = null;
		HttpURLConnection con = null;
		BufferedReader br = null;
		
		String apiURL = "https://smartcity.gimhae.go.kr/smart_tour/dashboard/api/publicData/dustSensor";
		
		try {
			url = new URL(apiURL);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			
			if(con.getResponseCode() == 200) { br =  new BufferedReader(new InputStreamReader(con.getInputStream())); }
			else {	br =  new BufferedReader(new InputStreamReader(con.getErrorStream())); }
			
			String line = "";
			StringBuffer buffer = new StringBuffer();
			while ( (line = br.readLine()) != null) { buffer.append(line); }
			out.print(buffer.toString());
			
		}catch(Exception e) {e.printStackTrace();} finally {
			try {br.close();} catch(Exception e) {e.printStackTrace();}
			try {con.disconnect();} catch(Exception e) {e.printStackTrace();}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
