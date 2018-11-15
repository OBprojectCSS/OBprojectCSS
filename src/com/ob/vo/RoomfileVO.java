package com.ob.vo;

public class RoomfileVO {
	String room_id, room_file_id, room_type_id, filename;

	public RoomfileVO() {
		super();
	}

	public RoomfileVO(String room_id, String room_file_id, String room_type_id, String filename) {
		super();
		this.room_id = room_id;
		this.room_file_id = room_file_id;
		this.room_type_id = room_type_id;
		this.filename = filename;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_file_id() {
		return room_file_id;
	}

	public void setRoom_file_id(String room_file_id) {
		this.room_file_id = room_file_id;
	}

	public String getRoom_type_id() {
		return room_type_id;
	}

	public void setRoom_type_id(String room_type_id) {
		this.room_type_id = room_type_id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "RoomfileVO [room_id=" + room_id + ", room_file_id=" + room_file_id + ", room_type_id=" + room_type_id
				+ ", filename=" + filename + "]";
	}
	
}
