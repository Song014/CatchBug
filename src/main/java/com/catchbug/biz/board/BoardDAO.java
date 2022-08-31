package com.catchbug.biz.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//자유게시판 글쓰기 등록
	public void FreeBoardWrite(BoardVO vo) {
		mybatis.insert("BoardMapper.freeBoardWrite",vo);
	}
}
