package com.ob.command;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;
import com.ob.vo.DaehoonVO;
import com.ob.vo.UserVO;

public class queViewComand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		DAO.updateHit(Integer.parseInt(id));

		DaehoonVO vo = DAO.queSelOne(id);

		System.out.println("queViewCommand 에서 값" + vo);

		request.getSession().setAttribute("Bovo", vo);

		// 3. 게시글(b_idx)에 딸린 댓글 있으면 화면에 표시
		List<BoardreplyVO> c_list = DAO.getCommList(id);
		System.out.println("불러온 댓글 댓글목록 : " + c_list);

		// EL,JSTL 사용을 위한 속성 등록 ------------------
		request.setAttribute("c_list", c_list);
		
		// queView에서 작성자, 혹은 관리자일 경우에만 수정/삭제버튼 보이도록
		// 판단 처리하고 파라미터 넘겨줌
		UserVO uvo = (UserVO)request.getSession().getAttribute("uservo");
		String user_id = uvo.getId();
		String writer_id = vo.getUser_id();
		int writer_chk = 0;
		if(user_id.equals(writer_id)) {
			writer_chk = 1;
		} else {
			if(user_id.equals("1")) {
				writer_chk = 1;
			}
		}
		System.out.println("writer_chk : " + writer_chk);
		request.setAttribute("writer_chk", writer_chk);
		return "queView.jsp";
	}

}
