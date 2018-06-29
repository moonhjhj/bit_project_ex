package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int write(BoardVo boardVo) {
		System.out.println("[BoardDao IN] >> board write");
		
		return sqlSession.insert("board.write", boardVo);
	}
	
	public List<BoardVo> getBoardList(){
		
		System.out.println("[BoardDao IN] board list");
		return sqlSession.selectList("board.getBoardList");
	}
	
//	public List<BoardVo> boardView(int no){
//		
//		return sqlSession.selectList("board.boardView", no);
//	}
	public List<BoardVo> boardView(BoardVo boardVo){
		
		return sqlSession.selectList("board.boardView", boardVo);
	}
	
	public void edit(BoardVo boardVo) {
		
		System.out.println("[BoardDao IN] >> edit");
		sqlSession.update("board.edit", boardVo);
		System.out.println("[BoardDao OUT] >> edit");
		
	}
}
