/**   
 * Copyright © 2018 eSunny Info. Tech Ltd. All rights reserved.
 * 
 * 功能描述：
 * @Package: com.gansbat.space.history.service 
 * @author: Xiaoyi   
 * @date: Dec 6, 2018 9:56:18 AM 
 */
package com.gansbat.space.history.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gansbat.space.basedao.Page;
import com.gansbat.space.entity.History;
import com.gansbat.space.history.dao.HistoryDaoImpl;

/**   
* Copyright: Copyright (c) 2018 LanRu-Caifu
* 
* @ClassName: HistoryServiceImppl.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: Xiaoyi
* @date: Dec 6, 2018 9:56:18 AM 
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* Dec 6, 2018     Xiaoyi           v1.0.0               修改原因
*/
@Service
@Transactional(readOnly=false)
public class HistoryServiceImpl {
	
	@Resource HistoryDaoImpl historyDaoImpl;
	
	/*
	 * 插入历史记录
	 */
	@Transactional(readOnly=false)
	public void insertHistory(Integer user_id,Integer space_id,String space_name,String space_img){
		History history = new History();
		history.setSpace_img(space_img);
		history.setSpace_id(space_id);
		history.setSpace_name(space_name);
		history.setUser_id(user_id);
		//如果用户已经拥有该条浏览历史，则删除上一条历史记录
		try {
			History d_history = historyDaoImpl.findHistoryAccordingSpaceId(space_id,user_id);
			historyDaoImpl.delete(d_history);
			System.out.println("删除成功！");
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			historyDaoImpl.save(history);
			System.out.println("存储浏览记录成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*
	 * 查询历史记录
	 */
	@Transactional(readOnly=true)
	public Page<History> selectHistory(int pageNum,int user_id){
		try {
			System.out.println("正在进行分页查询....");
			return historyDaoImpl.findPage(pageNum,user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
