package com.wecar.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/KakaoLogin")
public class KakaoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoLogin() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String code = request.getParameter("code");
		System.out.println(code);
		String client_id = "0b3cb059ddb5bbed723a8bf94a8295b3";
		/* String redirect_uri = "http://localhost:8080/wecar/KakaoLogin"; */
		String redirect_uri = "https://jh6194.cafe24.com/wecar/KakaoLogin"; 
		String requsetUrl = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code";
		
		requsetUrl += "&client_id=" + client_id;
		requsetUrl += "&redirect_uri=" + redirect_uri;
		requsetUrl += "&code=" + code;
		
		URL url = null;
		HttpURLConnection con = null;
		BufferedReader br = null;
		
		try {
		url = new URL(requsetUrl);
		con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setRequestProperty("Content-type", "application/json;charset=utf-8");
		
		if(con.getResponseCode() == 200) { br = new BufferedReader(new InputStreamReader(con.getInputStream())); }
		else { br = new BufferedReader(new InputStreamReader(con.getErrorStream()));}
	
		String line = "";
		StringBuffer buffer = new StringBuffer();
		
		while((line = br.readLine()) != null) { buffer.append(line); }
		try {br.close();} catch (Exception e) {e.printStackTrace();}
		try {con.disconnect();} catch (Exception e) {e.printStackTrace();}
		
		System.out.println(buffer.toString());
		/* out.print(buffer.toString()); */
		
		JsonParser jsop = new JsonParser();
		JsonObject job = (JsonObject) jsop.parse(buffer.toString());
		String access_token = job.get("access_token").getAsString();
		System.out.println(access_token);
		
		requsetUrl = "https://kapi.kakao.com/v2/user/me";
		
		url = new URL(requsetUrl);
		con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", "Bearer " + access_token);
		con.setRequestProperty("Content-type", "application/json;charset=utf-8");
		
		if(con.getResponseCode() == 200) { br = new BufferedReader(new InputStreamReader(con.getInputStream())); }
		else { br = new BufferedReader(new InputStreamReader(con.getErrorStream())); }
		
		line = "";
		buffer = new StringBuffer();
		
		while ((line = br.readLine()) != null) { buffer.append(line); }
		
		System.out.println(buffer.toString());
		// {"id":2087157575,"connected_at":"2022-01-20T07:26:39Z","properties":{"nickname":"주환","profile_image":"http://k.kakaocdn.net/dn/bhL5k3/btrgB29XK3V/cgrXOKJ6dZPgIrLRLe5alk/img_640x640.jpg","thumbnail_image":"http://k.kakaocdn.net/dn/bhL5k3/btrgB29XK3V/cgrXOKJ6dZPgIrLRLe5alk/img_110x110.jpg"},"kakao_account":{"profile_nickname_needs_agreement":false,"profile_image_needs_agreement":false,"profile":{"nickname":"주환","thumbnail_image_url":"http://k.kakaocdn.net/dn/bhL5k3/btrgB29XK3V/cgrXOKJ6dZPgIrLRLe5alk/img_110x110.jpg","profile_image_url":"http://k.kakaocdn.net/dn/bhL5k3/btrgB29XK3V/cgrXOKJ6dZPgIrLRLe5alk/img_640x640.jpg","is_default_image":false},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"jh6194@naver.com"}}
		job = (JsonObject) jsop.parse(buffer.toString());
		JsonObject properties = (JsonObject) job.get("properties");
		request.setAttribute("nickname", properties.get("nickname").getAsString());
		request.setAttribute("profile_image", properties.get("profile_image").getAsString());
		JsonObject kakao_account = (JsonObject) job.get("kakao_account");
		request.setAttribute("email", kakao_account.get("email").getAsString());
		request.getRequestDispatcher("/user/kakaoLogin_result.jsp").forward(request, response);
		
		} catch (Exception e) { e.printStackTrace();
		} finally {
			try {br.close();} catch (Exception e) {e.printStackTrace();}
			try {con.disconnect();} catch (Exception e) {e.printStackTrace();}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
