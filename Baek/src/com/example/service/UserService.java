package com.example.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bean.ContentBean;
import com.example.bean.UserBean;
import com.example.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	
public boolean checkuserIdExist(String user_id) {
		
		String user_name = userDao.checkUserIdExist(user_id);
		
		if(user_name == null) {
			return true;
		} else {
			return false;
		}
	}

public void addUserInfo(UserBean signUpUserInfo) {
	userDao.addUserInfo(signUpUserInfo);
}

public void getLoginUserInfo(UserBean tempLoginUserBean) {
	
	UserBean temp = userDao.getLoginUserInfo(tempLoginUserBean);
	
	if(temp != null) {
		loginUserBean.setUser_idx(temp.getUser_idx());
		loginUserBean.setUser_name(temp.getUser_name());
		loginUserBean.setUserLogin(true);
	}
}

public void getModifyUserInfo(UserBean modifyUserBean) {
	UserBean tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getUser_idx());
	
	modifyUserBean.setUser_id(tempModifyUserBean.getUser_id());
	modifyUserBean.setUser_name(tempModifyUserBean.getUser_name());
	modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
	
	
}

public void modifyUserInfo(UserBean modifyUserBean) {
	
	modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
	
	userDao.modifyUserInfo(modifyUserBean);
}





}
