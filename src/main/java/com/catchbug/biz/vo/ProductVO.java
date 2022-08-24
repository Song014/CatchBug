package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int product_no,category_no2,price,quantity;
	private String product_name, product_img;
	private Date add_day;
}
