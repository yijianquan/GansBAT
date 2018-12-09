/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.space.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:54:32 AM 
 */
package com.gansbat.space.space.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.Type;
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
@Transactional(readOnly=true)
public class SpaceServiceImpl {

	@Resource
	private SpaceDaoImpl spaceDaoImpl;

	@Transactional(readOnly=true)
	public List<Type> selectAllType(){
		List<Type> t_list = new ArrayList<>();
		try {
			t_list = spaceDaoImpl.findAll();
			System.out.println("service查询成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t_list;
	}
}
