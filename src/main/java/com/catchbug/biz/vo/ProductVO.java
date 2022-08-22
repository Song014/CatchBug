package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int product_no,category_no2,price,quantity;
	private String product_name, image;
	private int add_day;
}
