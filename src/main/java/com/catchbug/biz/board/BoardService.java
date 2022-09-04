package com.catchbug.biz.board;

import java.util.List;

import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.NotiVO;

public interface BoardService {

	public List<NotiVO> get_Noti_list(Criteria cri);
	public void insert_noti(NotiVO vo);
	public NotiVO detail_noti(NotiVO vo);
	public void noti_cnt_Count(NotiVO vo);
	public void update_noti(NotiVO vo);
	public void noti_delete(NotiVO vo);
	public void freeBoardWrite(BoardVO vo);
	public List<BoardVO> getFreeBoard(BoardVO vo);
	public int getTotalBoard();
	public List<NotiVO> SearchNoti(NotiVO vo);
	public int listSearchCount(NotiVO vo);
	public int listCount();
		
}
