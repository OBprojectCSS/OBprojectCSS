package com.ob.command;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.DaehoonVO;

public class queModiCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("update_chk");
		String id = request.getParameter("update_id");
		String bType = request.getParameter("board_type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("write_date");
		String count = request.getParameter("read_count");
		
//		System.out.println("id: " + id);
		
		String path = null;
		
		if (chk == null) {
			path = "queModi.jsp";
		} else {
			DaehoonVO vo = new DaehoonVO();
			
			vo.setId(id);
			vo.setBoard_type(bType);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWrite_date(date);
			vo.setRead_count(count);
			
			DAO.queUp(vo);
			
			path = "controller?type=que&board_type=3&id=";
		}
		return path;
	}

}
