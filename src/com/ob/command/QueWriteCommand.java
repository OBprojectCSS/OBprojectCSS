package com.ob.command;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.vo.DaehoonVO;
import com.ob.vo.UserVO;

public class QueWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String chk = request.getParameter("write_chk");
		UserVO uvo = (UserVO)session.getAttribute("uservo");
		String uId1 = uvo.getId();
		String bType = request.getParameter("board_type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("write_date");
		String count = request.getParameter("read_count");
		
		System.out.println("chk: -->>" + chk);
		System.out.println("uId: " + uId1 + ", bType: " + bType);
		
		String path = null;
		
		if (chk == null) {
			path = "queWrite.jsp";
		} else {
			DaehoonVO vo = new DaehoonVO();
			
			vo.setUser_id(uId1);
			vo.setBoard_type(bType);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWrite_date(date);
			vo.setRead_count(count);
			
			DAO.queInsert(vo);
			
			path = "controller?type=que&board_type=3";
		}
		return path;
	}
}
