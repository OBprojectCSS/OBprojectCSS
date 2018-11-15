package com.ob.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.mybatis.PagingQue;
import com.ob.vo.DaehoonVO;
public class QueCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String board_type = request.getParameter("board_type");
		
		//***페이징 처리***
		PagingQue p = new PagingQue();
		
		
		p.setTotalRecord(DAO.totalCount(board_type));
		p.setTotalPage();
		
		String quePage = request.getParameter("quePage");
		if (quePage != null) {
			p.setNowPage(Integer.parseInt(quePage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		p.setBeginPage((p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("board_type", Integer.parseInt(request.getParameter("board_type")));
		
		System.out.println("QueCommand.java에서 board_type = : "+request.getParameter("board_type"));

		List<DaehoonVO> list = DAO.queSelect(map);
		
		request.setAttribute("quelist", list);
		request.setAttribute("quePage", quePage);
		request.setAttribute("quePvo", p);
	
		
		//-----지우기
		
		System.out.println("list 값 :" +list);
		//--
		
		
		String path = "que.jsp";
		return path;
	}

}
