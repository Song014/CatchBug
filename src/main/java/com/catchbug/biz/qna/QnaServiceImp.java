package com.catchbug.biz.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.PageVO;
import com.catchbug.biz.vo.QnaReplyVO;
import com.catchbug.biz.vo.QnaVO;

@Service
public class QnaServiceImp implements QnaService {

	@Autowired
	private QnaDAO dao;
	
	@Override
	public List<QnaVO> getQnaList(PageVO vo) {
		System.out.println("서비");
		return dao.getQnaList(vo);
	}

	@Override
	public void insertQna(QnaVO vo) {
		
		dao.insertQna(vo);
	}

	@Override
	public QnaVO getQnaDetail(QnaVO vo) {
		return dao.getQnaDetail(vo);
	}

	@Override
	public void deleteQna(QnaVO vo) {
		dao.deleteQna(vo);
	}

	@Override
	public void updateQna(QnaVO vo) {
		dao.updateQna(vo);
		
	}

	@Override
	public int getTotalBoard() {
		return dao.getTotal();
	}

	@Override
	public void WriteQnaReply(QnaReplyVO vo) {
		dao.WriteQnaReply(vo);
	}

	@Override
	public List<QnaReplyVO> getQnaReply(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.getQnaReply(vo);
	}

	@Override
	public void DeleteQnaReply(QnaReplyVO vo) {
		dao.DeleteQnaReply(vo);
	}

	@Override
	public void UpdateQnaReply(QnaReplyVO vo) {
		dao.UpdateQnaReply(vo);
	}

}
