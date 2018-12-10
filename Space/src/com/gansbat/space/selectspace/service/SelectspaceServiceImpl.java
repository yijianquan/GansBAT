/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.selectspace.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:52:02 AM 
 */
package com.gansbat.space.selectspace.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.entity.Space;
import com.gansbat.space.selectspace.dao.SelectspaceDaoImpl;
import com.gansbat.space.user.service.UserServiceImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: SelectspaceServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:52:02 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class SelectspaceServiceImpl implements SelectspaceService {

	@Resource
	private SelectspaceDaoImpl selectspaceDaoImpl;

	/*
	 * 根据类型ID找到所有的场地并返回
	 */
	@Transactional(readOnly=true)
	public List<Space> selectAllSpace(Integer t_id){
		System.out.println("跳转到了service");
		List<Space> s_list = new ArrayList<Space>();
		try {
			s_list = selectspaceDaoImpl.findTypeAllSpace(t_id);
			System.out.println("查询该类场地成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s_list;
	}
	
}
