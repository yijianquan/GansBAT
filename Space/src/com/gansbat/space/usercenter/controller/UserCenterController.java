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
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.basedao.Page;
import com.gansbat.space.entity.History;
import com.gansbat.space.entity.Upload;
import com.gansbat.space.entity.User;
import com.gansbat.space.history.service.HistoryServiceImpl;
import com.gansbat.space.uploadspace.service.UploadspaceServiceImpl;
import com.gansbat.space.user.service.UserServiceImpl;
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
	@Resource
	private HistoryServiceImpl historyServiceImpl;
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private UploadspaceServiceImpl uploadspaceServiceImpl;
	
	/*
	 * 跳转到个人中心页面
	 */
	@RequestMapping(value="tocenter",method=RequestMethod.GET)
	public String toUserCenter(HttpSession httpSession,Model model,
			@RequestParam(value="pageNum",defaultValue="1") int pageNum,
			@RequestParam(value="u_pageNum",defaultValue="1") int u_pageNum) {
		//获取当前用户的email
		String email = (String) httpSession.getAttribute("nowemail");
		System.out.println(email);
		//如果email不为空才进行如下操作
		if(email!=null) {
		User user = userCenterServiceImpl.selectUserAccordingEmail(email);
		System.out.println(user.getNickname());
		model.addAttribute("user", user);
		
		int user_id = userServiceImpl.findIdAccordingEmail(email);
		//获取用户的浏览记录
		Page<History> p_history = historyServiceImpl.selectHistory(pageNum, user_id);
		model.addAttribute("p_history", p_history.getList());
		model.addAttribute("page", p_history);
		
		//获取用户的上传历史记录
		Page<Upload> u_history = uploadspaceServiceImpl.selectUpload(u_pageNum, user_id);
		model.addAttribute("u_history", u_history.getList());
		model.addAttribute("u_page", u_history);
		}
		
		return "information";
	}

}
