package com.ob.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;

public class ReservationDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("resId");
		int result = DAO.deleteReservation(id);
		
		if(result<=0) {
			System.out.println("예약취소 실패");
		} else if(result>0) {
			System.out.println("예약취소 성공");
		}
		return "controller?type=revList";
	}

}
