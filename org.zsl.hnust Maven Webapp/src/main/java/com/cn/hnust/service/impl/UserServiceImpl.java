package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		System.out.println("-------getUserById----请查看 我的前后通知-----------"); 
		return this.userDao.selectByPrimaryKey(userId);
	}
	
	
	@Override
	public void deleteByPrimaryKey(int id) {
		System.out.println("-------deleteByPrimaryKey----请查看 我的前后通知-----------"); 
		 this.userDao.deleteByPrimaryKey(id);
		
	}


	@Override
	public void insert(User record) {
		
		this.userDao.insert(record);
	}


	@Override
	public List<User> queryAll() {
		
		return this.userDao.queryAll();
	}


	@Override
	public void updateByPrimaryKey(User user) {
		
		this.userDao.updateByPrimaryKey(user);
		
	}


}
