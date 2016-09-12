package com.cn.hnust.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.pojo.Admin;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IAdminService;
import com.cn.hnust.service.IUserService;

@Controller
@RequestMapping("/student")
public class LoginController {

	@Resource
	private IUserService userService;//学生信息 管理

	@Resource
	private IAdminService adminService;

	@RequestMapping("/login")
	public String loginSystem() {
		// WEB-INF/jsp/user_record/record.jsp

		return "user_record/login";
	}


	@RequestMapping("/loginverify")
	public String manager(HttpServletRequest request) {
		// WEB-INF/jsp/user_record/record.jsp
		//获取用户输入信息，判断登录状态
		String name = request.getParameter("user_name");
		String password = request.getParameter("password");

		System.out.println("name = " + name);
		System.out.println("password = " + password);

		if(null == name || null == password){
			return "user_record/loginfailure";
		}

		if("".equals(name) || "".equals(password)){
			return "user_record/loginfailure";
		}

		Admin admin = this.adminService.getAdminById(name);

		if(null == admin){
			return "user_record/loginfailure";
		}

		System.out.println("数据库查询的账号信息为 ： " + admin.getName() + " : " + admin.getPassword());


		if(admin.getName().equals(name.trim()) && admin.getPassword().equals(password)){
			//登录成功
			return "user_record/manager";
		}else{
			//登录失败
			return "user_record/loginfailure";
		}

	}
	
	
	@RequestMapping("/test")
	@ResponseBody
	public String test(){
		
		System.out.println("执行到ajax方法了");
		
		return "this is a test";
	}
	
	
	
	@RequestMapping("/jquery")
	@ResponseBody
	public String testJquery(){
		
		System.out.println("执行到ajax方法了");
		
		return "this is a test";
	}

	@RequestMapping("/itemInsert")
	public String recordItem() {
		// WEB-INF/jsp/user_record/record.jsp
		return "user_record/itemInsert";
	}

	@RequestMapping(value="/saveItem", method = RequestMethod.POST)
	public String saveItem(HttpServletRequest request) {
		String name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String age = request.getParameter("age");

		System.out.println("name = " + name);
		System.out.println("password = " + password);
		System.out.println("age = " + age);

		User record1 = new User();
		record1.setUserName(name);
		record1.setPassword(password);
		record1.setAge(Integer.valueOf(age));

		this.userService.insert(record1);
		return "user_record/result";
	}


	@RequestMapping("/disResult")
	public String disResult(HttpServletRequest request){

		try {
			List<User> resultList= userService.queryAll();
			request.setAttribute("resultList", resultList);
			if(resultList==null){
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "user_record/result";
	}


	@RequestMapping("/queryById")
	public String queryById() {
		// WEB-INF/jsp/user_record/record.jsp
		return "user_record/queryById";
	}


	//	//用Model 返回一条数据
	//	@RequestMapping("/dispalyOneItem")
	//	public String dispalyOneItem(HttpServletRequest request,Model model){
	//
	//		String userId = request.getParameter("user_id");
	//		
	//		System.out.println("*******userId = " + userId);
	//		
	//		User userItem = this.userService.getUserById(Integer.valueOf(userId));
	//
	//		model.addAttribute("userItem", userItem);
	//		return "user_record/dispalyOneItem";
	//	}


	//用ModelAndView 返回一条数据
	@RequestMapping("/dispalyOneItem")
	public ModelAndView dispalyOneItem(HttpServletRequest request){
		String userId = request.getParameter("user_id");
		User userItem = this.userService.getUserById(Integer.valueOf(userId));

		ModelAndView mv = new ModelAndView();  
		//添加模型数据 可以是任意的POJO对象  
		mv.addObject("userItem", userItem);  
		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面  
		mv.setViewName("user_record/dispalyOneItem");  

		return mv;
	}


	@RequestMapping("/dispalyAll")
	public String disPlayAll(HttpServletRequest request,Model model){
		List<User> userList = this.userService.queryAll();

		System.out.println("userList = " + userList);

		for(User user : userList){
			System.out.println("name = " + user.getUserName());
			System.out.println("password = " + user.getPassword());
			System.out.println("age = " + user.getAge());
		}

		model.addAttribute("userList", userList);
		//		ModelAndView mv = new ModelAndView();  
		//		//添加模型数据 可以是任意的POJO对象  
		//		mv.addObject("userList", userList);  
		//		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面  
		//		mv.setViewName("user_record/dispalyAll");  

		return "user_record/dispalyAll";
	}



	@RequestMapping("/deleteById")
	public String deleteById() {
		// WEB-INF/jsp/user_record/record.jsp
		return "user_record/deleteById";
	}

	@RequestMapping("/deleteresult")
	public ModelAndView deleteResult(HttpServletRequest request){

		String user_id = request.getParameter("user_id");
		User  user = userService.getUserById(Integer.valueOf(user_id));

		this.userService.deleteByPrimaryKey(Integer.valueOf(user_id));

		ModelAndView mv = new ModelAndView();  
		//添加模型数据 可以是任意的POJO对象  
		mv.addObject("user", user);  //删除的数据
		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面  
		mv.setViewName("user_record/deleteresult");  

		return mv;
	}



	@RequestMapping("/updateById")
	public String updateById() {
		// WEB-INF/jsp/user_record/record.jsp
		return "user_record/updateById";
	}


	//用ModelAndView 返回一条数据
	@RequestMapping("/updateItem")
	public ModelAndView updateItem(HttpServletRequest request){
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String age = request.getParameter("age");


		User  before = userService.getUserById(Integer.valueOf(user_id));


		User  after = new User();
		after.setId(Integer.valueOf(user_id));
		after.setUserName(user_name);
		after.setPassword(password);
		after.setAge(Integer.valueOf(age));

		this.userService.updateByPrimaryKey(after);

		ModelAndView mv = new ModelAndView();  
		//添加模型数据 可以是任意的POJO对象  
		mv.addObject("after", after);  //更新前的数据

		mv.addObject("before", before);  //更新后的数据
		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面  
		mv.setViewName("user_record/updateresult");  

		return mv;
	}

}
