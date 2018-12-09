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
@Transactional(readOnly=true)
public class SelectspaceServiceImpl implements SelectspaceService {

	@Resource
	private SelectspaceDaoImpl selectspaceDaoImpl;

	/*
	 * 将前台传来的登录数据与后台的用户进行对比,如果存在返回用户的昵称
	 */
	@Transactional(readOnly=true)
	public List<Space> selectAllSpace(int t_id){
		List<Space> s_list = new ArrayList<>();
		try {
			s_list = selectspaceDaoImpl.findOne(t_id);
			System.out.println("查询该类场地成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s_list;
	}
	
}