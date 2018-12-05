package com.gansbat.space.entity;

import java.sql.Time;

public class space {
	private int space_id;
	private int type_id;
	private String space_address;
	private String space_img1;
	private String space_img2;
	private String space_img3;
	private int charge;
	private String space_intro;
	private Time opentime;
	private int likenum;
	
	
	
	public int getSpace_id() {
		return space_id;
	}
	public void setSpace_id(int space_id) {
		this.space_id = space_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getSpace_address() {
		return space_address;
	}
	public void setSpace_address(String space_address) {
		this.space_address = space_address;
	}
	public String getSpace_img1() {
		return space_img1;
	}
	public void setSpace_img1(String space_img1) {
		this.space_img1 = space_img1;
	}
	public String getSpace_img2() {
		return space_img2;
	}
	public void setSpace_img2(String space_img2) {
		this.space_img2 = space_img2;
	}
	public String getSpace_img3() {
		return space_img3;
	}
	public void setSpace_img3(String space_img3) {
		this.space_img3 = space_img3;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public String getSpace_intro() {
		return space_intro;
	}
	public void setSpace_intro(String space_intro) {
		this.space_intro = space_intro;
	}
	public Time getOpentime() {
		return opentime;
	}
	public void setOpentime(Time opentime) {
		this.opentime = opentime;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	
	
}
