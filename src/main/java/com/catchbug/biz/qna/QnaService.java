package com.catchbug.biz.qna;

import java.util.List;

import com.catchbug.biz.vo.PageVO;
import com.catchbug.biz.vo.QnaVO;

public interface QnaService {

	List<QnaVO> getQnaList(PageVO vo);

	void insertQna(QnaVO vo);

	QnaVO getQnaDetail(QnaVO vo);

	void deleteQna(QnaVO vo);

	void updateQna(QnaVO vo);

	int getTotalBoard();

}
