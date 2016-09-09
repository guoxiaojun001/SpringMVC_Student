package com.cn.hnust.aop;


import org.aspectj.lang.JoinPoint;  
import org.aspectj.lang.ProceedingJoinPoint; 

/**
 * XML方式
 TestAspect：切面类
 * @author Administrator
 *
 */
public class TestAspect {
	
	public void doAfter(JoinPoint jp) {  
        System.out.println("后置通知：" + jp.getTarget().getClass().getName() + "." + jp.getSignature().getName());  
    }  
  
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {  
        long time = System.currentTimeMillis();  
        Object retVal = pjp.proceed();  
        time = System.currentTimeMillis() - time;  
        System.out.println("环绕通知 ：process time: " + time + " ms");  
        return retVal;  
    }  
  
    public void doBefore(JoinPoint jp) {  
        System.out.println("前置通知：" +  jp.getTarget().getClass().getName() + "." + jp.getSignature().getName());  
    }  
  
    public void doThrowing(JoinPoint jp, Throwable ex) {  
        System.out.println("异常通知： " + jp.getTarget().getClass().getName() + "." + jp.getSignature().getName() + " throw exception");  
        System.out.println(ex.getMessage());  
    }  

}
