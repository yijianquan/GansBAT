/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.contact.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:47:32 AM 
 */
package com.gansbat.space.contact.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.contact.service.ContactServiceImpl;
import com.gansbat.space.entity.Contact;
import com.sun.org.apache.bcel.internal.generic.ReturnInstruction;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ContactController.java
* @Description: 提交建议
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:47:32 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Controller
@RequestMapping(value="/contact")
public class ContactController {

	@Resource
	private ContactServiceImpl contactServiceImpl;
	
	@RequestMapping(value="tocontact")
	public String toContact() {		
		return "contact";
	}
	// 这是反馈请求
	@RequestMapping(value="storage",method=RequestMethod.POST)
	public String toSaveContact(@RequestParam("contact_name") String name,
			@RequestParam("contact_infro") String contact_infro,
			@RequestParam("contact_title") String contact_title,
			@RequestParam("contact_con") String contact_con,HttpSession session,Model model) {
		Contact contact = new Contact();
		contact.setName(name);
		contact.setContact_infro(contact_infro);
		contact.setTitle(contact_title);
		contact.setContact_con(contact_con);
		try {
			contactServiceImpl.saveContact(contact);
			System.out.println("上传建议成功！");
			model.addAttribute("contact_ok","1");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("上传建议失败！");
			model.addAttribute("contact_ok","2");
		}
		return "contact";
	}
}
