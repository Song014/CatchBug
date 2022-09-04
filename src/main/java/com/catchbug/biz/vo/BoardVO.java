package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_no,tap,cnt,rn,startPage,endPage;
	private String id,title,content,business_name;
	private Date created_day;
}
