package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CommentVo;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void write(CommentVo commentVo) {
		
		sqlSession.insert("comment.write", commentVo);
	}

	public List<CommentVo> commentView(int no){
		
		return sqlSession.selectList("comment.commentView", no); 
	}
}
