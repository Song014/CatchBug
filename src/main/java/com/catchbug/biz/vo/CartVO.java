package com.catchbug.biz.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	//프론트에서 받을 값
	private int product_no;
	private int purchase_amount;
	
	private String id;
	private int cart_no;
	
	// product
	
	private String product_name;
	private int price;
	
	// 필요해서 생성
	private int total;
	
	public void initTotal() {
		this.total = this.price*this.purchase_amount;
	}
}
