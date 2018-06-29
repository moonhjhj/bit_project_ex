package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.CommentService;
import com.javaex.vo.CommentVo;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/write")
	public String write(Model model, @ModelAttribute CommentVo commentVo) {
		
		commentService.write(commentVo);
		return "board/view";
		
	}
	
	@RequestMapping(value = "commentView")
	public String commentView(Model model, @RequestParam("no") int no) {
		List<CommentVo> commentList = commentService.commentView(no);
		model.addAttribute("commentList", commentList);
		return "board/view";
	}

}
