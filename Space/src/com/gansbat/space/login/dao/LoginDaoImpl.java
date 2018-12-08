/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.login.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:11:08 AM 
 */
package com.gansbat.space.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.User;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: LoginController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:11:08 AM
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class LoginDaoImpl extends BaseDao<User, Integer> {

	/*
	 * 查询出数据库中的所有用户
	 */
	@Override
	public List<User> findAll() throws Exception{
		return super.findAll();
	}
	
}
