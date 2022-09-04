package com.catchbug.biz.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardReplyVO {
	private int reply_no,board_no;
	private String reply_text,id,ceo;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date reply_day;

}
