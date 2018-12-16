/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.regist.controller 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 8:52:16 PM 
 */
package com.gansbat.space.regist.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.entity.User;
import com.gansbat.space.regist.service.RegistServieImpl;

import sun.security.action.PutAllAction;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: RegistController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 5, 2018 8:52:16 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 5, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/regist")
public class RegistController {
	
	@Resource
	private RegistServieImpl registServieImpl;	

	@RequestMapping(value="storage",method=RequestMethod.POST)
	public String toRegist(@RequestParam("email") String email,
			@RequestParam("nickname") String nickname,
			@RequestParam("password") String password,HttpSession session) {
		User user = new User();
		user.setNickname(nickname);
		user.setEmail(email);
		user.setPassword(password);
		registServieImpl.registUser(user);
		return "regist";
	}

}
