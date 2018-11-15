package com.ob.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;
import com.ob.vo.DaehoonVO;

public class queViewComand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println("~~~~~"+ id);
		
		DAO.updateHit(Integer.parseInt(id));
		
		
		DaehoonVO vo = DAO.queSelOne(id);
		
		System.out.println("queViewCommand 에서 값" +vo);
		
		request.getSession().setAttribute("Bovo", vo);
		
		//3. 게시글(b_idx)에 딸린 댓글 있으면 화면에 표시
		List<BoardreplyVO> c_list = DAO.getCommList(id);
		System.out.println("불러온 댓글 댓글목록 : " + c_list);

		//EL,JSTL 사용을 위한 속성 등록 ------------------
		request.setAttribute("c_list", c_list);

		
		
		return "queView.jsp";
	}

}
