/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.chatroom.service 
 * @author: Xiaoyi   
 * @date: Dec 13, 2018 10:57:49 AM 
 */
package com.gansbat.space.chatroom.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.chatroom.dao.ChatroomDaoImpl;
import com.gansbat.space.entity.Chatroom;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ChatroomServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 13, 2018 10:57:49 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 13, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class ChatroomServiceImpl implements ChatroomService {

	@Resource
	private ChatroomDaoImpl chatroomDaoImpl;
	
	@Transactional(readOnly=true)
	public List<Chatroom> selectAll(Integer space_id){
		try {
			List<Chatroom> c_list = chatroomDaoImpl.findChatroomById(space_id);
			return c_list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional(readOnly=true)
	public List<Integer> selectDistinct(Integer space_id){
		try {
			List<Integer> list = chatroomDaoImpl.findUserIdBySpaceID(space_id);
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Transactional(readOnly=false)
	public void saveMessage(Integer space_id,Integer user_id,String user_nickname,String chat_content) {
		Chatroom chatroom = new Chatroom();
		chatroom.setChat_content(chat_content);
		chatroom.setSpace_id(space_id);
		chatroom.setUser_id(user_id);
		chatroom.setUser_nickname(user_nickname);
		try {
			chatroomDaoImpl.save(chatroom);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
