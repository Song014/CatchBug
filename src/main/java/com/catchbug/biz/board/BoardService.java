package com.catchbug.biz.board;

import java.util.List;

import com.catchbug.biz.vo.BoardReplyVO;
import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.NotiVO;
import com.catchbug.biz.vo.TapVO;

public interface BoardService {

	public List<NotiVO> get_Noti_list(Criteria cri);
	public void insert_noti(NotiVO vo);
	public NotiVO detail_noti(NotiVO vo);
	public void noti_cnt_Count(NotiVO vo);
	public void update_noti(NotiVO vo);
	public void noti_delete(NotiVO vo);
	public void freeBoardWrite(BoardVO vo);
	public List<BoardVO> getFreeBoard(BoardVO vo);
	public List<TapVO> getFreeBoardTap();

	public int getTotalBoard(BoardVO vo);
	public BoardVO GetFreeBoardDetail(BoardVO vo);
	public void DeteleFreeBoard(BoardVO vo);
	public void UpdateFreeBoard(BoardVO vo);
	public void FreeBoardCnt(BoardVO vo);
	public void WriteBoardReply(BoardReplyVO vo);
	public List<BoardReplyVO> getFreeBoardReply(BoardReplyVO vo);
	public void DeleteBoardReply(BoardReplyVO vo);
	public void UpdateBoardReply(BoardReplyVO vo);

	public int getTotalBoard();
	public int listCount(Criteria cri);
		

}
