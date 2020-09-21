package com.example.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.example.bean.BoardInfoBean;
import com.example.bean.UserBean;
import com.example.service.BoardService;

public class BoardMenuInterceptor implements HandlerInterceptor {

	private BoardService boardService;
	private UserBean loginUserBean;
		
	public BoardMenuInterceptor(BoardService boardService, UserBean loginUserBean) {
		
		this.boardService = boardService;
		this.loginUserBean = loginUserBean;
	}



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		List<BoardInfoBean> boardMenuList = boardService.getBoardMenuList();
		
		request.setAttribute("boardMenuList", boardMenuList);
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
	
	
	
}
