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

@WebServlet("/COVID19")
public class COVID19 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public COVID19() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			URL url = null;
			HttpURLConnection con = null;
			BufferedReader br = null;
			
			String apiURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=B7agUfmNaB16pDvcbIOlsEUhoV0XIuqD3nyrfrveH3MHrfxnMd3VqnmaPpopi%2Bp44dZEx%2B9M5xmCDc8A91ZwHg%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20220119&endCreateDt=20220119";
			
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
