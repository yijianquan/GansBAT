/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.entity 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 5:19:27 PM 
 */
package com.gansbat.space.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: Contact.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 5:19:27 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Entity
@Table(name="contact")
public class Contact {
	private int id;
	private String name;
	private String contact_info;
	private String title;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact_info() {
		return contact_info;
	}
	public void setContact_info(String contact_info) {
		this.contact_info = contact_info;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContact_con() {
		return contact_con;
	}
	public void setContact_con(String contact_con) {
		this.contact_con = contact_con;
	}
	private String contact_con;
	
}
