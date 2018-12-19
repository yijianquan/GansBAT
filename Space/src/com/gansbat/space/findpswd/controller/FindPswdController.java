/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.findpswd.controller 
 * @author: Xiaoyi   
 * @date: Dec 19, 2018 9:56:01 AM 
 */
package com.gansbat.space.findpswd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.gansbat.space.basedao.SendEmail;
import com.gansbat.space.user.service.UserServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: FindPswdController.java
* @Description: 实现跳转到找回密码页面以及发送邮箱验证码
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 19, 2018 9:56:01 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 19, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/findpswd")
public class FindPswdController {

	@Resource
	private UserServiceImpl userServiceImpl;
	
	/*
	 * 跳转到找回密码页面
	 */
	@RequestMapping(value="tofindpswd",method=RequestMethod.GET)
	public String toFindPassword() {
		return "findpassword";
	}
	
	/*
	 * 帮助用户找回密码，发送邮件验证码
	 */
	@RequestMapping(value="sendcode",method=RequestMethod.POST)
	@ResponseBody
	public void senCode(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		String email = (String)request.getParameter("email");
		System.out.println(email);
		SendEmail sendEmail = new SendEmail();
		sendEmail.setAcceptEmailAddress(email);
		Integer randomnum = (int) (Math.random()*9999);
		while(true) {
			if(randomnum>999&&randomnum<10000) {
				System.out.println(randomnum);
				break;
			}else {
				randomnum = (int) (Math.random()*9999);
			}
		}
		SendEmail.setSendContent(SendEmail.getSendContent()+String.valueOf(randomnum));
		sendEmail.sendVerifyEmail();
		
		String password = userServiceImpl.findPasswordByEmail(email);
		
		//封装发送到页面
		Object[] b = {randomnum,password};
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
