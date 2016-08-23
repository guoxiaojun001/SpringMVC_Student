package com.cn.hnust.dao;


import com.cn.hnust.pojo.Admin;

public interface IAdminDao {

    Admin selectByName(String name);
    
}