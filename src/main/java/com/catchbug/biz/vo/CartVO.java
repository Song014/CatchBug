package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no,product_no,sub_category,purchase_amount;
	private String id;
}
