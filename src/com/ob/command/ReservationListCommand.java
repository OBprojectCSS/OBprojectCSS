package com.ob.command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.ReservationVO;
import com.ob.vo.UserVO;

public class ReservationListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("************ReservationListCommand.java 페이지**************");
		//예약 리스트 조회를 위해 Session에 있는 Uservo 가져옴
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");

		//UserVO로 해당고객 예약목록 조회
		List<ReservationVO> userResList = DAO.getUserReservation(uvo);
		request.setAttribute("userReservationvo", userResList);	//예약목록 request에 담음
		System.out.println("userResList : " + userResList);
		
		//오늘 날짜와 예약시작일(s_date : 체크인날짜) 비교해서 파라미터 하나 넘겨줌
		int day_chk = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar today = Calendar.getInstance();
		Calendar s_date = Calendar.getInstance();
		String todayStr = sdf.format(today.getTime());
		System.out.println("todayStr : " + todayStr);
		try {
			today.setTime(sdf.parse(todayStr));
		} catch (ParseException e2) {
			e2.printStackTrace();
		}
		/* 참고 Calendar -> String 변환
		String strDate = sdf.format(cal.getTime());
		
		*/

		for(ReservationVO rvo:userResList) {
			day_chk = 0;
			try {
				s_date.setTime(sdf.parse(rvo.getS_date()));
				System.out.println("*today : " + today);
				System.out.println("*s_date : " + s_date);
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("[ReservationListCommand.java : 날짜변환오류발생]");
				return "revList.jsp";
			}
			System.out.println("today.compareTo(s_date) : " + today.compareTo(s_date));
			if(today.compareTo(s_date)<=0) {
				System.out.println("today.compareTo(s_date) : " + today.compareTo(s_date));
				day_chk = 1;
			}
			rvo.setDay_chk(day_chk);
			System.out.println("rvo: " + rvo);
		}
		return "revList.jsp";
	}

}
