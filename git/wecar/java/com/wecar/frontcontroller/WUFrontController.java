package com.wecar.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wecar.ucontroller.WAction;
import com.wecar.ucontroller.WUEmail;
import com.wecar.ucontroller.WUInsert;
import com.wecar.ucontroller.WUKakaoLogin;
import com.wecar.ucontroller.WUKakaoUpdate;
import com.wecar.ucontroller.WUdelete;
import com.wecar.ucontroller.WUdeleteView;
import com.wecar.ucontroller.WUemailUpdate;
import com.wecar.ucontroller.WUfindId;
import com.wecar.ucontroller.WUfindPass;
import com.wecar.ucontroller.WUfindPassChange;
import com.wecar.ucontroller.WUinfoUpdate;
import com.wecar.ucontroller.WUlogin;
import com.wecar.ucontroller.WUlogout;
import com.wecar.ucontroller.WUpassUpdate;
import com.wecar.ucontroller.WUselect;

public class WUFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WUFrontController() { super();  }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}
	
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String path = request.getServletPath();
		
		WAction controller = null;
		
		if(path.equals("/main.we")) {
			/* 메인(V) */
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		} else if(path.equals("/loginView.we")) {
			/* 로그인(V) */
			request.getRequestDispatcher("/user/user_login.jsp").forward(request, response);
			
		} else if(path.equals("/loginDo.we")) {
			/* 로그인 */
			controller = new WUlogin();
			controller.execute(request, response);
		
		} else if(path.equals("/userInsertView.we")) {
			/* 회원가입(V) */	
			request.getRequestDispatcher("/user/user_insert.jsp").forward(request, response);
			
		} else if(path.equals("/userInsertDo.we")) {
			/* 회원가입 */	
			controller = new WUInsert();
			controller.execute(request, response);
			
			out.print("<script>alert('회원가입 성공\\n위카에 오신걸 환영합니다.'); location.href = 'loginView.we';</script>");
			
		}  else if(path.equals("/logout.we")) {
			/* 로그아웃 */	
			controller = new WUlogout();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/logout.jsp").forward(request, response);
			
		} else if(path.equals("/findPopIdView.we")) {
			/* 아이디찾기(V) */
			request.getRequestDispatcher("/user/findPopId.jsp").forward(request, response);
			
		} else if(path.equals("/findPopIdDo.we")) {
			/* 아이디찾기 */
			controller = new WUfindId();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/findPopId_result.jsp").forward(request, response);
		
		} else if(path.equals("/findPopPassView.we")) {
			/* 비밀번호찾기(V) */	
			request.getRequestDispatcher("/user/findPopPass.jsp").forward(request, response);
			
		} else if(path.equals("/findPopPassEmailView.we")) {
			/* 비밀번호찾기인증 */
			controller = new WUfindPass();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/findPopPassEmail.jsp").forward(request, response);
			
		}  else if(path.equals("/findPopPassDo.we")) {
			/* 비밀번호변경(V) */
			request.getRequestDispatcher("/user/findPopPassChange.jsp").forward(request, response);
		
		} else if(path.equals("/findPopPassDoView.we")) {
			/* 비밀번호변경 */
			controller = new WUfindPassChange();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/findPopPass_result.jsp").forward(request, response);
		
		} else if(path.equals("/mypageView.we")) {
			/* 마이페이지(V) */
			controller = new WUselect();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/user_mypage.jsp").forward(request, response);
			
		} else if(path.equals("/mypagePassDo.we")) {
			/* 마이페이지 pass수정 */
			controller = new WUpassUpdate();
			controller.execute(request, response);
			
			out.print("<script>alert('비밀번호 변경 성공\\n다시 로그인 해주세요.'); location.href = 'main.we';</script>");
			
		} else if(path.equals("/mypageInfoDo.we")) {
			/* 마이페이지 info수정 */
			controller = new WUinfoUpdate();
			controller.execute(request, response);
			
			out.print("<script>alert('개인정보 변경 성공'); location.href = 'mypageView.we';</script>");
			
		} else if(path.equals("/mypageEmailDo.we")) {
			/* 마이페이지 email수정 */
			controller = new WUemailUpdate();
			controller.execute(request, response);
			
			out.print("<script>alert('이메일 변경 성공'); location.href = 'mypageView.we';</script>");
			
		} else if(path.equals("/userDeleteView.we")) {
			/* 회원탈퇴(V) */
			controller = new WUdeleteView();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/user_delete.jsp").forward(request, response);
			
		} else if(path.equals("/userDeleteDo.we")) {
			/* 회원탈퇴 */
			controller = new WUdelete();
			controller.execute(request, response);
			
			out.print("<script>alert('회원탈퇴 성공\\n위카를 사용해주셔서 감사합니다.'); location.href = 'logout.jsp';</script>");	
			
		} else if(path.equals("/mail.we")) {
			/* 메일인증 */
			controller = new WUEmail();
			controller.execute(request, response);
			
		} else if(path.equals("/otherInfo.we")) {
			/* 기타정보 */
			request.getRequestDispatcher("/other_info.jsp").forward(request, response);
			
		} else if(path.equals("/serviceCenter.we")) {
			/* 고객센터 */
			request.getRequestDispatcher("/manager/serviceCenter.jsp").forward(request, response);
			
		} else if(path.equals("/kakaoView.we")) {
			/* kakao 등록(V) */
			controller = new WUselect();
			controller.execute(request, response);
			
			request.getRequestDispatcher("/user/user_simple.jsp").forward(request, response);
			
		}else if(path.equals("/kakaoDo.we")) {
			/* kakao 등록 */
			controller = new WUKakaoUpdate();
			controller.execute(request, response);
			
			out.print("<script>alert('이메일 등록 성공'); location.href = 'kakaoView.we';</script>");
			
		} else if(path.equals("/kakaoLogin.we")) {
			/* kakao 로그인 */
			controller = new WUKakaoLogin();
			controller.execute(request, response);
			
		}
	}
}
