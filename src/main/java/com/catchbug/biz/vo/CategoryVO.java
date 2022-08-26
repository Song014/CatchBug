package com.catchbug.biz.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryVO {
	private int sub_category, main_category;
	private String sub_name, main_name;
}
