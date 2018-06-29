package com.javaex.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVo;

@Controller
@RequestMapping(value = "/board")
public class boardController {
	
	@Autowired
	private BoardService boardService;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String board() {
//		
//		System.out.println("[BoardController IN] >> board main");
//		return "board/board";
//	}
	
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String writeform() {
		
		System.out.println("[BoardController IN] >> board writeform");
		return "board/write";
	}
	
	@RequestMapping(value = "/write")
	public String write(@ModelAttribute BoardVo boardVo) {
		
		boardService.write(boardVo);
		System.out.println("[BoardController IN] >> board write ");
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/list")
	public String boardList(Model model) {
		List<BoardVo> list = boardService.getBoardList();
		model.addAttribute("list", list);
		System.out.println("[BoardController OUT] >> board list " + list.toString());
		
		return "board/board";
	}

//	@RequestMapping(value = "/view")
//	public String boardView(@RequestParam("no") int no,  Model model) {
//		List<BoardVo> boardView = boardService.boardView(no);
//		model.addAttribute("boardView", boardView);
//		return "board/view";
//	}
	@RequestMapping(value = "/view")
	public String boardView(@ModelAttribute BoardVo boardVo,  Model model) {
		List<BoardVo> boardView = boardService.boardView(boardVo);
		model.addAttribute("boardView", boardView);
		return "board/view";
	}
	
	@RequestMapping(value = "/editform")
	public String editform(@ModelAttribute BoardVo boardVo, Model model) {
		List<BoardVo> boardView = boardService.boardView(boardVo);
		model.addAttribute("boardView", boardView);
		return "board/modify";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(@ModelAttribute BoardVo boardVo) {
		System.out.println("[BoardController IN] >> edit" + boardVo.toString());

		boardService.edit(boardVo);
		System.out.println("[BoardController OUT] >> edit" + boardVo.toString());
//		return "redirect:/board/view";
		return "redirect:/board/list";
	}
	
	
}
