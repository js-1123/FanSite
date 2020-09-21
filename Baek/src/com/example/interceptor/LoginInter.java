package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.example.bean.UserBean;

public class LoginInter implements HandlerInterceptor{
	
	
	private UserBean loginUserBean;
	
	public LoginInter(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
}
