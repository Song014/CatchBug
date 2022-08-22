package com.catchbug.biz.view.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.catchbug.biz.vo.ProductVO;

@RestController
public class TestRestController {

	
	@GetMapping("/test.do")
	public ProductVO home(@RequestParam("category")String category) {
		ProductVO vo = null;
		if(category.equals("CPU")) {
			vo = new ProductVO();
			vo.setProduct_no(220801);
			vo.setCategory_no2(1);
			vo.setPrice(9999);
			vo.setQuantity(50);
			vo.setProduct_name("에스케이하닉스");
			vo.setImage("이미지");
			vo.setAdd_day(20220822);
			System.out.println(vo);
		} else if(category.equals("VGA")){
			vo = new ProductVO();
			vo.setProduct_no(220731);
			vo.setCategory_no2(2);
			vo.setPrice(6666);
			vo.setQuantity(23);
			vo.setProduct_name("더블비얀코");
			vo.setImage("이미지");
			vo.setAdd_day(20220823);
			System.out.println(vo);
		}
		return vo;
	}
}
