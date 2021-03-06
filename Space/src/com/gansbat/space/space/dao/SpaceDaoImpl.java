/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:16 AM 
 */
package com.gansbat.space.space.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Space;
import com.gansbat.space.entity.Type;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpaceDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:54:16 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class SpaceDaoImpl extends BaseDao<Space, Integer> {

	/*
	 * 根据传来的场地ID来返回场地
	 */
	public Space findSpaceAccordingSpaceId(Integer space_id) throws Exception {
		return super.findOne("from Space where space_id = ?", new Object[] {space_id});
	}
	/*
	 * 点赞数+1
	 */
	public void updataLikeSpace(Space space) throws Exception{
		System.out.println(space.getLikenum());
		super.update(space);
	}
}
