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
import com.gansbat.space.basedao.Page;
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
	 * 根据传来场地类型t_id来查询所有该类型场地
	 */
	public List<Space> findTypeAllSpace(Integer t_id) throws Exception {
		return super.find("from Space where type_id=?", new Object[] {t_id});
	}

	/*
	 * 根据传来场地类型t_id来查询所有该类型场地
	 */
	@Override
	public List<Space> find(String hql, Object[] params) throws Exception {
		// TODO Auto-generated method stub
		return super.find(hql, params);
	}
	/*
	 * 场地分页查询
	 */
	public Page<Space> findPageSpace(int pageNum,int type_id) throws Exception{
		return super.findPage(pageNum, 8, "select count(*) from Space where type_id=?", "from Space where type_id=?",new Object[] {type_id});
	}
	
}
