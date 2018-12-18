/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.login.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:08:26 AM 
 */
package com.gansbat.space.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.gansbat.space.entity.User;
import com.gansbat.space.login.service.LoginServiceImpl;
import com.gansbat.space.user.service.UserServiceImpl;


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
	@Resource
	private UserServiceImpl userServiceImpl;
	
	/*
	 * 实现登录操作
	 */
	 @RequestMapping(value="ajax",method=RequestMethod.POST)
	 @ResponseBody
	 public void add(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		 User user = new User();
		 String email = (String)request.getParameter("email");
		 String password = (String)request.getParameter("password");
		 user.setEmail(email);user.setPassword(password);
		 
		 String now_user = userServiceImpl.findNicknameAccordingEmail(email);
		 session.setAttribute("nowuser", now_user);
		 session.setAttribute("nowemail", email);
		 
		 
		//判断登录是否成功，若成功并得到用户的名字
		String username =  loginServiceImpl.compareUser(user);
		String a="";
		if(username.equals("false")||username=="false") {
			a = "Login fault!Please check your email or password!";
		}else {
			a = "Login success!";
		};
		
		//b用来封装成集合传到页面
		Object[] b = {a,username};
		response.setCharacterEncoding("UTF-8");//resp是HttpServletResponse对象
		PrintWriter out = null;
		try {
			out = response.getWriter();
			System.out.println(JSON.toJSONString(b));
			out.print(JSON.toJSONString(b));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 /*
	 * 实现注销操作
	 */
	 @RequestMapping(value="upoff",method=RequestMethod.POST)
	 @ResponseBody
	 public void logOff(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		 session.invalidate();
		 String logoff = "注销成功！";
		 Object[] b = {logoff};
		 response.setCharacterEncoding("UTF-8");//resp是HttpServletResponse对象
		PrintWriter out = null;
		try {
			out = response.getWriter();
			System.out.println(JSON.toJSONString(b));
			out.print(JSON.toJSONString(b));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}