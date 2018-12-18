/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.chatroom.dao 
 * @author: Xiaoyi   
 * @date: Dec 13, 2018 10:57:35 AM 
 */
package com.gansbat.space.chatroom.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Chatroom;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: ChatroomDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 13, 2018 10:57:35 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 13, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class ChatroomDaoImpl extends BaseDao<Chatroom, Integer>{
	
	/*
	 * 根据场地ID来查到对应的聊天室
	 */
	public List<Chatroom> findChatroomById(Integer space_id) throws Exception{
		return super.find("from Chatroom where space_id = ? order by id desc",new Object[] {space_id});
	}
	/*
	 * 根据场地Id来查到里面的人物并不重复出现去除ID
	 */
	public List<Integer> findUserIdBySpaceID(Integer space_id) throws Exception{
		return super.findDistinct("select distinct user_id from Chatroom where space_id = ?", new Object[] {space_id});
	}
	/*
	 * 插入聊天内容
	 */
	public void save(Chatroom chatroom) throws Exception {
		super.save(chatroom);
	}
	/*
	 * 用户查询他在聊天室的所有记录
	 */
	public List<Chatroom> findByUserIdSpaceId(Integer user_id,Integer space_id) throws Exception{
		return super.find("from Chatroom where space_id = ? and user_id = ?", new Object[] {space_id,user_id});
	}
	/*
	 * 用户删除并且退出聊天室，
	 */
	public void delete(Chatroom chatroom) throws Exception{
		super.delete(chatroom);
	}
}
