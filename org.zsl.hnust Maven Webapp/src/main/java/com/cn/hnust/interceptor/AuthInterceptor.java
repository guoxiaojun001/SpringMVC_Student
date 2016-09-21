package com.cn.hnust.interceptor;


import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  
import org.springframework.web.servlet.ModelAndView;  
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;


public class AuthInterceptor extends HandlerInterceptorAdapter{

	private final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);  
	public static final String LAST_PAGE = "com.cn.hnust.interceptor";  


	
	/**  
     * 在业务处理器处理请求之前被调用  
     * 如果返回false  
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 
     * 如果返回true  
     *    执行下一个拦截器,直到所有的拦截器都执行完毕  
     *    再执行被拦截的Controller  
     *    然后进入拦截器链,  
     *    从最后一个拦截器往回执行所有的postHandle()  
     *    接着再从最后一个拦截器往回执行所有的afterCompletion() 
     *    
     *     handler标识当前被拦截的目标对象 controller中的
     */    
    @Override    
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {    
  
        log.info("==============执行顺序: 1、preHandle================");    
        
        request.setCharacterEncoding("utf-8");//也可以在拦截器中配置org.springframework.web.filter.CharacterEncodingFilter
        
        String requestUri = request.getRequestURI();  
        String contextPath = request.getContextPath();  
        String url = requestUri.substring(contextPath.length());  
        
        log.info("requestUri:"+requestUri);    
        log.info("contextPath:"+contextPath);    
        log.info("url:"+url);    
        String username =  (String)request.getSession().getAttribute("user");   
        if(username == null){  
            log.info("Interceptor：跳转到login页面！");  
            //如果需要直接退出并且 跳转到指定页面
           // request.getRequestDispatcher("/WEB-INF/jsp/user_record/login.jsp").forward(request, response);  
            
            request.getRequestDispatcher("/student/login" ).forward(request, response);//跳转到到登录页，浏览器地址不变
            //response.sendRedirect(request.getContextPath() + "/student/login" );//重定向到登录页，浏览器地址发生改变
            
            return false;  
        }else  
            return true;     
    }    
    
    /** 
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作    
     * 可在modelAndView中加入数据，比如当前时间 
     */  
    @Override    
    public void postHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {     
        log.info("==============执行顺序: 2、postHandle================");   
        
        
        
        if(modelAndView != null){  //加入当前时间    
            modelAndView.addObject("var", "测试postHandle，这是拦截之后的消息，可以在拦截器中修改返回的数据，或者修改返回的页面");    
        }    
    }    
    
    /**  
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等   
     *   
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()  
     */    
    @Override    
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)    
            throws Exception {    
        log.info("==============执行顺序: 3、afterCompletion================");    
    }    

}
