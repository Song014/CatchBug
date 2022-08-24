package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no,product_no,purchase_amount;
	private String id;
	
	// resultMap 사용세팅
	private ProductVO product;
	private MemberVO member;
}
