package com.cn.hnust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IAdminDao;
import com.cn.hnust.pojo.Admin;
import com.cn.hnust.service.IAdminService;


//此处一定不要忘记 添加此注解 不然在controller 无法调用userService
@Service("adminService")
public class AdminServiceImpl implements IAdminService{

	@Resource
	IAdminDao iAdminDao;
	
	@Override
	public Admin getAdminById(String name) {
		
		System.out.println("-------getAdminById----请查看 我的前后通知-----------"); 
		return this.iAdminDao.selectByName(name);
	}

}
