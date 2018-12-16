/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.history.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:56:06 AM 
 */
package com.gansbat.space.history.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.basedao.Page;
import com.gansbat.space.entity.History;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: HistoryDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:56:06 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class HistoryDaoImpl extends BaseDao<History, Integer> {

	/*
	 * 存储用户的浏览记录
	 */
	@Override
	public void save(History history) throws Exception{
		super.save(history);
	}
	/*
	 * 查询用户的单条浏览记录
	 */
	public History findHistoryAccordingSpaceId(int space_id,int user_id) throws Exception{
		return super.findOne("from History where space_id = ? and user_id = ?", new Object[] {space_id,user_id});
	}
	/*
	 * 删除用户的浏览记录
	 */
	public void delete(History history) throws Exception{
		super.delete(history);
	}
	/*
	 * 读取用户所有的历史记录
	 */
	public Page<History> findPage(int pageNum,int user_id)
			throws Exception {
		// TODO Auto-generated method stub
		return super.findPage(pageNum, 5, "select count(*) from History where user_id = ?", "from History where user_id = ?",new Object[] {user_id});
	}

	
}
