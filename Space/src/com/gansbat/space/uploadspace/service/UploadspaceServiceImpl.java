/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.uploadspace.survice 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:43:14 AM 
 */
package com.gansbat.space.uploadspace.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.basedao.Page;
import com.gansbat.space.entity.Upload;
import com.gansbat.space.uploadspace.dao.UploadspaceDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: UploadspaceServiceImpl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:43:14 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class UploadspaceServiceImpl {
	
	@Resource
	private UploadspaceDaoImpl uploadspaceDaoImpl;
	
	@Transactional(readOnly=false)
	public void saveUpload(Upload upload) {
		try {
			uploadspaceDaoImpl.save(upload);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Transactional(readOnly=true)
	public Page<Upload> selectUpload(int pageNum,int user_id){
		try {
			System.out.println("正在进行分页查询上传过的界面....");
			return uploadspaceDaoImpl.findPage(pageNum, user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
