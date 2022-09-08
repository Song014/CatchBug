package com.catchbug.biz.img;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.ImgVO;

@Service
public class ImgServiceImp implements ImgService{
	
	@Autowired
	private ImgDAO dao;
	
	@Override
	public void insertImg(ImgVO ivo) {
		dao.insertImg(ivo);
	}

}
