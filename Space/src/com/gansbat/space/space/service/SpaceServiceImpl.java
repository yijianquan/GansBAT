/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:32 AM 
 */
package com.gansbat.space.space.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.Space;
import com.gansbat.space.space.dao.SpaceDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpaceServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:54:32 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class SpaceServiceImpl {

	@Resource
	private SpaceDaoImpl spaceDaoImpl;

	@Transactional(readOnly=true)
	public Space selectSpaceAccordingSpaceId(Integer space_id) {
		Space space = new Space();
		try {
			space = spaceDaoImpl.findSpaceAccordingSpaceId(space_id);
			return space;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return space;
	}
	
	//用户点赞
	@Transactional(readOnly=false)
	public Integer likeSpace(Integer space_id,Integer likenum) {
		Space space  = selectSpaceAccordingSpaceId(space_id);
		space.setLikenum(likenum);
		System.out.println(space.getLikenum());
		try {
			spaceDaoImpl.updataLikeSpace(space);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
