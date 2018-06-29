package com.javaex.vo;

public class UserVo {
	
	private String id;
	private String userName;
	private String userPw;
	public UserVo(String id, String userName, String userPw) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPw = userPw;
	}
	public UserVo() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	@Override
	public String toString() {
		return "UserVo [userNo=" +  ", id=" + id + ", userName=" + userName + ", userPw=" + userPw
				+ ", joinDate=" + "]";
	}

}
