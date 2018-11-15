package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.DaehoonVO;

public class queViewComand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		DaehoonVO vo = DAO.queSelOne(id);
		
		System.out.println("queViewCommand 에서 값" +vo);
		
		request.getSession().setAttribute("Bovo", vo);
		
		
		return "queView.jsp";
	}

}
