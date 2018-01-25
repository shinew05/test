<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ryu.minwoo.ums.service.UserService" %>
<%@ page import="ryu.minwoo.ums.service.UserServiceImpl" %>
<%@ page import="ryu.minwoo.ums.dao.UserDao" %>
<%@ page import="ryu.minwoo.ums.dao.UserDaoImpl" %>
<%@ page import="ryu.minwoo.ums.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String userName=request.getParameter("userName");
	String procNum=request.getParameter("procNum");
	String userNo=request.getParameter("userNo");
	
	int proChk=0;
	int userNoChk=0;
	
	if(procNum != "" && procNum !=null && !procNum.equals("")){
		proChk = Integer.parseInt(procNum);
	}
	if(userNo != "" && userNo !=null && !userNo.equals("")){
		userNoChk=Integer.parseInt(userNo);
	}
	UserDao userDao = new UserDaoImpl();
	UserService userService = new UserServiceImpl(userDao);
	
	if(proChk==1){
		userService.join(userName);
	}else if(proChk==2){
		User user = null;
		user=userService.findUser(userNoChk);
		user.setUserName(userName);
		userService.correctUser(user);
	}else if(proChk==3){
		userService.secede(userNoChk);
	}
%>
