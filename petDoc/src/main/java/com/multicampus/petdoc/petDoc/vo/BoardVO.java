package com.multicampus.petdoc.petDoc.vo;

public class BoardVO {
	private int board_num;
	private String title;
	private String content;
	private int hit;
	private String user_id;
	private int likes;
	private String wrtiedate;
	private String filename1;
	private String baordtype;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getWrtiedate() {
		return wrtiedate;
	}
	public void setWrtiedate(String wrtiedate) {
		this.wrtiedate = wrtiedate;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getBaordtype() {
		return baordtype;
	}
	public void setBaordtype(String baordtype) {
		this.baordtype = baordtype;
	}
}
