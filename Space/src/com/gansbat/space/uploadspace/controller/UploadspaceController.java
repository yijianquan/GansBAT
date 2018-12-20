/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.uploadspace.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:42:19 AM 
 */
package com.gansbat.space.uploadspace.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload(
			@RequestParam("type_id") int type_id,
			@RequestParam("upfile") MultipartFile file,
			@RequestParam("address") String address, 
			@RequestParam("charge") int charge,
			@RequestParam("intro") String intro, 
			@RequestParam("opentime") String opentime, 
			HttpSession httpSession,
			HttpServletRequest request,
			Model model) {
		// 获取当前用户的email
		String email = (String) httpSession.getAttribute("nowemail");
		BigDecimal longitude = new BigDecimal((String) httpSession.getAttribute("longitude"));
		BigDecimal latitude = new BigDecimal((String) httpSession.getAttribute("latitude"));
		String upaddress = (String) httpSession.getAttribute("upaddress");
		String filesqlpath = null;
		
		
		if (email!=null) {
			if (upaddress!=null) {
				address = upaddress;
			}
			if(!file.isEmpty()) {
				//上传文件路径
				String path = request.getServletContext().getRealPath("/images/");
				//上传文件名
	            String filename = file.getOriginalFilename();
	            File filepath = new File(path,filename);
	            //判断路径是否存在，如果不存在就创建一个
	            if (!filepath.getParentFile().exists()) { 
	                filepath.getParentFile().mkdirs();
	            }
	            filesqlpath = path + File.separator + filename;
	            //将上传文件保存到一个目标文件当中
	            try {
					file.transferTo(new File(path + File.separator + filename));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				model.addAttribute("results", "请上传照片！");
				return "upload";
			}
			Upload upload = new Upload();
			upload.setLongitude(longitude);
			upload.setLatitude(latitude);
			upload.setType_id(type_id);
			upload.setSpace_img1(filesqlpath);
			upload.setSpace_address(address);
			upload.setCharge(charge);
			upload.setSpace_intro(intro);
			upload.setOpentime(opentime);
			uploadspaceServiceImpl.saveUpload(upload);
			model.addAttribute("results", "上传成功！");
		} else {
			model.addAttribute("results", "请登陆后上传！");
		}
		httpSession.removeAttribute("longitude");
		httpSession.removeAttribute("latitude");
		httpSession.removeAttribute("address");
		return "upload";
	}
	
	@RequestMapping(value="mapupload",method=RequestMethod.POST)
	public String MapUpload(
			@RequestParam("lnglat") String lnglat,
			@RequestParam("upaddress") String upaddress,
			HttpSession session,
			Model model
			) {
		String[] s = lnglat.split(",");
		String longitude = s[0];
		String latitude = s[1];
		session.setAttribute("longitude", longitude);
		session.setAttribute("latitude", latitude);
		session.setAttribute("upaddress", upaddress);
		return "upload";
	}
	
	
   
}
