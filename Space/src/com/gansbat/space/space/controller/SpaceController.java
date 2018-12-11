package com.gansbat.space.space.controller;


import java.util.ArrayList;
import java.util.List;

/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:07 AM 
 */


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.comment.service.CommentServiceImpl;
import com.gansbat.space.entity.Comment;
import com.gansbat.space.entity.Space;
import com.gansbat.space.entity.User;
import com.gansbat.space.space.service.SpaceServiceImpl;
import com.gansbat.space.spacetype.service.SpacetypeServiceImpl;
import com.gansbat.space.user.service.UserServiceImpl;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpaceController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:54:07 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/selectthisspace")
public class SpaceController {
	
	@Resource
	private SpaceServiceImpl spaceServiceImpl;
	@Resource
	private CommentServiceImpl commentServiceImpl;
	
	@RequestMapping(value="/aspace",method=RequestMethod.GET)
	public String toFindASpace(HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		System.out.println(space_id);
		
		//查询场地的基本信息
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		//将场地是否收费单独到页面
		int charge = space.getCharge();
		model.addAttribute("charge", charge);
		
		//查询场地的评论
		List<Comment> c_list = commentServiceImpl.selectAllAccordingSpaceId(space_id);
		for(Comment comment :c_list) {
			System.out.println(comment.getUser_nickname());
		}
		model.addAttribute("comment", c_list);		
		
		return "space";
	}

	
}
