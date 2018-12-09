/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.spacetype.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:48:49 AM 
 */
package com.gansbat.space.spacetype.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.entity.Type;
import com.gansbat.space.spacetype.service.SpacetypeServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpacetypeController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:48:49 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/spacetype")
public class SpacetypeController {
	@Resource
	private SpacetypeServiceImpl spacetypeServiceImpl;
	
	@RequestMapping(value="select",method=RequestMethod.GET)
	public String toSelectType(Model model) {
		List<Type> t_list = new ArrayList<>();
		t_list = spacetypeServiceImpl.selectAllType();
		model.addAttribute("spacetype", t_list);
		return "more";
	}
}
