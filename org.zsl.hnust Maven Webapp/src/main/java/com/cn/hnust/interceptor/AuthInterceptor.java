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
     * ��ҵ��������������֮ǰ������  
     * �������false  
     *     �ӵ�ǰ������������ִ��������������afterCompletion(),���˳��������� 
     * �������true  
     *    ִ����һ��������,ֱ�����е���������ִ�����  
     *    ��ִ�б����ص�Controller  
     *    Ȼ�������������,  
     *    �����һ������������ִ�����е�postHandle()  
     *    �����ٴ����һ������������ִ�����е�afterCompletion() 
     *    
     *     handler��ʶ��ǰ�����ص�Ŀ����� controller�е�
     */    
    @Override    
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {    
  
        log.info("==============ִ��˳��: 1��preHandle================");    
        
        request.setCharacterEncoding("utf-8");//Ҳ������������������org.springframework.web.filter.CharacterEncodingFilter
        
        String requestUri = request.getRequestURI();  
        String contextPath = request.getContextPath();  
        String url = requestUri.substring(contextPath.length());  
        
        log.info("requestUri:"+requestUri);    
        log.info("contextPath:"+contextPath);    
        log.info("url:"+url);    
        String username =  (String)request.getSession().getAttribute("user");   
        if(username == null){  
            log.info("Interceptor����ת��loginҳ�棡");  
            //�����Ҫֱ���˳����� ��ת��ָ��ҳ��
           // request.getRequestDispatcher("/WEB-INF/jsp/user_record/login.jsp").forward(request, response);  
            
            request.getRequestDispatcher("/student/login" ).forward(request, response);//��ת������¼ҳ���������ַ����
            //response.sendRedirect(request.getContextPath() + "/student/login" );//�ض��򵽵�¼ҳ���������ַ�����ı�
            
            return false;  
        }else  
            return true;     
    }    
    
    /** 
     * ��ҵ��������������ִ����ɺ�,������ͼ֮ǰִ�еĶ���    
     * ����modelAndView�м������ݣ����統ǰʱ�� 
     */  
    @Override    
    public void postHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {     
        log.info("==============ִ��˳��: 2��postHandle================");   
        
        
        
        if(modelAndView != null){  //���뵱ǰʱ��    
            modelAndView.addObject("var", "����postHandle����������֮�����Ϣ�����������������޸ķ��ص����ݣ������޸ķ��ص�ҳ��");    
        }    
    }    
    
    /**  
     * ��DispatcherServlet��ȫ����������󱻵���,������������Դ��   
     *   
     * �����������׳��쳣ʱ,��ӵ�ǰ����������ִ�����е���������afterCompletion()  
     */    
    @Override    
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)    
            throws Exception {    
        log.info("==============ִ��˳��: 3��afterCompletion================");    
    }    

}
