package com.catchbug.biz.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderVO {
	// 컨트롤러에서 생성할 값
	private String order_no;

	// 프론트에서 받을 값
	private String id;
	private String shipping_address;
	private String ceo;
	// db
	private int order_status;
	@DateTimeFormat(pattern ="yy/mm/dd")
	private Date processing_day;
	private String note;

	private int total_price;

	
	//bj
	private int product_quantily;
	private String product_name;
		private String tprice; // 장바구니에 담긴 총가격

	private List<OrderItemVO> orders;
	
	private int detail_no ; // 장바구니 번호
	private int product_no; // 상품번호
	private int purchase_amount;  //구입수량
	
	public void initTotal() {
		for (OrderItemVO orderItemVO : orders) {
			this.total_price += orderItemVO.getTotal();
		}
	}
	
}
