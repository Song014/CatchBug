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
	// 컨트롤러에서 생성할 값
	private String order_no;

	// 프론트에서 받을 값
	private String id;
	private String shipping_address;

	// db
	private int order_status;
	private Date processing_day;
	private String note;

	private int total_price;

	private List<OrderItemVO> orders;
	
	public void initTotal() {
		for (OrderItemVO orderItemVO : orders) {
			this.total_price += orderItemVO.getTotal();
		}
	}
}
