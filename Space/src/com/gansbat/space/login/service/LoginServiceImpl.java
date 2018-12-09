/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.login.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:11:31 AM 
 */
package com.gansbat.space.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.User;
import com.gansbat.space.login.dao.LoginDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: LoginServiceImpl.java
* @Description: 调用登录所需服务
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:11:31 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private LoginDaoImpl loginDaoImpl;
	
	/*
	 * 将前台传来的登录数据与后台的用户进行对比,如果存在返回用户的昵称
	 */
	@Transactional(readOnly=true)
	public String compareUser(User user) {
		String username = "";
		try {
			List<User> u_list = loginDaoImpl.findAll();
			for(User u:u_list) {
				if((user.getEmail().equals(u.getEmail())||user.getEmail()==u.getEmail())&&(user.getPassword().equals(u.getPassword())||user.getPassword()==u.getPassword())) {
					System.out.println("邮箱和用户密码正确！");
					username = u.getNickname();
					break;
				}else {
					username = "false";
					System.out.println("邮箱和用户密码不不不不不正确！");					
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			username = "false";
			e.printStackTrace();
		}
		return username;
	}
}
