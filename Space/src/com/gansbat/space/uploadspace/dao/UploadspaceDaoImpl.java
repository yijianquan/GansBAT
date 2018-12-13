/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.uploadspace.dao 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:42:36 AM 
 */
package com.gansbat.space.uploadspace.dao;

import org.springframework.stereotype.Repository;

import com.gansbat.space.basedao.BaseDao;
import com.gansbat.space.basedao.Page;
import com.gansbat.space.entity.Upload;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UploadspaceDao.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:42:36 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Repository
public class UploadspaceDaoImpl extends BaseDao<Upload,Integer>{
	
	@Override
	public void save(Upload upload) throws Exception{
		super.save(upload);
	}
	
	/*
	 * 查询用户所有的上传记录
	 */
	public Page<Upload> findPage(int pageNum,int user_id)throws Exception {
		
		return super.findPage(pageNum, 4, "select count(*) from Upload where user_id = ?", "from Upload where user_id = ?", new Object[] {user_id});
	}
}
