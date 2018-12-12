/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.usercenter.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 10:04:29 AM 
 */
package com.gansbat.space.usercenter.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.entity.User;
import com.gansbat.space.usercenter.service.UserCenterServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UserCenterController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 10:04:29 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/usercenter")
public class UserCenterController {
	
	@Resource
	private UserCenterServiceImpl userCenterServiceImpl;
	
	/*
	 * 跳转到个人中心页面
	 */
	@RequestMapping(value="tocenter",method=RequestMethod.GET)
	public String toUserCenter(HttpSession httpSession,Model model) {
		String email = (String) httpSession.getAttribute("nowemail");
		System.out.println(email);
		User user = userCenterServiceImpl.selectUserAccordingEmail(email);
		System.out.println(user.getNickname());
		model.addAttribute("user", user);
		
		return "information";
	}

}
