/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.trends.comtroller 
 * @author: Xiaoyi   
 * @date: Dec 12, 2018 4:46:31 PM 
 */
package com.gansbat.space.trends.comtroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gansbat.space.entity.User;
import com.gansbat.space.user.service.UserServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: TrendsController.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 12, 2018 4:46:31 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 12, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/trends")
public class TrendsController {
	
	@Resource
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping(value="totrends",method=RequestMethod.GET)
	public String toTrends(HttpSession httpSession,Model model) {
		//获取当前用户的email
		String email = (String) httpSession.getAttribute("nowemail");		
		
		//如果用户已登录，则可继续查询其他信息，否则直接跳转
		if(email!=null) {
			System.out.println(email);
			String nickname = userServiceImpl.findNicknameAccordingEmail(email);
			model.addAttribute("nickname", nickname);
			model.addAttribute("email", email);
			//查询用户加入过的聊天室和上传过的场地操作
		}

		return "trends";
	}

}
