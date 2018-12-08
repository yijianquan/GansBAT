/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.login.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:08:26 AM 
 */
package com.gansbat.space.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.entity.User;
import com.gansbat.space.login.service.LoginServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: LoginContreoller.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:08:26 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource
	private LoginServiceImpl loginServiceImpl;
	
	@RequestMapping(value="loginin",method=RequestMethod.POST)
	public String toLogin(@RequestParam("login_Email") String email,
			@RequestParam("login_password") String password,
			HttpSession session,Model model) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		String a =  loginServiceImpl.compareUser(user);
		model.addAttribute("state",a);
		return "home";
	}

}