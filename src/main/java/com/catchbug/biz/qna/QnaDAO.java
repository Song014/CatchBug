package com.catchbug.biz.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.QnaVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<QnaVO> getQnaList() {
		System.out.println("다오");
		return mybatis.selectList("QnaMapper.selectList");
	}

	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaMapper.insertQna",vo);
	}
	
	
}
