package com.catchbug.biz.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItemVO {

	// 프론트에서 받을값
	
	private int product_no;
	private int purchase_amount;

	// DB에서 꺼내올 값
	private int detail_no;
	private String product_name;
	private int price;

	// 필요해서 생성
	private String order_no;
	private int total;

	public void initTotal() {
		this.total = this.price * this.purchase_amount;
	}
}
