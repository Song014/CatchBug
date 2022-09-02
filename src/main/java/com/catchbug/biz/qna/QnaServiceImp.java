package com.catchbug.biz.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.QnaVO;

@Service
public class QnaServiceImp implements QnaService {

	@Autowired
	private QnaDAO dao;
	
	@Override
	public List<QnaVO> getQnaList() {
		System.out.println("서비");
		return dao.getQnaList();
	}

	@Override
	public void insertQna(QnaVO vo) {
		
		dao.insertQna(vo);
	}

}
