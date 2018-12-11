/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.comment.dao 
 * @author: Xiaoyi   
 * @date: Dec 11, 2018 2:39:52 PM 
 */
package com.gansbat.space.comment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Comment;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: CommentDaoImpl.java
* @Description: 用于查询用户的评论
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 11, 2018 2:39:52 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 11, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class CommentDaoImpl extends BaseDao<Comment, Integer> {

	/*
	 * 根据传来的场地Id来查询出所有的评论
	 */
	public List<Comment> findAllAccordingSpaceId(Integer space_id) throws Exception{
		
		return super.find("from Comment where space_id = ?", new Object[] {space_id});
	}
}
