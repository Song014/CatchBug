package com.catchbug.biz.img;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.ImgVO;

@Repository
public class ImgDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertImg(ImgVO ivo) {
		mybatis.insert("ImgMapper.insertImg",ivo);
	}

}
