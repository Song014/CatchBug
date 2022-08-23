//package com.catchbug.biz.admin;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import org.springframework.jdbc.core.RowMapper;
//
//import com.catchbug.biz.vo.MemberVO;
//
//public class AdminMapper implements RowMapper<MemberVO> {
//
//	@Override
//	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//
//		MemberVO member_vo = new MemberVO();
//		
//		member_vo.setId(rs.getString("id"));
//		member_vo.setPass(rs.getString("pass"));
//		member_vo.setBusiness_no(rs.getString("business_no"));
//		member_vo.setBusiness_name(rs.getString("business_name"));
//		member_vo.setCeo(rs.getString("ceo"));
//		member_vo.setContact(rs.getString("contact"));
//		member_vo.setEmail(rs.getString("email"));
//		member_vo.setBusiness_address(rs.getString("business_address"));
//		member_vo.setRegdate(rs.getString("regdate"));
//		member_vo.setLevel1(rs.getInt("level1"));
//		
//		
//		System.out.println(member_vo + "맵퍼");
//		return member_vo;
//	}
//
//
//}
