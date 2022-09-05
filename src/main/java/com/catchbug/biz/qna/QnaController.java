package com.catchbug.biz.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.common.Paging;
import com.catchbug.biz.vo.PageVO;
import com.catchbug.biz.vo.QnaVO;

@Controller
public class QnaController {
	// TODO 생성O 조회O 수정 삭제 
	
	@Autowired
	private QnaService qs;
	
	@RequestMapping("/QnABoard.do")
	public String QnABoard(Model model, PageVO vo) {
		// 보여줄 페이지수, 전체 게시글수
		Paging paging = new Paging(10,qs.getTotalBoard());
		
		PageVO page = paging.getPaging(vo.getPage());
		System.out.println(qs.getQnaList(page));
		model.addAttribute("qna_list",qs.getQnaList(page)); 
		model.addAttribute("page",page);
		
		return "board/qna_board";
	}
	
	@RequestMapping("/QnABoardDetail.do")
	public String QnABoardDetail(QnaVO vo,Model model) {
		System.out.println(vo+"=======");
		model.addAttribute("board",qs.getQnaDetail(vo)); 
		
		return "board/qna_board_detail";
	}
	
	@RequestMapping("/updateQnA.do")
	public String updateQnA(QnaVO vo,Model model) {
		model.addAttribute("board",qs.getQnaDetail(vo));
	
		return "board/qna_board_update";
	}
	@RequestMapping(value = "/updateQnA.do", method = RequestMethod.POST)
	public String updateQnA(QnaVO vo) {
		System.out.println(vo);
		qs.updateQna(vo);
		return "redirect:QnABoard.do?page=1";
	}
	
	
	@RequestMapping("/deleteQnA.do")
	public String deleteQnA(QnaVO vo) {
		qs.deleteQna(vo);
		return "redirect:QnABoard.do?page=1";
	}

	@RequestMapping("/QnA_Board_Write.do")
	public String QnABoardWrite() {
		return "board/qna_board_write";
	}
	
	@RequestMapping(value = "/qnaWrite.do",  method = RequestMethod.POST)
	public String write(QnaVO vo) {
		System.out.println(vo);
		qs.insertQna(vo);
		
		return "redirect:/QnABoard.do?page=1";
	}
	
	
	
}