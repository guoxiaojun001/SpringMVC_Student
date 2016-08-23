package com.cn.hnust.service;

import com.cn.hnust.pojo.Admin;

public interface IAdminService {
	
	//通过用户名查询
	public Admin getAdminById(String name);
	
}
