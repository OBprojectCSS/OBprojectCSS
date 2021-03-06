package com.ob.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ob.mybatis.DBService;
import com.ob.vo.BoardplusVO;
import com.ob.vo.BoardreplyVO;
import com.ob.vo.DaehoonVO;
import com.ob.vo.ReservationVO;
import com.ob.vo.RoomTABLEVO;
import com.ob.vo.RoomfileVO;
import com.ob.vo.Si_GuVO;
import com.ob.vo.UserVO;

public class DAO {
	private static SqlSession ss;

	// 싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}

	/* **** 로그인, 회원가입 **********************************************/
	// 아이디값 조회
	public static UserVO checkId(String account) {
		return getSql().selectOne("checkId", account);
	}
	
	//로그인 한 유저의 예약기록 전체 조회
	public static List<ReservationVO> getUserReservation(UserVO uvo) {
		return getSql().selectList("getUserReservation", uvo);
	}
	
	//유저 - 마이페이지 - 예약취소
	public static int deleteReservation(String id) {
		return getSql().delete("deleteReservation", id);
	}
	
	// 회원가입 insert
	public static int checkJoin(UserVO vo) {
		return getSql().insert("checkJoin", vo);
	}

	// 회원 정보 변경 페이지
	public static int mypageUP(UserVO vo) {
		int result = getSql().update("mypageUP", vo);
		getSql().commit();
		return result;
	}
	
	// 중복 아이디 조회
	public static UserVO dupIdChk(String account) {
		return getSql().selectOne("dupIdChk", account);
	}
	
	
	
	/* *****************************************************************/

	/* **** 게시판 공용 ***************************************************/

	// 게시판별 전체 게시물 조회
	public static List<BoardplusVO> getAllList(String board_type) {
		return getSql().selectList("getList", board_type);
	}

	//게시판별 총 게시물 건수 조회
	public static int totalCount(String board_type) {
		int totalCount = getSql().selectOne("totalCount", board_type);
		return totalCount;
	}
	
	// 게시판 페이지별 목록조회
	public static List<BoardplusVO> getList(Map map) {
		return getSql().selectList("getPageList", map);
	}

	//프리미엄 후기용 페이지별 게시글 목록조회
	public static List<BoardplusVO> getPremPageList(Map map){
		return getSql().selectList("getPremPageList", map);
	}
	
	//프리미엄 후기용 게시글 상세조회
	public static BoardplusVO getPremOne(String pId) {
		return getSql().selectOne("getPremOne",pId);
	}
	
	//프리미엄 후기용 게시글 방정보 상세조회
	public static Map<String,String> getPremRoomDetail(String review_id){
		return getSql().selectOne("getPremRoomDetail", review_id);
	}
	
	//프리미엄 후기용 예약내역 상세조회
	public static List<ReservationVO> getUsedResDetail(UserVO uvo){
		return getSql().selectList("getUsedResDetail",uvo);
	}
	
	// 공지사항 게시물 작성
	public static int noticeInsert(BoardplusVO vo) {
		int result = getSql().insert("noticeInsert", vo);
		getSql().commit();
		return result;
	}

	// 공지사항 조회수
	public static int noticeHit(int id) {
		return getSql().update("noticeHit", id);
	}

	// 공지사항 게시물 보기
	public static BoardplusVO noticeSelOne(String id) {
		BoardplusVO vo = getSql().selectOne("noticeOne", id);
		return vo;
	}

	// 공지사항 게시물 삭제
	public static int noticeDel(String id) {
		int result = getSql().delete("noticeDel", id);
		getSql().commit();
		return result;
	}

	// 공지사항 게시물 수정
	public static int noticeUp(BoardplusVO vo) {
		int result = getSql().update("noticeUp", vo);
		getSql().commit();
		return result;
	}
	
	/*****************문의사항 게시판***************************/
	
	//문의사항 게시물 작성
	public static int queInsert(DaehoonVO vo) {
		int result = getSql().insert("queInsert", vo);
		getSql().commit();
		return result;
	}
	 
