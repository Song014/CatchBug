package com.catchbug.biz.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchbug.biz.vo.QnaVO;

@Controller
public class QnaController {
	// TODO 생성O 조회O 수정 삭제 
	
	@Autowired
	private QnaService qs;
	
	@RequestMapping("/QnABoard.do")
	public String QnABoard(Model model) {
		
		model.addAttribute("qna_list",qs.getQnaList()); 
		
		return "board/qna_board";
	}

	@RequestMapping("/QnA_Board_Write.do")
	public String QnABoardWrite() {
		return "board/qna_board_write";
	}
	
	@RequestMapping("qna/write.do")
	public String write(QnaVO vo) {
		System.out.println(vo);
		qs.insertQna(vo);
		
		return "redirect:/QnABoard.do";
	}
	
}
