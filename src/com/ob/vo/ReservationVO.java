package com.ob.vo;

public class ReservationVO {
	String id, user_id, room_id, s_date, e_date, r_date, pax, review_id
		  ,account, nickname
		  ,room_name, room_type_id, room_type, filename
		  ,room_num, room_content, room_address1, room_address2, room_theme
		  ,max_pax, cost, total_cost;
	int day_chk;
	
	public ReservationVO() {
		super();
	}
	
	
	public ReservationVO(String id, String user_id, String room_id, String s_date, String e_date, String r_date,
			String pax, String review_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.room_id = room_id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
		this.pax = pax;
		this.review_id = review_id;
	}


	public ReservationVO(String id, String user_id, String room_id, String s_date, String e_date, String r_date,
			String pax, String review_id, String total_cost) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.room_id = room_id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
		this.pax = pax;
		this.review_id = review_id;
		this.total_cost = total_cost;
	}

	public ReservationVO(String id, String user_id, String room_id, String s_date, String e_date, String r_date,
			String pax, String review_id, String account, String nickname, String room_name, String room_type_id,
			String room_type, String room_num, String room_content, String room_address1, String room_address2,
			String room_theme, String max_pax, String cost) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.room_id = room_id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
		this.pax = pax;
		this.review_id = review_id;
		this.account = account;
		this.nickname = nickname;
		this.room_name = room_name;
		this.room_type_id = room_type_id;
		this.room_type = room_type;
		this.room_num = room_num;
		this.room_content = room_content;
		this.room_address1 = room_address1;
		this.room_address2 = room_address2;
		this.room_theme = room_theme;
		this.max_pax = max_pax;
		this.cost = cost;
	}

	public ReservationVO(String id, String user_id, String room_id, String s_date, String e_date, String r_date,
			String pax, String review_id, String account, String nickname, String room_name, String room_type_id,
			String room_type, String filename, String room_num, String room_content, String room_address1, String room_address2,
			String room_theme, String max_pax, String cost) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.room_id = room_id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
		this.pax = pax;
		this.review_id = review_id;
		this.account = account;
		this.nickname = nickname;
		this.room_name = room_name;
		this.room_type_id = room_type_id;
		this.room_type = room_type;
		this.filename = filename;
		this.room_num = room_num;
		this.room_content = room_content;
		this.room_address1 = room_address1;
		this.room_address2 = room_address2;
		this.room_theme = room_theme;
		this.max_pax = max_pax;
		this.cost = cost;
	}
	
	
	public int getDay_chk() {
		return day_chk;
	}


	public void setDay_chk(int day_chk) {
		this.day_chk = day_chk;
	}


	public String getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getPax() {
		return pax;
	}

	public void setPax(String pax) {
		this.pax = pax;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_type_id() {
		return room_type_id;
	}

	public void setRoom_type_id(String room_type_id) {
		this.room_type_id = room_type_id;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getRoom_num() {
		return room_num;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}

	public String getRoom_content() {
		return room_content;
	}

	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}

	public String getRoom_address1() {
		return room_address1;
	}

	public void setRoom_address1(String room_address1) {
		this.room_address1 = room_address1;
	}

	public String getRoom_address2() {
		return room_address2;
	}

	public void setRoom_address2(String room_address2) {
		this.room_address2 = room_address2;
	}

	public String getRoom_theme() {
		return room_theme;
	}

	public void setRoom_theme(String room_theme) {
		this.room_theme = room_theme;
	}

	public String getMax_pax() {
		return max_pax;
	}

	public void setMax_pax(String max_pax) {
		this.max_pax = max_pax;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}


	@Override
	public String toString() {
		return "ReservationVO [id=" + id + ", user_id=" + user_id + ", room_id=" + room_id + ", s_date=" + s_date
				+ ", e_date=" + e_date + ", r_date=" + r_date + ", pax=" + pax + ", review_id=" + review_id
				+ ", account=" + account + ", nickname=" + nickname + ", room_name=" + room_name + ", room_type_id="
				+ room_type_id + ", room_type=" + room_type + ", filename=" + filename + ", room_num=" + room_num
				+ ", room_content=" + room_content + ", room_address1=" + room_address1 + ", room_address2="
				+ room_address2 + ", room_theme=" + room_theme + ", max_pax=" + max_pax + ", cost=" + cost
				+ ", total_cost=" + total_cost + ", day_chk=" + day_chk + "]";
	}

	
}
