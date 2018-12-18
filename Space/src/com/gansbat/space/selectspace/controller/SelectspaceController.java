/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.selectspace.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:51:26 AM 
 */
package com.gansbat.space.selectspace.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.basedao.Page;
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
	
	@RequestMapping(value="alltypespace",method=RequestMethod.GET)
	public String toTypeSpace(@RequestParam(value="pageNum",defaultValue="1") int pageNum,HttpServletRequest request,Model model) {
		Integer t_id = Integer.parseInt(request.getParameter("spacetype"));
		
		Page<Space> p_space = selectspaceServiceImpl.selectSpaceByTypeId(pageNum, t_id);
		
		model.addAttribute("type_id", t_id);
		model.addAttribute("p_space", p_space.getList());
		model.addAttribute("s_page", p_space);
		return "detail";
	}
}
