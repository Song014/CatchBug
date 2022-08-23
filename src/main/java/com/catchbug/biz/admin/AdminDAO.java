package com.catchbug.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.MemberVO;

@Repository
public class AdminDAO {	
	
	/*
	 * @Autowired private JdbcTemplate jdbcTemplate;
	 */
	
	
	private final String getmember_list = "select * from member";
	
	public List<MemberVO> getMemberList() {
		System.out.println("겟리스트 DAO");
			return jdbcTemplate.query(getmember_list, new AdminMapper());
		
		
	}

}
