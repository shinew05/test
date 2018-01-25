package ryu.minwoo.ums.dao;

import ryu.minwoo.ums.config.Configuration;
import ryu.minwoo.ums.dao.mapper.UserMapper;
import ryu.minwoo.ums.domain.User;

import java.util.List;

public class UserDaoImpl implements UserDao {
	private UserMapper userMapper;

	public UserDaoImpl() {
		this.userMapper = Configuration.getMapper(UserMapper.class);
	}

	public User getUser(int userNo) {
		return userMapper.findUser(userNo);
	}

	public boolean addUser(String userName) {
		boolean isAdd = false;
		if (userMapper.addUser(userName) > 0)
			isAdd = true;
		return isAdd;
	}

	public boolean updateUser(User user) {
		boolean isModify = false;
		if (userMapper.updateUser(user) > 0)
			isModify = true;

		return isModify;
	}

	public boolean delUser(int userNo) {
		boolean isDel = false;
		if (userMapper.delUser(userNo) > 0)
			isDel = true;
		return isDel;
	}

	public List<User> getUserList() {
		return userMapper.getUsers();
	}
	
	public void resultVal(){
	}
}