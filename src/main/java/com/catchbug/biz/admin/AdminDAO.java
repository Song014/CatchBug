package com.catchbug.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.MemberVO;

@Repository
public class AdminDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberVO> getMemberList() {
		System.out.println("AdminDAO --> getMemberList");
		
		
		return mybatis.selectList("AdminMapper.getList");
		
	}

}
