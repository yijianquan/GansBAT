/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.home.controller 
 * @author: Xiaoyi   
 * @date: Dec 12, 2018 5:46:49 PM 
 */
package com.gansbat.space.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
