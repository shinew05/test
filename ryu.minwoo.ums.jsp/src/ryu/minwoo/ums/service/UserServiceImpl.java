package ryu.minwoo.ums.service;

import ryu.minwoo.ums.dao.UserDao;
import ryu.minwoo.ums.domain.User;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao;
        
    public UserServiceImpl(UserDao userDao){
        this.userDao = userDao;
    }
    
 
    public List<User> listUsers() {
        return userDao.getUserList();
    }
    

    public User findUser(int userNo) {
        return userDao.getUser(userNo);
    }

    
    public boolean join(String userName) {        
        return userDao.addUser(userName);
    }
 
      
    public boolean correctUser(User user) {
        return userDao.updateUser(user);
    }
      
    public boolean secede(int userNo) {
        return userDao.delUser(userNo);
    }
}
