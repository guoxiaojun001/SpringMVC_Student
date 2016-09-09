package org.zsl.testmybatis;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cn.hnust.service.IUserService;

public class Test {
	
	public static void main(String[] args) {
		
		
		 BeanFactory factory = new ClassPathXmlApplicationContext("spring-mvc.xml");  
		 IUserService user = (IUserService) factory.getBean("user");  
	        user.getUserById(28); 
	          
//	      u.setUsername("Tom");  
//	      user.findUser(u.getUsername());  
	          
	        /*u.setUsername("haha"); 
	        user.addUser(u.getUsername());*/  
	    }  

}
