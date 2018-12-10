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
			System.out.println(nickname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nickname;
	}
}
