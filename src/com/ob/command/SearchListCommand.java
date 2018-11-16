package com.ob.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ob.dao.DAO;
import com.ob.mybatis.PagingNotice;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.RoomfileVO;

public class SearchListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("************SearchListCommand.java 페이지**************");
		String chk_si = request.getParameter("chk_si");
		String chk_gu = request.getParameter("chk_gu");
		

		if(chk_si == null||chk_gu == null) {
			HttpSession session = request.getSession();
			chk_si = (String) session.getAttribute("chk_si");
			chk_gu = (String) session.getAttribute("chk_gu");
		}
		
		System.out.println("받은 chk_si : " + chk_si);
		System.out.println("받은 chk_gu : " + chk_gu);

		Map<String, String> locMap = new HashMap<>();
		
		/*locMap.put("chk_si", "서울시");
		locMap.put("chk_gu", "마포구");*/
		locMap.put("chk_si", chk_si);
		locMap.put("chk_gu", chk_gu);
		
		// 페이징 처리를 위한 객체 생성
		PagingNotice p = new PagingNotice();
		p.setNumPerPage(3);// 페이지당 3개
		// p.setPagePerBlock(5); //블록에 몇개 표시할지
		
		System.out.println("DAO.siguCount(locMap) : " + DAO.siguCount(locMap));

		p.setTotalRecord(DAO.siguCount(locMap));
		p.setTotalPage();// 전체 페이지 갯수 구하기

		// 2. 현재 페이지 구하기 (디폴트 값 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		// 3. 현재페이지의 시작번호 끝번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, String> map = new HashMap<>();
		// map.put("chk_si", chk_si);
		// map.put("chk_gu", chk_gu);
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		/*map.put("chk_si", "서울시");
		map.put("chk_gu", "마포구");*/
		map.put("chk_si", String.valueOf(chk_si));
		map.put("chk_gu", String.valueOf(chk_gu));
		System.out.println(map);

		/* *****************************************************************/
		//list에 (시/구 해당되는) 방 목록을 페이지별로 담음
		List<RoomTABLEVO> list = DAO.get_room(map);
		
		/* 테마별 검색에서도 쓸 수 있도록 SearchCommand로 옮김
		//전체 파일 담기
		List<RoomfileVO> rfList = DAO.get_room_file();
		System.out.println("rfList : " + rfList);
		request.getSession().setAttribute("rfList", rfList);
		*/
		List<RoomfileVO> rfList = (List<RoomfileVO>)request.getSession().getAttribute("rfList");
		
		for (RoomTABLEVO rvo : list) {
			String rid = rvo.getRoom_id();
			List<String> rfidList = new ArrayList();
			List<String> rfnameList = new ArrayList();
			for (RoomfileVO rfvo : rfList) {
				if(rid.equals(rfvo.getRoom_id())){
					rfidList.add(rfvo.getRoom_file_id());
					rfnameList.add(rfvo.getFilename());
				}
			}
			rvo.setFile_id(rfidList.get(0));
			rvo.setFilename(rfnameList.get(0));
		}
		System.out.println(list);
		/* *****************************************************************/
		
		// request.getSession().setAttribute("getRoomimp", list);
		request.setAttribute("pvo", p);
		request.setAttribute("getRoomimp", list);
		request.setAttribute("cPage", cPage);
		request.getSession().setAttribute("chk_si", chk_si);
		request.getSession().setAttribute("chk_gu", chk_gu);
		request.getSession().removeAttribute("getRoomthemeimp");
		return "search_main.jsp";
		
		
		
	}

}