package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class PageVO {
	private int totalPage;
	private int pageCount; 
	private int page;
	
	private int startPageNum;
	private int endPageNum;
	
	private int startPage;
	private int endPage;
}
