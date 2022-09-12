package com.catchbug.biz.board;

import com.catchbug.biz.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/notice_Board_Write.do")
	public String NoticeBoardWrite() {
		return "board/notice_board_write";
	}

	// 자유게시판 이동
	@RequestMapping("/freeBoard.do")
	public String GetFreeBoard(SearchVO vo, Model model, int page) {
		BoardVO bVo = new BoardVO();

		int searchTap = vo.getSearchTap();
		String keyWord = vo.getSearchWord();
		if (searchTap == 1) {
			bVo.setTitle("");
			bVo.setBusiness_name(keyWord);
		} else if (searchTap == 2) {
			bVo.setTitle(keyWord);
			bVo.setBusiness_name("");
		} else {
			bVo.setBusiness_name("");
			bVo.setTitle("");
		}

		int sum = boardService.getTotalBoard(bVo); // 불러온 총 데이터량

		// 총갯수가 300개고 페이지가 10페이지라면
		int pageCount = 10; // 한페이지에 표시할 글 갯수

		// 9 * 20 + 1 181번부터 200번까지 표시
		int startPage = (page - 1) * pageCount + 1; // 시작 글번호
		int endPage = page * pageCount; // 마지막으로 불러올 글번호

		// 페이지가 10페이지라면 표시할 페이지번호
		int startPageNum = page - 5;
		if (startPageNum <= 0) {
			startPageNum = 1; // 최소페이지는 1페이지부터
		}
		int endPageNum = page + 5;// 최대 페이지는 현재페이지 +5 까지
		if ((sum / pageCount) < endPageNum) { // 최대 표시할페이지가 갯수보타 넘치게 될경우 방지.
			if ((sum % pageCount) == 0) { // 나머지가 없을경우
				endPageNum = sum / pageCount;
			} else {
				endPageNum = sum / pageCount + 1; // 나머지가 있을경우
			}

		}

		if (page == 0) {
			page = 1;
		}

		if (sum % pageCount == 0) {
			sum = sum / pageCount;
		} else {
			sum = sum / pageCount + 1;
		}

		bVo.setStartPage(startPage);
		bVo.setEndPage(endPage);

		model.addAttribute("tap", boardService.getFreeBoardTap());
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("searchTap", searchTap);
		model.addAttribute("boardList", boardService.getFreeBoard(bVo));
		model.addAttribute("totalBoard", sum);
		model.addAttribute("page", page); // 현재 페이지 정보를 전달
		model.addAttribute("startPage", startPageNum); // 시작 페이지 정보를 전달
		model.addAttribute("endPage", endPageNum); // 끝 페이지 정보를 전달
		return "board/free_board";
	}

	// 자유게시판 상세보기 이동
	@RequestMapping("/freeBoardDetail.do")
	public String FreeBoardDetail(int board_no, Model model) {
		BoardVO vo = new BoardVO();
		BoardReplyVO rVo = new BoardReplyVO();

		rVo.setBoard_no(board_no);
		vo.setBoard_no(board_no);
		boardService.FreeBoardCnt(vo); // 게시판 조회수 카운트
		model.addAttribute("board", boardService.GetFreeBoardDetail(vo));
		model.addAttribute("reply", boardService.getFreeBoardReply(rVo));
		return "board/free_board_detail";
	}

	// 자유게시판 댓글작성폼
	@RequestMapping("/writeFreeBoardReply.do")
	public String FreeBoardDetail(BoardReplyVO vo) {
		boardService.WriteBoardReply(vo);
		return "redirect:freeBoardDetail.do?board_no=" + vo.getBoard_no();
	}

	// 자유게시판 글 삭제
	@RequestMapping("/deleteFreeBoard.do")
	public String DeleteFreeBoard(int board_no) {
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		boardService.DeteleFreeBoard(vo);
		return "redirect:freeBoard.do?page=1";

	}

	// 자유게시판 수정폼 이동
	@RequestMapping("updateFreeBoard.do")
	public String UpdateFreeBoard(int board_no, Model model) {
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		model.addAttribute("board", boardService.GetFreeBoardDetail(vo));
		return "board/free_board_update";
	}

	// 자유게시판 수정 진행
	@PostMapping("updateFreeBoard.do")
	public String FreeBoardUpdate(BoardVO vo) {
		boardService.UpdateFreeBoard(vo);
		return "redirect:freeBoard.do?page=1";
	}

	// 자유게시판 글쓰기 폼 이동
	@RequestMapping("/free_Board_Write.do")
	public String FreeBoardWrite(Model model) {
		model.addAttribute("tap", boardService.getFreeBoardTap());
		return "board/free_board_write";
	}

	// 자유게시판 글쓰기
	@PostMapping("/writeFreeBoard.do")
	public String FreeBoardWriteAction(BoardVO vo) {
		boardService.freeBoardWrite(vo);
		return "redirect:freeBoard.do?page=1";
	}

	// 자유게시판 댓글 삭제 작동
	@RequestMapping("/deleteBoardReply.do")
	public String DeleteFreeBoardReply(int reply_no, String board_no) {
		BoardReplyVO vo = new BoardReplyVO();
		vo.setReply_no(reply_no);
		boardService.DeleteBoardReply(vo);
		return "redirect:freeBoardDetail.do?board_no=" + board_no;
	}

	// 자유게시판 댓글 수정 작동
	@RequestMapping("/updateBoardReply.do")
	public String UpdateFreeBoardReply(int reply_no, String reply_text, String board_no) {
		BoardReplyVO vo = new BoardReplyVO();
		vo.setReply_text(reply_text);
		vo.setReply_no(reply_no);
		boardService.UpdateBoardReply(vo);
		return "redirect:freeBoardDetail.do?board_no=" + board_no;
	}

	@RequestMapping("/FAQBoard.do")
	public String FAQBoard() {
		return "board/faq_board";
	}

	//공지 리스트
	@RequestMapping("/notice_Board.do")
	public String notice_Board_list(@ModelAttribute("cri") Criteria cri, Model model, NotiVO vo) {
		
		List<NotiVO> list = boardService.get_Noti_list(cri);
		
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(boardService.listCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("searchName", cri.getSearchName());
		
		return "board/notice_board";
	}

	// 공지 쓰기
	@RequestMapping("insertNoti.do")
	public String insert_noti(NotiVO vo) {
		boardService.insert_noti(vo);
		return "redirect:notice_Board.do";
	}

	// 공지 상세보기 + 조회수 증가
	@RequestMapping("noti_detail.do")
	public String noti_detail(NotiVO vo, Model model) {

		// 조회수
		boardService.noti_cnt_Count(vo);
		// 상세보기
		NotiVO noti = boardService.detail_noti(vo);
		model.addAttribute("notiInfo", noti);
		return "board/notice_board_detail";
	}
	
	// 공지 수정폼
	@RequestMapping("noti_updateForm.do")
	public String noti_dupdate_Form(NotiVO vo, Model model) {
		NotiVO noti = boardService.detail_noti(vo);
		model.addAttribute("notiInfo", noti);
		return "board/notice_board_update";
	}

	// 공지사항 업데이트
	@RequestMapping("updateNoti.do")
	public String noti_update(NotiVO vo) {
		boardService.update_noti(vo);

		return "redirect:notice_Board.do";
	}

	// 공지사항 삭제
	@RequestMapping("delete_noti.do")
	public String noti_delete(NotiVO vo) {
		boardService.noti_delete(vo);

		return "redirect:notice_Board.do";
	}

}
