package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private int product_no;
	private int sub_category;
	private int price;
	private String product_name;
	private String product_img;
	private String brand;
	private Date add_day;
	private String uuid;
}
