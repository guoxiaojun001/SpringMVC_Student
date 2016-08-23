package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.User;

public interface IUserService {
	//ͨ��id��ѯ
	public User getUserById(int userId);
	
	//ͨ��idɾ��
	void deleteByPrimaryKey(int id);
	
	//����һ������
	void insert(User record);
	
	
	List<User> queryAll();
	
	void updateByPrimaryKey(User user);//����id���ݸ���
}
