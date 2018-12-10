package com.gansbat.space.space.controller;


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

import com.gansbat.space.entity.Space;
import com.gansbat.space.space.service.SpaceServiceImpl;

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
	
	@RequestMapping(value="/aspace",method=RequestMethod.GET)
	public String toFindASpace(HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		System.out.println(space_id);
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		return "space";
	}

	
}
