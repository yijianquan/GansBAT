/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.comment.service 
 * @author: Xiaoyi   
 * @date: Dec 11, 2018 2:40:08 PM 
 */
package com.gansbat.space.comment.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.comment.dao.CommentDaoImpl;
import com.gansbat.space.entity.Comment;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: CommentServiceImpl.java
* @Description: 实现查找comment所需要的方法并直接返回需要的结果
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 11, 2018 2:40:08 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 11, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class CommentServiceImpl {

	@Resource
	private CommentDaoImpl commentDaoImpl;
	
	@Transactional(readOnly=true)
	public List<Comment> selectAllAccordingSpaceId(Integer space_id){
		List<Comment> c_list = new ArrayList<Comment>();
		try {
			c_list = commentDaoImpl.findAllAccordingSpaceId(space_id);
			System.out.println("查询到场地"+space_id+"的所有评论");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c_list;
	}
	
	/*
	 * 存储评论
	 */
	@Transactional(readOnly=false)
	public void saveComment(Integer space_id,Integer user_id,String user_nickname,String space_comment){
		Comment comment = new Comment(space_id, user_id, user_nickname, space_comment);
		try {
			commentDaoImpl.save(comment);
			System.out.println("存储评论成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
	}
}
