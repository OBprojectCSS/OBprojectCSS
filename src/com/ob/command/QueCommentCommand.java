package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.dao.DAO;
import com.ob.vo.BoardreplyVO;

public class QueCommentCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String board_id = request.getParameter("board_id");
		String user_id = request.getParameter("user_id");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		//
		String quePage = request.getParameter("quePage");
		System.out.println(writer);
		
		BoardreplyVO replyVO = new BoardreplyVO();
		
		replyVO.setBoard_id(board_id);
		replyVO.setUser_id(user_id);
		replyVO.setContent(content);
		replyVO.setWriter(writer);
		
		int result =DAO.replyInsert(replyVO);
		
		if(result>=1) {
		System.out.println("정상적으로 댓글이 달렸습니다");
		}
		
		return "controller?type=queView&board_type=3&id="+board_id+"&quePage="+quePage;
	}

}
