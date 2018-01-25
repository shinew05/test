package ryu.minwoo.ums.dao.mapper;

import ryu.minwoo.ums.domain.User;

import java.util.List;

public interface UserMapper {
	List<User> getUsers();
	User findUser(int userNo);
	int addUser(String userName);
	int updateUser(User user);
    int delUser(int userNo);
    List<User> getUsers2();
}
