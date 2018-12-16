/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.usercenter.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 10:04:55 AM 
 */
package com.gansbat.space.usercenter.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.User;
import com.gansbat.space.usercenter.dao.UserCenterDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UserCenterServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 10:04:55 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class UserCenterServiceImpl {

	@Resource
	private UserCenterDaoImpl userCenterDaoImpl;
	
	@Transactional(readOnly=true)
	public User selectUserAccordingEmail(String email) {
		User user = new User();
		try {
			user = userCenterDaoImpl.findUserAccordingEmail(email);
			return user;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	 * 用户编辑资料
	 */
	@Transactional(readOnly=false)
	public Integer updataUserInfo(String email,Integer sex,String nickname,String hobby,String address,Integer age) {
		User user = selectUserAccordingEmail(email);
		user.setNickname(nickname);
		user.setSex(sex);
		user.setAddress(address);
		user.setHobby(hobby);
		user.setAge(age);
		try {
			userCenterDaoImpl.update(user);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
}
