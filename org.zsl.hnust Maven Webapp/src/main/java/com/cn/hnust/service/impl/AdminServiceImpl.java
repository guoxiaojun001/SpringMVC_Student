package com.cn.hnust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IAdminDao;
import com.cn.hnust.pojo.Admin;
import com.cn.hnust.service.IAdminService;


//�˴�һ����Ҫ���� ��Ӵ�ע�� ��Ȼ��controller �޷�����userService
@Service("adminService")
public class AdminServiceImpl implements IAdminService{

	@Resource
	IAdminDao iAdminDao;
	
	@Override
	public Admin getAdminById(String name) {
		
		System.out.println("-------getAdminById----��鿴 �ҵ�ǰ��֪ͨ-----------"); 
		return this.iAdminDao.selectByName(name);
	}

}
