package com.catchbug.biz.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVO {
	private int qna_no, rn;
	private String id;
	private String title;
	private String content;
	private int tap;
	private int state;
	
	private String name;
	
	private int cnt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date day;
}
