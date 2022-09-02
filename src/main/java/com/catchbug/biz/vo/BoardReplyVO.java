package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyVO {
	private int reply_no,board_no;
	private String reply_text,id,ceo;
	private Date reply_day;

}
