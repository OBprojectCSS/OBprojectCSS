package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;

public class queDelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 게시물 삭제 처리 페이지
				String chk = request.getParameter("delete_chk");
				String id = request.getParameter("delete_id");
				
				System.out.println("chk: " + chk + ", id: " + id);
				
				String path = null;
				
				if (chk == null) {
					path = "queView.jsp";
				} else {
					DAO.noticeDel(id);
					System.out.println("여기");
					path = "controller?type=que&board_type=3";
				}		
				return path;

	}

}
