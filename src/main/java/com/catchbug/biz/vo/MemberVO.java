package com.catchbug.biz.vo;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


import lombok.Data;

@Data
public class MemberVO {
	private String id; // 아이디
	private String pass; // 비밀번호
	private String business_no; // 사업자 등록번호
	private String business_name; // 법인명
	private String ceo; // 대표자
	private String contact; // 연락처
	private String email; // 이메일
	private String business_address; // 사업장 주소지
	@DateTimeFormat(pattern ="yy/mm/dd")
	private Date regdate; // 가입일 
	private int level1; // 등급
	private int startPage,endPage;

	private MultipartFile uploadImgFile;


	
}
