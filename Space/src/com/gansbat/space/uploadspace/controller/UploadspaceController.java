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
	
	@RequestMapping(value="toupload")
	public String jumpUpload(){
		return "upload";
	}
	
	@RequestMapping(value="upload",method=RequestMethod.POST)
	public String Upload(
			@RequestParam(value="type_id",required=false) int type_id,
			@RequestParam("upfile") String space_img,
			@RequestParam("address") String address,
			@RequestParam("charge") int charge,
			@RequestParam("intro") String intro,
			@RequestParam("opentime") String opentime,
			HttpSession httpSession,
			Model model
			) {
		//获取当前用户的email
		String email = (String) httpSession.getAttribute("nowemail");
		BigDecimal longitude = new BigDecimal((String)httpSession.getAttribute("longitude"));
		BigDecimal latitude = new BigDecimal((String)httpSession.getAttribute("latitude"));
		String upaddress = (String) httpSession.getAttribute("address");
		if(!"".equals(upaddress)) {
			address = upaddress;
		}
		if(!"".equals(email)) {
			Upload upload = new Upload();
			upload.setLongitude(longitude);
			upload.setLatitude(latitude);
			upload.setType_id(type_id);
			upload.setSpace_img1(space_img);
			upload.setSpace_address(address);
			upload.setCharge(charge);
			upload.setSpace_intro(intro);
			upload.setOpentime(opentime);
			uploadspaceServiceImpl.saveUpload(upload);
			model.addAttribute("results", "上传成功！");
		}else {
			model.addAttribute("results","请登陆后上传！");
		}
		httpSession.removeAttribute("longitude");
		httpSession.removeAttribute("latitude");
		httpSession.removeAttribute("address");
		return "upload";
	}
	
	@RequestMapping(value="mapupload",method=RequestMethod.POST)
	public String MapUpload(
			@RequestParam("lnglat") String lnglat,
			@RequestParam(value="address",required=false) String address,
			HttpSession session,
			Model model
			) {
		String[] s = lnglat.split(",");
		String longitude = s[0];
		String latitude = s[1];
		session.setAttribute("longitude", longitude);
		session.setAttribute("latitude", latitude);
		session.setAttribute("address", address);
		return "upload";
	}
}
