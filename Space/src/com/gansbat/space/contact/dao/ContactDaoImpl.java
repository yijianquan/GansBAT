/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.contact.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:48:07 AM 
 */
package com.gansbat.space.contact.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Contact;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ContactDaoImpl.java
* @Description: 处理用户上传建议提供接受建议的方法
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:48:07 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class ContactDaoImpl extends BaseDao<Contact,Integer>{

	/*
	 * 存储用上传的建议
	 */
	@Override
	public void save(Contact contact) throws Exception{
		super.save(contact);
	}
}
