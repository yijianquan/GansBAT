/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.chatroom.controller 
 * @author: Xiaoyi   
 * @date: Dec 13, 2018 10:57:20 AM 
 */
package com.gansbat.space.chatroom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.chatroom.service.ChatroomServiceImpl;
import com.gansbat.space.entity.Chatroom;
import com.gansbat.space.entity.User;
import com.gansbat.space.user.service.UserServiceImpl;
import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ChatroomController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 13, 2018 10:57:20 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 13, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/chatroom")
public class ChatroomController {
	
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private ChatroomServiceImpl chatroomServiceImpl;
	
	/*
	 * 跳转到chatroom页面
	 */
	@RequestMapping(value = "tochatroom",method=RequestMethod.GET)
	public String toChatroom(HttpServletRequest request,HttpSession httpSession,Model model) {
		String email = (String) httpSession.getAttribute("nowemail");
		//根据场地id找到对应的聊天室
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		List<Chatroom> c_list = chatroomServiceImpl.selectAll(space_id);
		//根据聊天室对应的Id，并去除重复的，找到user_id来查找到每个用户的基本信息
		List<Integer> list = new ArrayList<>();
		list = chatroomServiceImpl.selectDistinct(space_id);
		List<User> u_List = new ArrayList<User>();
		for(int user_id:list) {
			u_List.add(userServiceImpl.findUserById(user_id));
		}
		model.addAttribute("c_list", c_list);
		model.addAttribute("u_list", u_List);
		
		return "chatroom";
	}

}
