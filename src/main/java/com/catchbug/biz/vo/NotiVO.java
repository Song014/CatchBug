package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NotiVO {

		private int noti_no;
		private String id;
		private String writer;
		private String noti_title;
		private String noti_content;
		private Date noti_day;
		private int cnt;
		
}
