package com.catchbug.biz.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

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

	// 채팅방 페이지 이동 컨트롤러
	@RequestMapping("/chatBoard.do")
	public String ViewBoard() {
		return "board/chatBoard";
	}

}
