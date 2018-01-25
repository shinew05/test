package ryu.minwoo.ums.dao;

import ryu.minwoo.ums.domain.User;

import java.util.List;

public interface UserDao {           
    User getUser(int userNo);           
    boolean addUser(String userName); 
    boolean updateUser(User user);  
    boolean delUser(int userNo);  
    
    List<User> getUserList();
    void resultVal();
}