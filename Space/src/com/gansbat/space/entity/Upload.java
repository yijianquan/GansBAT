/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.entity 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 5:20:05 PM 
 */
package com.gansbat.space.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: Upload.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 5:20:05 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Entity
@Table(name="upload")
public class Upload {

	private int id;
	private int type_id;
	private String space_img1;
	private String space_img2;
	private String space_img3;
	private String space_address;
	private int charge;
	private String space_intro;
	private String opentime;
	private int user_id;
	private BigDecimal longitude;//经度
	private BigDecimal latitude;//纬度
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
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
	public String getSpace_address() {
		return space_address;
	}
	public void setSpace_address(String space_address) {
		this.space_address = space_address;
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
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	
	
	
}
