package com.example.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.bean.UserBean;
import com.example.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper userMapper;
	
public String checkUserIdExist(String user_id) {
	return userMapper.checkUserIdExist(user_id);
}

public void addUserInfo(UserBean signUpUserInfo) {
	userMapper.addUserInfo(signUpUserInfo);
}

public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
	return userMapper.getLoginUserInfo(tempLoginUserBean);
}

public UserBean getModifyUserInfo(int user_idx) {
	return userMapper.getModifyUserInfo(user_idx);
}

public void modifyUserInfo(UserBean modifyUserBean) {
	userMapper.modifyUserInfo(modifyUserBean);
}

}
