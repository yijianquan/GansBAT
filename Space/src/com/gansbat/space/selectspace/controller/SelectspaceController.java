/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.selectspace.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:51:26 AM 
 */
package com.gansbat.space.selectspace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.entity.Space;
import com.gansbat.space.selectspace.service.SelectspaceServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SelectspaceController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:51:26 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/selectspace")
public class SelectspaceController {

	@Resource
	private SelectspaceServiceImpl selectspaceServiceImpl;
	
	@RequestMapping(value="/alltypespace",method=RequestMethod.GET)
	public String toTypeSpace(HttpServletRequest request,Model model) {
		Integer t_id = Integer.parseInt(request.getParameter("spacetype"));
		List<Space> s_list = selectspaceServiceImpl.selectAllSpace(t_id);
		System.out.println("查询成功！");
		for(Space s:s_list) {
			System.out.println(s.getSpace_id());
		}
		model.addAttribute("typeallspace", s_list);
		return "detail";
	}
}
