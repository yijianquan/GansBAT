/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:07 AM 
 */
package com.gansbat.space.space.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.entity.Type;
import com.gansbat.space.login.service.LoginServiceImpl;
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
@RequestMapping(value="/spacetype")
public class SpaceController {

	@Resource
	private SpaceServiceImpl spaceServiceImpl;
	
	@RequestMapping(value="select",method=RequestMethod.GET)
	public String toSelectType(Model model) {
		List<Type> t_list = new ArrayList<>();
		t_list = spaceServiceImpl.selectAllType();
		model.addAttribute("spacetype", t_list);
		return "more";
	}
}
