package com.example.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.bean.UserBean;

@Controller
public class HomeController {
	
	@Resource(name ="loginUserBean")
	private UserBean loginUserBean;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
//		System.out.println(request.getServletContext().getRealPath("/"));
//		System.out.println(loginUserBean);
		return "main";
	}
	
	
}

