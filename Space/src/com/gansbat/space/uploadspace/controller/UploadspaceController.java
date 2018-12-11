/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.uploadspace.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:42:19 AM 
 */
package com.gansbat.space.uploadspace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.entity.Upload;
import com.gansbat.space.uploadspace.service.UploadspaceServiceImpl;

/**
 * 
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UploadspaceController.java
* @Description: 上传页面的controller类
*
* @version: v1.0.0
* @author: dell
* @date: 2018年12月11日 下午2:39:20 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* 2018年12月11日     xurunkai           v1.0.0               修改原因
 */
@Controller
@RequestMapping("/upload")
public class UploadspaceController {
	
	@Resource
	private UploadspaceServiceImpl uploadspaceServiceImpl;
	
	@RequestMapping(value="upload",method=RequestMethod.POST)
	public String toUpload(
			@RequestParam("type_id") int type_id,
			@RequestParam("upfile") String space_img,
			@RequestParam("address") String address,
			@RequestParam("charge") int charge,
			@RequestParam("intro") String intro,
			@RequestParam("opentime") String opentime,
			Model model
			) {
		String result=null;
		Upload upload = new Upload();
		upload.setType_id(type_id);
		upload.setSpace_img1(space_img);
		upload.setSpace_address(address);
		upload.setCharge(charge);
		upload.setSpace_intro(intro);
		upload.setOpentime(opentime);
		uploadspaceServiceImpl.saveUpload(upload);
		
		model.addAttribute("result", "上传成功！");
		return "upload";
	}
}
