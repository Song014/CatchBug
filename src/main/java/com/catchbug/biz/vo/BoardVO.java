package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_no,tap,cnt;
	private String id,title,content;
	private Date created_day;
	
	

}
