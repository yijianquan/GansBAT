/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.spacetype.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:49:02 AM 
 */
package com.gansbat.space.spacetype.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.entity.Type;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpacetypeDaoImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:49:02 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class SpacetypeDaoImpl extends BaseDao<Type, Integer> {
	/*
	 * 查询出场地所有类型
	 */
	@Override
	public List<Type> findAll() throws Exception{
		return super.findAll();
	}
}
