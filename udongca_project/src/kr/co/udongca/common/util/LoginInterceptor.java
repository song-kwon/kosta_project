package kr.co.udongca.common.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import kr.co.udongca.service.impl.MemberServiceImpl;
import kr.co.udongca.vo.Member;

/*
 * Interceptor : Spring MVC에서 handler(Controller)들의 공통 로직을 처리하기 위한 Component.(Servlet에서 Filter의 역할)
 * 
 * 구현
 * 		-HandlerInterceptor를 implements
 * 		-HandlerInterceptorAdapter를 extends 후 필요한 callback 메소드 overriding
 * 		-callback 메소드
 * 			=preHandle() : handler메소드 호출 전에 호출되는 메소드.
 * 			=postHandle() : handler메소드 처리 완료후 호출 되는 메소드
 * 			=afterCompletion() - View의 실행이 완료된 후 호출 되는 메소드.(handler와 관련된 사용자 요청 처리 완료후)
 * 
 * Interceptor로 spring 설정파일을 이용해 등록.
 * 		-Interceptor 클래스를 bean으로 등록
 * 		-<mvc:interceptors>태그를 이용해 interceptor로 등록.
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	static HashMap<String, Member> loginContext;
	
	@Autowired
	public MemberServiceImpl memberService;

	@Override
	//매개변수 3 : 호출된 handler를 가진 Controller 객체.
	//리턴값 : true - handler 호출,  false - handler를 호출하지 않는다.
	//Exception이 발생해서 던지면 handler메소드는 호출 되지 않는다.
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor.preHandle() 실행");
		
		//로그인여부 체크
		
		if(loginContext == null){
			loginContext = new HashMap<>();
		}
		
		Member loginInfo = memberService.login(request.getParameter("id"), request.getParameter("password"));
		
		if(loginInfo != null){
			loginContext.put(request.getParameter("id"), loginInfo);
		}
		
		return true;
	}

	@Override
	//매개변수 4: 호출된 handler가 return한 ModelAndView 객체
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("LoginInterceptor.postHandle() 실행");
	}

	@Override
	//매개변수 4 : Handler나 View에서  던진 Exception이 있을 경우 그 Exception객체
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("LoginInterceptor.afterCompletion() 실행");
		
		if(loginContext != null)
			System.out.println(loginContext.values());
	}



	
}
