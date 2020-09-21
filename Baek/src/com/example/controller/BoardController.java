package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bean.ContentBean;
import com.example.bean.PageBean;
import com.example.bean.UserBean;
import com.example.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	Date now;
	
	// 게시판 이동
	@GetMapping("/community")
	public String community(@RequestParam(value="board_info_idx", required=false) int board_info_idx,
				Model model,
				@RequestParam(value = "page", defaultValue = "1") int page ) throws Exception {
		 
		
		model.addAttribute("board_info_idx",board_info_idx);
		
		String boardInfoName = boardService.getBoardInfoName(board_info_idx);
		model.addAttribute("boardInfoName",boardInfoName);
		
		List<ContentBean> contentList = boardService.getContentList(board_info_idx,page);
		model.addAttribute("contentList",contentList);
		
		PageBean pageBean = boardService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean",pageBean);
		
		return "board/main";
	}
	
	// 글 작성 
	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") ContentBean writeContentBean,
								@RequestParam("board_info_idx") int board_info_idx) {
		
		SimpleDateFormat asd = new SimpleDateFormat("yyyy-MM-dd");
		String str1 = asd.format(now);
		
		writeContentBean.setContent_date(str1);
		writeContentBean.setContent_board_idx(board_info_idx);
		
		return "board/write";
	}
	
	// 글 작성 데이터 이동
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") ContentBean writeContentBean,BindingResult result,
			@RequestParam("content_board_idx") int board_info_idx,
			Model model)
			{
		
		if(result.hasErrors()) {
			return "board/write";
		}
		
		model.addAttribute("content_board_idx",board_info_idx);
		
		boardService.addContentInfo(writeContentBean);
		
		return "board/write_success";
	}
	
	// 글 읽기
	@GetMapping("/read")
	public String read(@RequestParam("board_info_idx") int board_info_idx,
										@RequestParam("content_idx") int content_idx,
										Model model) {
		
		model.addAttribute("board_info_idx",board_info_idx);
		model.addAttribute("content_idx",content_idx);
		
		ContentBean readContentBean = boardService.getContentInfo(content_idx);
		model.addAttribute("readContentBean",readContentBean);
		
		model.addAttribute("loginUserBean",loginUserBean);
		
		return "board/read";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}
	
	
	// 글 수정
	@GetMapping("/modify")
	public String modify(@RequestParam("board_info_idx")int board_info_idx,
											@RequestParam("content_idx") int content_idx,
											Model model,
											@ModelAttribute("modifyContentBean") ContentBean modifyContentBean) {
		
		model.addAttribute("board_info_idx",board_info_idx);
		model.addAttribute("content_idx",content_idx);
		
		ContentBean tempContentBean = boardService.getContentInfo(content_idx);
		
		modifyContentBean.setContent_writer_name(tempContentBean.getContent_writer_name());
	
		modifyContentBean.setContent_subject(tempContentBean.getContent_subject());
		modifyContentBean.setContent_text(tempContentBean.getContent_text());
		modifyContentBean.setContent_file(tempContentBean.getContent_file());
		modifyContentBean.setContent_writer_idx(tempContentBean.getContent_writer_idx());
		modifyContentBean.setContent_board_idx(board_info_idx);
		modifyContentBean.setContent_idx(content_idx);
		
		
		return "board/modify";
	}
	
	// 수정 데이터 
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") ContentBean modifyContentBean,BindingResult result) {
		
		if(result.hasErrors()) {
			return "board/modify";
		}
		
		boardService.modifyContentInfo(modifyContentBean);
		
		return "board/modify_success";
	}
	
	// 글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("board_info_idx") int board_info_idx,
											@RequestParam("content_idx") int content_idx,
											Model model) {
		
		boardService.deleteContentInfo(content_idx);
		
		model.addAttribute("board_info_idx",board_info_idx);
		model.addAttribute("content_idx",content_idx);
		
		return "board/delete";
		
	}
	
	@GetMapping("/about")
	public String about() {
		return "board/about";
	}
	
}
