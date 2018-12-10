/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.user.dao 
 * @author: Xiaoyi   
 * @date: Dec 10, 2018 4:19:24 PM 
 */
package com.gansbat.space.user.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.User;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UserDaoImpl.java
* @Description: 部分查询用户功能时，为其提供方法
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 10, 2018 4:19:24 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 10, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class UserDaoImpl extends BaseDao<User, Integer> {

	/*
	 * 根据传来的用户email来查询用户的nickname（昵称）
	 */
	public User findNicknameAccordingEmail(String email) throws Exception{	
		return super.findOne("from User where email=?", new Object[] {email});
	}
}
