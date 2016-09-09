package com.cn.hnust.aop;


import org.aspectj.lang.JoinPoint;  
import org.aspectj.lang.ProceedingJoinPoint; 

/**
 * XML��ʽ
 TestAspect��������
 * @author Administrator
 *
 */
public class TestAspect {
	
	public void doAfter(JoinPoint jp) {  
        System.out.println("����֪ͨ��" + jp.getTarget().getClass().getName() + "." + jp.getSignature().getName());  
    }  
  
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {  
        long time = System.currentTimeMillis();  
        Object retVal = pjp.proceed();  
        time = System.currentTimeMillis() - time;  
        System.out.println("����֪ͨ ��process time: " + time + " ms");  
        return retVal;  
    }  
  
    public void doBefore(JoinPoint jp) {  
        System.out.println("ǰ��֪ͨ��" +  jp.getTarget().getClass().getName() + "." + jp.getSignature().getName());  
    }  
  
    public void doThrowing(JoinPoint jp, Throwable ex) {  
        System.out.println("�쳣֪ͨ�� " + jp.getTarget().getClass().getName() + "." + jp.getSignature().getName() + " throw exception");  
        System.out.println(ex.getMessage());  
    }  

}
