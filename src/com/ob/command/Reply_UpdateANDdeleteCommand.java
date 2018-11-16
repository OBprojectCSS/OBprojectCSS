package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;

public class Reply_UpdateANDdeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//이 커맨드는 queView.jsp 페이지에 댓글 수정,삭제 버튼 누를시 controller?type=reply_update_delete&chk=1 or chk=2를 타고
		// chk값이 1이면 수정을 chk2면 삭제를 하는 곳		
		
		String chk = request.getParameter("chk"); 
		String comm_id =  request.getParameter("comm_id"); 
		String comm_board_id =  request.getParameter("comm_board_id"); 
		String comm_user_id =  request.getParameter("comm_user_id"); 
		String comm_content =  request.getParameter("comm_content"); 
		String quePage = request.getParameter("quePage");
		String path = "";
		
		System.out.println("chk : " + chk +" comm_id : "+comm_id + " comm_board_id : " + "comm_user_id :"+ comm_user_id + " comm_content : " +  comm_content );
		
		BoardreplyVO replyVO = new BoardreplyVO();
		
		
		switch (chk) {
		case "1":
			replyVO.setId(comm_id);
			replyVO.setContent(comm_content);	
			int result1 = DAO.replyUpdate(replyVO);
			if(result1>=1) {
				System.out.println("코멘트 테이블 업데이트가 정상적으로 됨!!!!!!!");
			}			
			path = "controller?type=queView&board_type=3&id="+comm_board_id+"&quePage="+quePage;
			break;
		case "2":
			int result2 = DAO.replyDelete(comm_id);
			if(result2>=1) {
				System.out.println("코멘트 테이블이 삭제 됨!!!!!!!");
			}
			path = "controller?type=queView&board_type=3&id="+comm_board_id+"&quePage="+quePage;
			break;
		}
		

		return path;
	}
	

}
