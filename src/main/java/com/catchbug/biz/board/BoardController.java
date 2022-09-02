package com.catchbug.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.NotiVO;
import com.catchbug.biz.vo.SearchVO;

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
	public String GetFreeBoard(SearchVO vo, Model model,int page) {
		
		int sum = boardService.getTotalBoard(); //불러온 총 데이터량

		//총갯수가 300개고 페이지가 10페이지라면
		int pageCount = 20; //한페이지에 표시할 글 갯수
		
		// 9 * 20 + 1 181번부터 200번까지 표시
		int startPage = (page - 1) * pageCount + 1; //시작 글번호
		int endPage = page * pageCount; //마지막으로 불러올 글번호
		
		//페이지가 10페이지라면 표시할 페이지번호
		int startPageNum = page - 5;
		if(startPageNum <=0) {
			startPageNum = 1; //최소페이지는 1페이지부터
		}
		int endPageNum = page + 5;
		if((sum/pageCount) < endPageNum) { //최대 표시할페이지가 갯수보타 넘치게 될경우 방지.
			if((sum%pageCount) == 0) { //나머지가 없을경우
				endPageNum = sum/pageCount;
			}else {
				endPageNum = sum/pageCount + 1; //나머지가 있을경우
			}
			
		}
		
		if(page == 0) {
			page = 1;
		}
		
		if(sum%pageCount == 0) {
			sum = sum/pageCount;
		}else {
			sum = sum/pageCount + 1;
		}

		BoardVO bVo = new BoardVO();
		
		bVo.setStartPage(startPage);
		bVo.setEndPage(endPage);

		
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
		System.out.println("page>"+page);
		System.out.println("startpage>"+startPageNum);
		System.out.println("endpage>"+endPageNum);
		model.addAttribute("boardList", boardService.getFreeBoard(bVo));
		model.addAttribute("totalBoard",sum);
		model.addAttribute("page",page); //현재 페이지 정보를 전달
		model.addAttribute("startPage", startPageNum); //시작 페이지 정보를 전달
		model.addAttribute("endPage", endPageNum); //끝 페이지 정보를 전달
		return "board/free_board";
	}
	
	//자유게시판 상세보기 이동
	@RequestMapping("/freeBoardDetail.do")
	public String FreeBoardDetail(int board_no,Model model) {
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		boardService.FreeBoardCnt(vo);
		model.addAttribute("board",boardService.GetFreeBoardDetail(vo));
		return "board/free_board_detail";
	}
	
	//자유게시판 글 삭제
	@RequestMapping("/deleteFreeBoard.do")
	public String DeleteFreeBoard(int board_no) {
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		boardService.DeteleFreeBoard(vo);
		return "redirect:freeBoard.do?page=1";
		
	}
	
	//자유게시판 수정폼 이동
	@RequestMapping("updateFreeBoard.do")
	public String UpdateFreeBoard(int board_no,Model model) {
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		model.addAttribute("board", boardService.GetFreeBoardDetail(vo));
		return "board/free_board_update";
	}
	
	//자유게시판 수정 진행
	@PostMapping("updateFreeBoard.do")
	public String FreeBoardUpdate(BoardVO vo) {
		boardService.UpdateFreeBoard(vo);
		return "redirect:freeBoard.do?page=1";
	}

	
	//자유게시판 글쓰기 폼 이동
	@RequestMapping("/free_Board_Write.do")
	public String FreeBoardWrite() {
		return "board/free_board_write";
	}

	// 자유게시판 글쓰기
	@PostMapping("/writeFreeBoard.do")
	public String FreeBoardWriteAction(BoardVO vo) {
		boardService.freeBoardWrite(vo);
		return "redirect:freeBoard.do?page=1";
	}

	

	@RequestMapping("/FAQBoard.do")
	public String FAQBoard() {
		return "board/faq_board";
	}

	@RequestMapping("/ViewChat.do")
	public String ViewBoard() {
		return "board/chat";
	}

	//공지 리스트

	@RequestMapping("/notice_Board.do")
	public String notice_Board_list(Model model, NotiVO vo) {
		System.out.println("boardController");
		List<NotiVO> list = boardService.get_Noti_list();
		model.addAttribute("list", list);
		return "board/notice_board";
	}

	// 공지 쓰기
	@RequestMapping("insertNoti.do")
	public String insert_noti(NotiVO vo) {
		System.out.println("공지 컨트롤러");
		System.out.println(vo.toString());
		boardService.insert_noti(vo);
		return "redirect:notice_Board.do";
	}

	// 공지 상세보기 + 조회수 증가
	@RequestMapping("noti_detail.do")
	public String noti_detail(NotiVO vo, Model model) {
		System.out.println("Noti_detail 컨트롤러");

		// 조회수
		boardService.noti_cnt_Count(vo);
		// 상세보기
		NotiVO noti = boardService.detail_noti(vo);
		model.addAttribute("notiInfo", noti);
		return "board/notice_board_detail";
	}

	// 공지사항 업데이트
	@RequestMapping("updateNoti.do")
	public String noti_update(NotiVO vo) {
		System.out.println("Noti_update 컨트롤러");
		boardService.update_noti(vo);

		return "redirect:notice_Board.do";
	}

	// 공지사항 삭제
	@RequestMapping("delete_noti.do")
	public String noti_delete(NotiVO vo) {
		System.out.println("공지사항 삭제");
		boardService.noti_delete(vo);

		return "redirect:notice_Board.do";
	}

}
