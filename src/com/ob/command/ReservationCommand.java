package com.ob.command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.RoomVO;
import com.ob.vo.RoomfileVO;
import com.ob.vo.UserVO;

public class ReservationCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("************ReservationCommand.java 페이지**************");

		/* ************************************************************/
		
		//예약하기 상세 페이지용  파라미터
		String room_id = request.getParameter("room_id");
		String filename = request.getParameter("filename");
		String room_name = request.getParameter("room_name");
		String room_address1 = request.getParameter("room_address1");
		String room_address2 = request.getParameter("room_address2");
		String room_num = request.getParameter("room_num");
		String room_type_id = request.getParameter("room_type_id");
		String room_type = request.getParameter("room_type");
		String cost = request.getParameter("cost");
		String max_pax = request.getParameter("max_pax");
		String room_content = request.getParameter("room_content");
		String room_theme = request.getParameter("room_theme");
		
		System.out.println("room_id : " + room_id);
		System.out.println("filename : " + filename);
		System.out.println("room_name : " + room_name);
		System.out.println("room_address1 : " + room_address1);
		System.out.println("room_address2 : " + room_address2);
		System.out.println("room_num : " + room_num);
		System.out.println("room_type_id : " + room_type_id);
		System.out.println("room_type : " + room_type);
		System.out.println("cost : " + cost);
		System.out.println("max_pax : " + max_pax);
		System.out.println("room_content : " + room_content);
		System.out.println("room_theme : " + room_theme);
		
		request.setAttribute("room_id", room_id);
		request.setAttribute("filename", filename);
		request.setAttribute("room_name", room_name);
		request.setAttribute("room_address1", room_address1);
		request.setAttribute("room_address2", room_address2);
		request.setAttribute("room_num", room_num);
		request.setAttribute("room_type_id", room_type_id);
		request.setAttribute("room_type", room_type);
		request.setAttribute("cost", cost);
		request.setAttribute("max_pax", max_pax);
		request.setAttribute("room_content", room_content);
		request.setAttribute("room_theme", room_theme);
		
		/* ************************************************************/
		
		//예약하기 상세 페이지에서 뿌려줄 이미지 일람
		List<RoomfileVO> rfList = (List<RoomfileVO>)request.getSession().getAttribute("rfList");
		System.out.println("rfList : " + rfList);
		List<String> filenameList = new ArrayList();
		for(RoomfileVO rfvo : rfList) {
			if(rfvo.getRoom_id().equals(room_id)){
				filenameList.add(rfvo.getFilename());
			}
		}
		request.setAttribute("filenameList", filenameList);
				
		/* ************************************************************/
		
		RoomTABLEVO roomTable= DAO.getRoomTableByRid(room_id);
		List<ReservationVO> list = DAO.getResByRid(room_id);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String s_dateString ="";
		String e_dateString ="";
		Date s_date = new Date();
		Date e_date = new Date();
		
		Calendar cal = Calendar.getInstance();
		
		Map<String, Date> resDateMap = new HashMap<>();
		List<String> enableDates = new ArrayList<String>();
		
		if(!list.isEmpty()) {
			for(ReservationVO resvo : list) {
				s_dateString = resvo.getS_date();
				e_dateString = resvo.getE_date();
				
				try {
					s_date = format.parse(s_dateString);
					e_date = format.parse(e_dateString);
				} catch (ParseException e) {
				}
			       
		        while (s_date.compareTo(e_date) <= 0) {
		            enableDates.add(format.format(s_date));
		            cal.setTime(s_date);
		            cal.add(Calendar.DAY_OF_MONTH, 1);
		            s_date = cal.getTime();
		        }
			}
		}
		
		System.out.println("enableDates : " + enableDates);
		request.setAttribute("enableDates", enableDates);
		System.out.println("roomTable : " + roomTable);
		request.setAttribute("roomTable", roomTable);
		
		/* **********************************************************/
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal2 = Calendar.getInstance();
		String nowDate="";
		List<String> ableDates = new ArrayList<>(); 
				
		//이번달
		int year = cal2.get(Calendar.YEAR);
	    int mon = cal2.get(Calendar.MONTH)+1;
	    int day = cal2.get(Calendar.DAY_OF_MONTH);
	    System.out.println("day:" + day);
	    int startDate = day;
	    int firstday = 1;
	    int lastday = cal.getActualMaximum(Calendar.DATE);
	    
	    //다음달
	    cal.set(year, mon, day);
		int year2 = cal.get(Calendar.YEAR);
	    int mon2 = cal.get(Calendar.MONTH)+1;
	    int day2 = cal.get(Calendar.DATE);
	    int startDate2 = startDate;
	    int lastday2 = cal.getActualMaximum(Calendar.DATE);
		

	    
	    //이번달 처리
	    for(int i=startDate; i<=lastday; i++){
        	nowDate = year + "-" + mon + "-" + i;
        	if(!enableDates.contains(nowDate)){
        		ableDates.add(nowDate);
     	  	};
        };
        
        //다음달 처리
        for(int i=firstday; i<=lastday2; i++){
        	nowDate = year2 + "-" + mon2 + "-" + i;
        	if(!enableDates.contains(nowDate)){
        		ableDates.add(nowDate);
     	  	};
        };
        
        System.out.println("ableDates: " + ableDates);
        request.setAttribute("ableDates", ableDates);
        
		return "reservation.jsp";
	}

}
