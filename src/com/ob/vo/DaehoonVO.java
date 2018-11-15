package com.ob.vo;

public class DaehoonVO {
	String r_num, id, board_type, title, content,nickname,email,tel, write_date, read_count;

	public DaehoonVO() {
		super();
	}

	public DaehoonVO(String r_num, String id, String board_type, String title, String content, String nickname,
			String email, String tel, String write_date, String read_count) {
		super();
		this.r_num = r_num;
		this.id = id;
		this.board_type = board_type;
		this.title = title;
		this.content = content;
		this.nickname = nickname;
		this.email = email;
		this.tel = tel;
		this.write_date = write_date;
		this.read_count = read_count;
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getRead_count() {
		return read_count;
	}

	public void setRead_count(String read_count) {
		this.read_count = read_count;
	}

	@Override
	public String toString() {
		return "DaehoonVO [r_num=" + r_num + ", id=" + id + ", board_type=" + board_type + ", title=" + title
				+ ", content=" + content + ", nickname=" + nickname + ", email=" + email + ", tel=" + tel
				+ ", write_date=" + write_date + ", read_count=" + read_count + "]";
	}
	
	
	

}