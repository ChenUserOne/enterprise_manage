package com.itcast.ssm.controller;

import com.itcast.ssm.domain.SysLog;
import com.itcast.ssm.service.ISysLogSService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogSService sysLogSService;
    /**
     * 开始时间
     */
    private Date visitTime;
    /**
     * 访问的类
     */
    private Class clazz;
    /**
     * 访问的方法
     */
    private Method method;

    @Before("execution(* com.itcast.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        /**
         *当前时间就是开始访问时间
         */
        visitTime=new Date();
        /**
         *具体访问的类
         */
        clazz=jp.getTarget().getClass();
        /**
         *获取访问方法的名称
         */
        String methodName=jp.getSignature().getName();
        /**
         *获取访问的方法的参数
         */
        Object[] args = jp.getArgs();

        //获取具体执行的方法的method对象
        if (args==null||args.length==0){
            /**
             *只能获取无参数的方法
             */
            method=clazz.getMethod(methodName);
        }
        else{
            Class[] classesArgs=new Class[args.length];
            for (int i = 0; i <args.length; i++) {
                classesArgs[i]=args[i].getClass();
            }
            clazz.getMethod(methodName,classesArgs);
        }
    }



    //后置通知
    @After("execution(* com.itcast.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp){
        /**
         * 获取访问时长
         */
        long time= new Date().getTime() - visitTime.getTime();
        String url="";
        if (clazz!=null && method!=null &&clazz!=LogAop.class){
            /**
             * 1.获取类上的@RequstMapping("/orders")
             */
            RequestMapping clazzAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (clazzAnnotation!=null){
                String[] classValue = clazzAnnotation.value();

                /**
                 * 获取方法上的@RequestMapping()
                 */
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation!=null){
                    String[] methodValue = methodAnnotation.value();
                    url=classValue[0]+methodValue[0];

                    /**
                     * 获取访问的ip
                     */
                    String ip = request.getRemoteAddr();
                    SecurityContext context = SecurityContextHolder.getContext();
                    User user = (User) context.getAuthentication().getPrincipal();
                    String username=user.getUsername();

                    //将日志相关信息封装到SysLog对象
                    SysLog sysLog=new SysLog();
                    sysLog.setExecutionTime(time);
                    sysLog.setIp(ip);
                    sysLog.setMethod("类名 "+clazz.getName()+"方法名 "+method.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(visitTime);
                    //调用Service完成操作
                    sysLogSService.save(sysLog);
                }
            }
        }

    }
}
