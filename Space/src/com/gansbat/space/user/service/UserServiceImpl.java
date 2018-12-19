/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.user.service 
 * @author: Xiaoyi   
 * @date: Dec 10, 2018 4:19:38 PM 
 */
package com.gansbat.space.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.User;
import com.gansbat.space.user.dao.UserDaoImpl;
import com.sun.jmx.snmp.SnmpStringFixed;
import com.sun.org.apache.regexp.internal.recompile;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UserServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 10, 2018 4:19:38 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 10, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class UserServiceImpl implements UserService {

	@Resource
	private UserDaoImpl userDaoImpl;
	
	/*
	 * 根据email调用UserDaoImpl的方法取出nickname
	 */
	@Transactional(readOnly=true)
	public String findNicknameAccordingEmail(String email) {
		String nickname = null;
		User user;
		try {
			user = userDaoImpl.findNicknameAccordingEmail(email);
			nickname = user.getNickname();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nickname;
	}
	
	/*
	 * 调用UserDaoImpl里的方法取出nickname并返回
	 */
	@Transactional(readOnly=true)
	public String findNicknameAccordingUserId(Integer user_id) {
		try {
			User user = userDaoImpl.findNicknameAccordingUserId(user_id);
			String user_nickname = user.getNickname();
			return user_nickname;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	 * 调用UserDaoImpl里的方法取出用户Id并返回
	 */
	@Transactional(readOnly=true)
	public Integer findIdAccordingEmail(String email) {
		try {
			User user = userDaoImpl.findIdAccordingUserEmail(email);
			return user.getId();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*
	 * 根据id查询到该位用户
	 */
	@Transactional
	public User findUserById(Integer user_id) {
		try {
			User user = userDaoImpl.findUserById(user_id);
			return user;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*
	 * 根据email查询到用户
	 */
	@Transactional(readOnly=true)
	public User findUserByEmail(String email) {
		try {
			User user = userDaoImpl.findIdAccordingUserEmail(email);
			return user;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*
	 * 根据email查出password
	 */
	@Transactional(readOnly=true)
	public String findPasswordByEmail(String email) {
		try {
			User user = userDaoImpl.findIdAccordingUserEmail(email);
			return user.getPassword();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
