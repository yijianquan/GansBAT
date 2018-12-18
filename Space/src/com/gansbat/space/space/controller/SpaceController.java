package com.gansbat.space.space.controller;

import java.math.BigDecimal;
import java.util.List;

/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.controller 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:07 AM 
 */

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gansbat.space.chatroom.service.ChatroomService;
import com.gansbat.space.chatroom.service.ChatroomServiceImpl;
import com.gansbat.space.comment.service.CommentServiceImpl;
import com.gansbat.space.entity.Chatroom;
import com.gansbat.space.entity.Comment;
import com.gansbat.space.entity.Space;
import com.gansbat.space.entity.User;
import com.gansbat.space.history.service.HistoryServiceImpl;
import com.gansbat.space.space.service.SpaceServiceImpl;
import com.gansbat.space.user.service.UserServiceImpl;

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
@RequestMapping(value="/selectthisspace")
public class SpaceController {
	
	@Resource
	private SpaceServiceImpl spaceServiceImpl;
	@Resource
	private CommentServiceImpl commentServiceImpl;
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private HistoryServiceImpl historyServiceImpl;
	@Resource
	private ChatroomServiceImpl chatroomServiceImpl;
	
	//跳转到场地
	@RequestMapping(value="/aspace",method=RequestMethod.GET)
	public String toFindASpace(HttpSession httpSession,HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		
		//查询场地的基本信息
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		//将场地是否收费单独到页面
		int charge = space.getCharge();
		model.addAttribute("charge", charge);
		
		//查询场地的评论
		List<Comment> c_list = commentServiceImpl.selectAllAccordingSpaceId(space_id);
		model.addAttribute("comment", c_list);		
		

		/*
		 * 如果当前用户已登录，则帮用户记录他的历史记录
		 */
			//获取当前用户的email
			String email = (String) httpSession.getAttribute("nowemail");
			if("".equals(email)||email=="") {
				//根据email查询出用户的id
				Integer u_id = userServiceImpl.findIdAccordingEmail(email);
				//将用户id，场地图片，名称放入history
				historyServiceImpl.insertHistory(u_id,space_id,space.getSpace_address(), space.getSpace_img1());
			}
		
		return "space";
	}
	
	//用户发表评论
	@RequestMapping(value="/tocomment",method=RequestMethod.POST)
	public String toComment(@RequestParam("space_comment") String space_comment,HttpSession httpSession,HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		
		//查询场地的基本信息
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		//将场地是否收费单独到页面
		int charge = space.getCharge();
		model.addAttribute("charge", charge);
		

		/*
		 * 如果当前用户已登录，则帮用户记录他的历史记录
		 */
			//获取当前用户的email
			String email = (String) httpSession.getAttribute("nowemail");
			//根据email查询出用户的id,email
			Integer u_id = userServiceImpl.findIdAccordingEmail(email);
			String user_nickname = userServiceImpl.findNicknameAccordingEmail(email);
			if(email!=null) {
				//将用户id，场地图片，名称放入history
				historyServiceImpl.insertHistory(u_id,space_id,space.getSpace_address(), space.getSpace_img1());
			}

		//存储用户的评论信息
		commentServiceImpl.saveComment(space_id, u_id, user_nickname, space_comment);
		
		//查询场地的评论
		List<Comment> c_list = commentServiceImpl.selectAllAccordingSpaceId(space_id);
		model.addAttribute("comment", c_list);		
		
		return "space";
	}
	
	//用户点赞场地
	@RequestMapping(value="/likespace",method=RequestMethod.GET)
	public String toLikeSpace(HttpSession httpSession,HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		
		//查询场地的基本信息
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		
		//用户点赞
		Integer like = Integer.parseInt(request.getParameter("like"));
		Integer likenum = 0;
		if(like==1) {
			space.setLikenum(space.getLikenum()+1);
			likenum = space.getLikenum();
			spaceServiceImpl.likeSpace(space_id, likenum);
		}else {
			space.setLikenum(space.getLikenum()-1);
			likenum = space.getLikenum();
			spaceServiceImpl.likeSpace(space_id, likenum);
		}
		
		//将场地是否收费单独到页面
		int charge = space.getCharge();
		model.addAttribute("charge", charge);
		
		//查询场地的评论
		List<Comment> c_list = commentServiceImpl.selectAllAccordingSpaceId(space_id);
		model.addAttribute("comment", c_list);		
		
		return "space";
	}	
	
	//查看地图
	@RequestMapping(value="/map",method=RequestMethod.GET)
	public String toMap(HttpServletRequest request,Model model) {
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		BigDecimal longitude = space.getLongitude();
		BigDecimal latitude = space.getLatitude();
		model.addAttribute("longitude",longitude);
		model.addAttribute("latitude",latitude);
		return "map";
	}
	

	
	/*
	 * 用户退出聊天室，并删除在该聊天室的记录
	 */
	@RequestMapping(value="returnspace",method=RequestMethod.GET)
	public String userDeleteChatroom(HttpServletRequest request,HttpSession httpSession,Model model) {
		String email = (String) httpSession.getAttribute("nowemail");
		//根据场地id找到对应的聊天室
		Integer space_id = Integer.parseInt(request.getParameter("space_id"));
		if(email!=null) {
		User user = userServiceImpl.findUserByEmail(email);
		//删除聊天室记录
		chatroomServiceImpl.deleteChatroomByUserIdSpaceID(user.getId(), space_id);
		}
		
		//跳转回场地
		//查询场地的基本信息
		Space space = spaceServiceImpl.selectSpaceAccordingSpaceId(space_id);
		model.addAttribute("space", space);
		//将场地是否收费单独到页面
		int charge = space.getCharge();
		model.addAttribute("charge", charge);
		//查询场地的评论
		List<Comment> c_list = commentServiceImpl.selectAllAccordingSpaceId(space_id);
		model.addAttribute("comment", c_list);		
		/*
		 * 如果当前用户已登录，则帮用户记录他的历史记录
		 */
			if(email!=null) {
			//根据email查询出用户的id
			Integer u_id = userServiceImpl.findIdAccordingEmail(email);
			//将用户id，场地图片，名称放入history
				historyServiceImpl.insertHistory(u_id,space_id,space.getSpace_address(), space.getSpace_img1());
			}
		
		return "space";
	}
	
}
