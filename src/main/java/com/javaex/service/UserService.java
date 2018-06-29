package com.javaex.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
//	@Autowired
//	private BlogDao blogDao;
//	
//	@Autowired
//	private CategoryDao cateDao;
	
	public String idCheck(String id) {
		System.out.println("userService id: " + id);
		String count = userDao.idCheck(id);
		String result;
		if(count !=null) {
			result = "true";
		}else {
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	
	
	public int join(UserVo userVo) {
		int joinResult = userDao.join(userVo);
//		String id = userVo.getId();
//		String blogTitle = userVo.getUserName() + "의 블로그입니다.";
//		String logoFile = "spring-logo.jpg";
//		
//		Map<String, String> blogMap = new HashMap<String, String>();
//		blogMap.put("id", id);
//		blogMap.put("blogTitle", blogTitle);
//		blogMap.put("logoFile", logoFile);
		
		
		return joinResult;
	}
	
	
	public UserVo login(UserVo userVo) {
		
		return userDao.login(userVo);
	}
}
