package com.catchbug.biz.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NotiVO extends Criteria{

		private int noti_no;
		private String id;
		private String writer;
		private String noti_title;
		private String noti_content;
		@DateTimeFormat(pattern ="yy/mm/dd")
		private Date noti_day;
		private int cnt;
		
}
