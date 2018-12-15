/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.user.dao 
 * @author: Xiaoyi   
 * @date: Dec 10, 2018 4:19:24 PM 
 */
package com.gansbat.space.user.dao;

import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.User;
import com.sun.jmx.snmp.SnmpStringFixed;

import jdk.nashorn.internal.runtime.ECMAErrors;

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
	 * 根据传来的用户email来查询一个用户的nickname（昵称）
	 */
	public User findNicknameAccordingEmail(String email) throws Exception{	
		return super.findOne("from User where email=?", new Object[] {email});
	}
	/*
	 * 根据传来的用户Id来查寻出用户的nickname
	 */
	public User findNicknameAccordingUserId(Integer user_id) throws Exception {
		return super.findOne("from User where id=?",new Object[] {user_id});
	}
	
	/*
	 * 根据用户email来查询出用户的id
	 */
	public User findIdAccordingUserEmail(String email) throws Exception{		
		return super.findOne("from User where email = ?",new Object[] { email});
	}
	/*
	 * 根据用户id来查出该学生
	 */
	public User findUserById(Integer user_id) throws Exception{
		return super.findOne("from User where id = ?", new Object[] {user_id});
	}
}
