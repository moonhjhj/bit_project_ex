package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CommentDao;
import com.javaex.vo.CommentVo;

@Service
public class CommentService {
	
	@Autowired
	private CommentDao commentDao;

	
	public void write(CommentVo commentVo) {
		
		commentDao.write(commentVo);
		
		
	}
	
	public List<CommentVo> commentView(int no){

		return commentDao.commentView(no);
	}
}
