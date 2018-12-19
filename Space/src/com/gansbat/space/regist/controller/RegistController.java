/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.regist.controller 
 * @author: Xiaoyi   
 * @date: Dec 5, 2018 8:52:16 PM 
 */
package com.gansbat.space.regist.controller;

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

import com.gansbat.space.entity.User;
import com.alibaba.fastjson.JSON;
import com.gansbat.space.basedao.SendEmail;
import com.gansbat.space.regist.service.RegistServieImpl;

import sun.security.action.PutAllAction;
import sun.security.ec.ECDHKeyAgreement;

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
			@RequestParam("password") String password,HttpSession session,Model model) {
		User user = new User();
		user.setNickname(nickname);
		user.setEmail(email);
		user.setPassword(password);
		Integer registnum = registServieImpl.registUser(user);
		String registok = "注册失败！";
		if(registnum == 1) {
			registok = "注册成功！";
		}else if(registnum == 2){
			registok = "注册失败，当前邮箱已被注册！";
		}
		model.addAttribute("registok", registok);		
		return "regist";
	}

	/*
	 * 通过ajax，实现发送验证码
	 */
	@RequestMapping(value="sendcode",method=RequestMethod.POST)
	@ResponseBody
	public void senCode(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		System.out.println("准备发送邮箱！");
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
		//封装发送到页面
		Object[] b = {randomnum};
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
