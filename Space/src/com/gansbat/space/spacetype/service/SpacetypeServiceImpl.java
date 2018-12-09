package com.gansbat.space.spacetype.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.Type;
import com.gansbat.space.space.dao.SpaceDaoImpl;
import com.gansbat.space.spacetype.dao.SpacetypeDaoImpl;

/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.service 
 * @author: Xiaoyi   
 * @date: Dec 9, 2018 6:17:04 PM 
 */


/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SpacetypeServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 9, 2018 6:17:04 PM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 9, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=true)
public class SpacetypeServiceImpl {
	@Resource
	private SpacetypeDaoImpl spacetypeDaoImpl;

	@Transactional(readOnly=true)
	public List<Type> selectAllType(){
		List<Type> t_list = new ArrayList<>();
		try {
			t_list = spacetypeDaoImpl.findAll();
			System.out.println("service查询成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t_list;
	}
}
