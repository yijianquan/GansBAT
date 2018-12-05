/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.regist.dao 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 8:45:55 PM 
 */
package com.gansbat.space.regist.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.User;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: RegistDao.java
* @Description: 实现注册提供方法
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 8:45:55 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class RegistDaoImpl extends BaseDao<User, Integer> {
	
	/*
	 * 注册时实现存储数据
	 */
	@Override
	public void save(User user) throws Exception{
		super.save(user);
	}
	
	
}