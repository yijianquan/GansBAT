/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.entity 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 5:18:19 PM 
 */
package com.gansbat.space.entity;

import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: Space.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 5:18:19 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Entity
@Table(name="space")
public class Space {
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
	private float decimal;//经度
	private float latitude;//纬度
	
	public float getDecimal() {
		return decimal;
	}
	public void setDecimal(float decimal) {
		this.decimal = decimal;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
