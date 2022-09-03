package com.catchbug.biz.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.PageVO;
import com.catchbug.biz.vo.QnaVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<QnaVO> getQnaList(PageVO vo) {
		System.out.println("다오");
		return mybatis.selectList("QnaMapper.selectList",vo);
	}

	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaMapper.insertQna",vo);
	}

	public QnaVO getQnaDetail(QnaVO vo) {
		mybatis.update("QnaMapper.updateQnaCnt",vo);
		return mybatis.selectOne("QnaMapper.selectOne",vo);
	}

	public void deleteQna(QnaVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("QnaMapper.deleteQna",vo);
	}

	public void updateQna(QnaVO vo) {

		mybatis.update("QnaMapper.updateQna",vo);
	}

	public int getTotal() {
		
		return mybatis.selectOne("QnaMapper.getTotal");
	}
	
	
}
