package com.catchbug.biz.qna;

import java.util.List;

import com.catchbug.biz.vo.QnaVO;

public interface QnaService {

	List<QnaVO> getQnaList();

	void insertQna(QnaVO vo);

}
