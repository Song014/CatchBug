package com.catchbug.biz.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	String id;
	String pass;
	String business_no;
	String business_name;
	String ceo;
	String contact;
	String email;
	String business_address;
	Date regdate;
	int level1;
	
}
