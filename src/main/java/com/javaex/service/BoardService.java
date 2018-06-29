package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.dao.BoardDao;
import com.javaex.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public int write(BoardVo boardVo) {
		
		System.out.println("[BoardService IN] >> board write");
		
		return boardDao.write(boardVo); 
	}
	
	public List<BoardVo> getBoardList(){
		
		System.out.println("[BoardService IN] >> board list");
		return boardDao.getBoardList();
	}
	
//	public List<BoardVo> boardView(int no){
//		
//		System.out.println("[BoardService IN] >> boardView");
//		return boardDao.boardView(no);
//	}
	public List<BoardVo> boardView(BoardVo boardVo){
		
		System.out.println("[BoardService IN] >> boardView");
		return boardDao.boardView(boardVo);
	}
	
	public void edit(BoardVo boardVo) {
		System.out.println("[BoardService IN] >> edit");
		boardDao.edit(boardVo);
		System.out.println("[BoardService OUT] >> edit");
	}
	
	
	
}
