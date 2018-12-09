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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		//判断登录是否成功，若成功并得到用户的名字
		String username =  loginServiceImpl.compareUser(user);
		String a="";
		if(username.equals("false")) {
			a = "false";
		}else {
			a = "true";
		}
		System.out.println(a);
		model.addAttribute("state",a);
		model.addAttribute("username",username);
		return "home";
	}
	
	 @RequestMapping(value="/ajax",method=RequestMethod.POST)
	 @ResponseBody
	 public void add(HttpServletResponse response,HttpServletRequest request){
		 System.out.println("跳到了controller");
		 
		 User user = new User();
		 user.setEmail((String)request.getAttribute("email"));
		 user.setPassword((String)request.getAttribute("password"));
		 System.out.println(user.getPassword()+" "+user.getEmail());
	     System.out.println("好");
	}
}