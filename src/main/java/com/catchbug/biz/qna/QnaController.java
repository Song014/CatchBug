package com.catchbug.biz.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.common.Paging;
import com.catchbug.biz.vo.PageVO;
import com.catchbug.biz.vo.QnaReplyVO;
import com.catchbug.biz.vo.QnaVO;
import com.catchbug.biz.vo.SearchVO;

@Controller
public class QnaController {
	// TODO 생성O 조회O 수정 삭제

	@Autowired
	private QnaService qs;

	@RequestMapping("/QnABoard.do")
	public String QnABoard(Model model, PageVO vo,SearchVO svo) {

		// 페이징시 검색 값 넣어주고
		if(svo.getSearchWord()!=null) {
			if(svo.getSearchTap()==1) {
				vo.setId(svo.getSearchWord());
			} else if(svo.getSearchTap()==2) {
				vo.setTitle(svo.getSearchWord());
			}
		}
		Paging paging = new Paging(10, qs.getTotalBoard(vo));
		
		PageVO page = paging.getPaging(vo.getPage());
		page.setId(vo.getId());
		page.setTitle(vo.getTitle());
		
		System.out.println(page);
		model.addAttribute("qna_list", qs.getQnaList(page));
		
		
		model.addAttribute("page", page);
		System.out.println(page+"asd");

		return "board/qna_board";
	}

	@RequestMapping("/QnABoardDetail.do")
	public String QnABoardDetail(QnaVO vo, QnaReplyVO rVo, Model model) {
		System.out.println(vo + "=======");
		model.addAttribute("qna", qs.getQnaDetail(vo));
		model.addAttribute("reply", qs.getQnaReply(rVo));
		return "board/qna_board_detail";
	}

	@RequestMapping("/updateQnA.do")
	public String updateQnA(QnaVO vo, Model model) {
		model.addAttribute("board", qs.getQnaDetail(vo));

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

	// 질문게시판 글쓰기
	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.POST)
	public String write(QnaVO vo) {
		System.out.println(vo);
		qs.insertQna(vo);

		return "redirect:/QnABoard.do?page=1";
	}

	// 질문게시판 댓글작성폼
	@RequestMapping("/writeQnaReply.do")
	public String writeQnaReply(QnaReplyVO vo) {
		qs.WriteQnaReply(vo);
		return "redirect:QnABoardDetail.do?qna_no=" + vo.getQna_no();
	}

	// 질문게시판 댓글 삭제 작동
	@RequestMapping("/deleteQnaReply.do")
	public String deleteQnaReply(QnaReplyVO vo) {
		System.out.println(vo);
		qs.DeleteQnaReply(vo);
		return "redirect:QnABoardDetail.do?qna_no=" + vo.getQna_no();
	}

	// 질문게시판 댓글 수정 작동
	@RequestMapping("/updateQnaReply.do")
	public String updateQnaReply(QnaReplyVO vo) {
		qs.UpdateQnaReply(vo);
		return "redirect:QnABoardDetail.do?qna_no=" + vo.getQna_no();
	}

}
