package ryu.minwoo.ums.domain;

import java.sql.Date;

public class User {
	private int userNo;
	private String userName;
	private Date regDate;

	public User() {}

	public User(int userNo, String userName, Date regDate) {
		this.userNo = userNo;
		this.userName = userName;
		this.regDate = regDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return String.format("%d %-6s %s", userNo, userName, regDate);
	}
}
