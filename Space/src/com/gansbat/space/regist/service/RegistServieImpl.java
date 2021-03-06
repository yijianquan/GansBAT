/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.regist.service 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 8:53:15 PM 
 */
package com.gansbat.space.regist.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.User;
import com.gansbat.space.regist.dao.RegistDaoImpl;
import com.gansbat.space.user.dao.UserDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: RegistServieImpl.java
* @Description: 注册调用服务层
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 8:53:15 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/

@Service
@Transactional(readOnly=false)
public class RegistServieImpl implements RegistService {
	
	@Resource
	private RegistDaoImpl registDaoImpl;
	@Resource
	private UserDaoImpl userDaoImpl;
	
	@Transactional(readOnly=false)
	public Integer registUser(User user) {
		User users = null;
		try {
			users = userDaoImpl.findIdAccordingUserEmail(user.getEmail());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(users==null) {
			try {
				registDaoImpl.save(user);
				return 1;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
		}else {
			return 2;
		}
	}
}
