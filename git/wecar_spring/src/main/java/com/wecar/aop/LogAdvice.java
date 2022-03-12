package com.wecar.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LogAdvice {
	// Before	: 메서드 호출전에 사용
	// After	: 메서드 호출후에 사용
	// Around	: after + before
	@Around("execution(* com.wecar.comtroller.*Controller.*(..))"
			+ " or execution(* com.wecar.mapper.*Mapper.*(..))"
			+ " or execution(* com.wecar.service.*Service.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		log.info("................ @Around : start");
		long start = System.currentTimeMillis();
		Object result = null;
		log.info("Target : " + pjp.getTarget());
		log.info("Param : " + Arrays.toString(pjp.getArgs()));

		try { result = pjp.proceed();} catch (Throwable e) {e.printStackTrace();}
		
		long end = System.currentTimeMillis();
		log.info("TIME : " + (end-start));
		log.info("................ @Around : end");
		return result;
	}
}
