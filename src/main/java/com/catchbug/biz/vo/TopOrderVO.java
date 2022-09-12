package com.catchbug.biz.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TopOrderVO {

	private String uuid;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date add_day;
	private String product_name;
	private int price;
	private int purchase_amount;
	
	
	private int total;
	
	public void initTotal() {
		this.total = this.price * this.purchase_amount;
	}
	
}
