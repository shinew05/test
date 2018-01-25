package ryu.minwoo.ums.service;

import ryu.minwoo.ums.domain.User;

import java.util.List;

public interface UserService {
	List<User> listUsers();
	User findUser(int userNo);
	boolean join(String userName);
	boolean correctUser(User user);
	boolean secede(int userNo);

}
