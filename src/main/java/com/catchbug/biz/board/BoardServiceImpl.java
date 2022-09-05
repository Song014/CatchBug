package com.catchbug.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.BoardReplyVO;
import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.NotiVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	//공지 리스트
	@Override
	public List<NotiVO> get_Noti_list(Criteria cri) {
		System.out.println("Noti_list 서비스");
		System.out.println("cri ::: " + cri.toString());
	
		return boardDAO.get_Noti_list(cri);
	}
	
	//공지 쓰기
	@Override
	public void insert_noti(NotiVO vo) {
		System.out.println("Noti_Insert 서비스");
	
		boardDAO.insert_noti(vo);
	}
	
	//공지 상세보기
	@Override
	public NotiVO detail_noti(NotiVO vo) {
		System.out.println("Noti_detail 서비스");
		return boardDAO.detail_noti(vo);
	}
	
	// 조회수 증가
	public void noti_cnt_Count(NotiVO vo) {
		System.out.println("Noti_count 서비스");
		boardDAO.noti_cnt_Count(vo);
	}
	
	//공지사항 업데이트
	@Override
	public void update_noti(NotiVO vo) {
		System.out.println("공지사항 업데이트 서비스 ");
		boardDAO.update_noti(vo);
	}

	@Override
	public void noti_delete(NotiVO vo) {
		
		boardDAO.noti_delete(vo);
	}
	
	
	//자유게시판 글쓰기 폼
	@Override
	public void freeBoardWrite(BoardVO vo) {
		boardDAO.FreeBoardWrite(vo);

	}

	//자유게시판 가져오기폼
	@Override
	public List<BoardVO> getFreeBoard(BoardVO vo) {
		return boardDAO.GetFreeBoard(vo);
	}

	@Override
	public int getTotalBoard(BoardVO vo) {
		return boardDAO.getTotal(vo);
	}

	//자유게시판 상세정보 가져오기
	@Override
	public BoardVO GetFreeBoardDetail(BoardVO vo) {
		return boardDAO.GetFreeBoardDetail(vo);
	}

	//자유게시판 글삭제 메소드
	@Override
	public void DeteleFreeBoard(BoardVO vo) {
		boardDAO.DeleteFreeBoard(vo);	
	}

	//자유게시판 글업데이트 메소드
	@Override
	public void UpdateFreeBoard(BoardVO vo) {
		boardDAO.UpdateFreeBoard(vo);
	}

	//자유게시판 조회수 증가
	@Override
	public void FreeBoardCnt(BoardVO vo) {
		boardDAO.freeBoardCnt(vo);
		
	}

	
	//자유게시판 댓글작성
	@Override
	public void WriteBoardReply(BoardReplyVO vo) {
		boardDAO.WriteBoardReply(vo);
	}

	//자유게시판 댓글정보 가져오기
	@Override
	public List<BoardReplyVO> getFreeBoardReply(BoardReplyVO vo) {
		return boardDAO.getFreeBoardReply(vo);
	}

	//자유게시판 댓글삭제
	@Override
	public void DeleteBoardReply(BoardReplyVO vo) {
		boardDAO.DeleteBoardReply(vo);
		
	}

	//자유게시판 댓글 수정
	@Override
	public void UpdateBoardReply(BoardReplyVO vo) {
		boardDAO.UpdateBoardReply(vo);
		
	}
	//공지 검색
	@Override
	public List<NotiVO> SearchNoti(NotiVO vo) {
		System.out.println("공지사항 검색 서비스");
		return boardDAO.SearchNoti(vo);
	}

	@Override
	public int listCount() {
		int count = boardDAO.listCount();
		return count;
	}

	@Override
	public int listSearchCount(NotiVO vo) {
		int count = boardDAO.listSearchCount(vo);
		return count;
	}

	@Override
	public int getTotalBoard() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	

}
