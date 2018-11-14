package com.ob.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.UserVO;
import com.sun.corba.se.impl.ior.GenericTaggedComponent;

public class LoginCheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		String account = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		System.out.println("입력된 account 값 : " + account + " 입력된 pw값 : " + pwd);
		UserVO uvo = DAO.checkId(account);

		PrintWriter out = response.getWriter();

		if (uvo == null) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<meta charset='utf-8'>");
			out.println("<head>");
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.println("</head>");
			out.println("</html>");
			out.close();
		}

	

		if (uvo.getAccount().equalsIgnoreCase(account) && uvo.getPassword().equalsIgnoreCase(pwd)) {
			System.out.println("getid():" + uvo.getId());
			request.getSession().setAttribute("account", account); // 언제 쓸까 체크
			request.getSession().setAttribute("uservo", uvo);

			List userResList = DAO.getUserReservation(uvo.getId());
			System.out.println("유저가 예약 리스트가 있는지 확인용 : "+userResList);

			request.getSession().setAttribute("userReservationvo", userResList);

			// --김재현 추가부분
			// --> 유저 고유 id 번호에 대한 boardplusVO 리스트로 전체 보기
			request.getSession().setAttribute("userboardtotalList", DAO.getUserBoardTotalList(uvo.getId()));
			// --

			return "main.jsp";

		} else {

			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<meta charset='utf-8'>");
			out.println("<head>");
			out.println("<script>");
			out.println("alert('아이디 혹은 비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.println("</head>");
			out.println("</html>");
			out.close();
		}
		return "login.jsp";

	}

}
