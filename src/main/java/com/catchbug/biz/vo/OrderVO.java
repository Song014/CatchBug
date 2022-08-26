package com.catchbug.biz.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	private int order_no;
	private int total_price;
	private int order_status;
	private Date processing_day;
	private String shipping_address;
	private String note;
	
	private List<CartVO> cart;
	
}
