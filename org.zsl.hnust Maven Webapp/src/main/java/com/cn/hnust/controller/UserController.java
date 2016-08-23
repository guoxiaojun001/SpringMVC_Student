package com.cn.hnust.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	
	@RequestMapping("/deleteByPrimaryKey")
	public String deleteById(int id){
		this.userService.deleteByPrimaryKey(id);
		
		return "index";
	}
	
	@RequestMapping("/insert")
	public String insert(User record,Model model){
		
		User record1 = new User();
		record1.setAge(200);
		record1.setPassword("wwwwww");
		record1.setUserName("userName");
		
		this.userService.insert(record1);
		
		User result = this.userService.getUserById(5);
		
		model.addAttribute("user", result);
		
		return "insertSuccess";
	}
	
}