	// 문의사항 게시물 보기
	public static List<DaehoonVO> queSelect(Map<String, Integer> map) {
		List<DaehoonVO> list = getSql().selectList("quelist", map);
		return list;
	}

	// 문의사항 게시물보기
	public static DaehoonVO queSelOne(String id) {
		 
		return getSql().selectOne("queSelOne", id);
	}
	
	//문의사항 게시물 삭제
	public static int quedel(String id) {
		int result = getSql().delete("quedel", id);
		getSql().commit();
		return result;
	}
	
	// 문의사항 수정
	public static int queUp(DaehoonVO vo) {
		int result = getSql().update("queUp", vo);
		getSql().commit();
		return result;
	}
	
	/**********************이벤트 게시판******************************/
	// boardVOplus 모든 이벤트 데이터값 불러오기
	public static List<BoardplusVO> getEventALLList(Map<String, Integer> map) {
		return getSql().selectList("getEventALLcol", map);
	}

	public static List<BoardplusVO> getUserBoardTotalList(String id) {
		return getSql().selectList("getUserBoardTotalList", id);
	}

	// 파일 데이타 입력 처리
	public static int insert(BoardplusVO bvo) {
		return getSql().insert("file_insert", bvo);
	}

	public static BoardplusVO getDeatil(String b_id) {
		return getSql().selectOne("getDeatil", b_id);
	}

	/* ****************************************************************/
	
	/* ***전체검색(지역별) ********************/
	
	// 김재현 전체검석 지역 시 받아오기
	public static List<String> getsi() {
		return getSql().selectList("getsi");
	}

	// 김재현 전체검석 지역 구 받아오기
	public static List<String> getgu() {
		return getSql().selectList("getgu");
	}

	public static List<String> getgu2(String name) {
		System.out.println("DAO name 값: " + name);

		return getSql().selectList("getgu2", name);

	}
	
	public static List<Si_GuVO> getAddress() {
		
		return getSql().selectList("get_Address");
	}
	
	public static int siguCount(Map<String, String> map5) {
		int siguCount = getSql().selectOne("siguCount", map5);
		return siguCount;
	}

	//*********************************
	//방 전체검색(지역별) 출력용(전체방 리스트 & 파일)
	public static List<RoomTABLEVO> get_room(Map<String, String> map) {
		return getSql().selectList("get_room", map);
	}
	
	public static List<RoomfileVO> get_room_file(){
		return getSql().selectList("get_room_file");
	}
	/* ****************************************************************/

	/* ***전체검색(테마별) ********************/
	//테마 받아오기
	public static List<String> gettheme() {
		return getSql().selectList("gettheme");
	}

	//테마별 숙소 카운트
	public static int themeCount(String chk_theme) {
		return getSql().selectOne("themeCount",chk_theme);
	}
	
	//테마별 숙소 전체 조회
	public static List<RoomTABLEVO> getRoomTheme(Map<String, String> map) {
		return getSql().selectList("get_Roomtheme", map);
	}
	
	/* ****************************************************************/
	
	//(예약용) room_id로 예약조회
	public static List<ReservationVO> getResByRid(String room_id) {
		return getSql().selectList("getResByRid",room_id);
	}
	
	//(예약용) room_id로 방 상세정보 조회
	public static RoomTABLEVO getRoomTableByRid(String room_id) {
		return getSql().selectOne("getRoomTableByRid",room_id);
	}
	
	//(예약용) 예약정보 DB insert
	public static int insertReservation(ReservationVO resvo) {
		return getSql().insert("insertReservation", resvo);
	}

	
	//------------------ 조회수 관련
	public static int updateHit(int id) {
		return getSql().update("hit", id);
	}

	public static List<BoardreplyVO> getCommList(String id) {
		return getSql().selectList("commList", id);
	}

	public static int replyInsert(BoardreplyVO replyVO) {
		
		return getSql().insert("replyInsert", replyVO);
		
	}

	public static int replyUpdate(BoardreplyVO replyVO) {
		
		return getSql().update("replyUpdate", replyVO);
		
	}

	public static int replyDelete(String comm_id) {
		int result = getSql().delete("replyDelete", comm_id);
		return result;
		
	}

	
	
//-----------------------
	
 	
}
