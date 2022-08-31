package com.catchbug.biz.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDao;
	
	@Override
	public void freeBoardWrite(BoardVO vo) {
		bDao.FreeBoardWrite(vo);

	}

}
