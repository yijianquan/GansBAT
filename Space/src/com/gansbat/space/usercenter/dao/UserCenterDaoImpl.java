/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.usercenter.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 10:04:41 AM 
 */
package com.gansbat.space.usercenter.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.User;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UserCenterDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 10:04:41 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class UserCenterDaoImpl extends BaseDao<User, Integer> {
	
	/*
	 * 根据用户的email来查询用户信息
	 */
	public User findUserAccordingEmail(String email) throws Exception {
		return super.findOne("from User where email = ?", new Object[] {email});
	}
	
}
