package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.User;

public interface IUserService {
	//通过id查询
	public User getUserById(int userId);
	
	//通过id删除
	void deleteByPrimaryKey(int id);
	
	//插入一条数据
	void insert(User record);
	
	
	List<User> queryAll();
	
	void updateByPrimaryKey(User user);//根据id数据更新
}
