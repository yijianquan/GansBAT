/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.contact.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:48:20 AM 
 */
package com.gansbat.space.contact.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.contact.dao.ContactDaoImpl;
import com.gansbat.space.entity.Contact;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ContactServiceImpl.java
* @Description: 上传建议调用dao
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:48:20 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class ContactServiceImpl implements ContactService {

	@Resource
	private ContactDaoImpl contactDaoImpl;
	
	@Transactional(readOnly=false)
	public void saveContact(Contact contact) {
		try {
			contactDaoImpl.save(contact);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
