/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.home.controller 
 * @author: Xiaoyi   
 * @date: Dec 12, 2018 5:46:49 PM 
 */
package com.gansbat.space.home.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.VoiceStatus;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: HomeController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 12, 2018 5:46:49 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 12, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/home")
public class HomeController {

	@RequestMapping(value="tohome")
	public String toHome() {
		return "home";
	}
	
	/*
	 * 通过ajax，获取经纬度，保存在session里
	 */
	@RequestMapping(value="latilongitude",method=RequestMethod.POST)
	@ResponseBody
	public void saveLatilongitude(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		session.setAttribute("longitude", longitude);
		session.setAttribute("latitude", latitude);
		System.out.println("获取经纬度");
		int a = 1;
		Object[] b = {a};
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
