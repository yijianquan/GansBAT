/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.selectspace.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:51:43 AM 
 */
package com.gansbat.space.selectspace.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Space;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SelectspaceDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:51:43 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class SelectspaceDaoImpl extends BaseDao<Space, Integer>{

	/*
	 * 根据传来场地类型t_is来查询所有该类型场地
	 */
	public List<Space> findOne(Integer t_id) throws Exception {
		return super.find("from Space where type_id=?", new Object[] {t_id});
	}
}
