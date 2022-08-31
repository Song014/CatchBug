package com.catchbug.biz.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchbug.biz.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/* 게시판 */
	@RequestMapping("/notice_Board.do")
	public String NoticeBoard() {
		return "board/notice_board";
	}
	
	@RequestMapping("/notice_Board_Write.do")
	public String NoticeBoardWrite() {
		return "board/notice_board_write";
	}
	
	@RequestMapping("/freeBoard.do")
	public String FreeBoard() {
		return "board/free_board";
	}
	
	@RequestMapping("/free_Board_Write.do")
	public String FreeBoardWrite() {
		return "board/free_board_write";
	}
	
	//자유게시판 글쓰기 처리컨트롤러
	@PostMapping("/writeFreeBoard.do")
	public String FreeBoardWriteAction(BoardVO vo) {
		boardService.freeBoardWrite(vo);
		return "redirect:freeBoard.do";
	}
	
	@RequestMapping("/QnABoard.do")
	public String QnABoard() {
		return "board/qna_board";
	}
	
	@RequestMapping("/QnA_Board_Write.do")
	public String QnABoardWrite() {
		return "board/qna_board_write";
	}
	
	@RequestMapping("/FAQBoard.do")
	public String FAQBoard() {
		return "board/faq_board";
	}
	@RequestMapping("/ViewChat.do")
	public String ViewBoard() {
		return "board/chat";
	}
	

}
