package com.catchbug.biz.vo;



import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;


import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
public class MemberVO {


    private String id; // 아이디
    private String pass; // 비밀번호
    private String business_no; // 사업자 등록번호
    private String business_name; // 법인명
    private String ceo; // 대표자
    private String contact; // 연락처
    private String email; // 이메일
    // 주소	
 	private String postcode;
 	private String business_address; 
 	private String detailAddress;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date regdate; // 가입일
    private int level1; // 등급
    private int mail_auth; //메일인증코드
    private String mail_key; //메일 키
    private int startPage, endPage;
	private String uuid;


	private MultipartFile uploadImgFile;


}
