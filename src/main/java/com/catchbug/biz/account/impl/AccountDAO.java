package com.catchbug.biz.account.impl;

import org.springframework.jdbc.core.JdbcTemplate;

import com.catchbug.biz.vo.AccountVO;

//@Repository
public class AccountDAO {

//	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String Insert_Account ="insert into member(id,pass,business_no,business_name,ceo,contact,email,business_address,regdate,level1) "
			+ " values(?,?,?,?,?,?,?,?,?,?)";
			
	private final String BOARD_INSERT = "insert into board(seq,title,writer,content) "
	         + "values ((select nvl(max(seq),0) + 1 from board),?,?,?)";
//	private final String BOARD_INSERT = "insert into board(seq,title,writer,content) "
//	         + "values (?,?,?,?)";
	   private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
	   private final String BOARD_DELETE = "delete from board where seq=?";
	   private final String BOARD_GET = "select * from board where seq=?";
	   private final String BOARD_LIST = "select * from board order by seq desc";
	   private final String BOARD_LIST_T = "select * from board where title like '%'||?||'%' order by seq desc";
	   private final String BOARD_LIST_C = "select * from board where content like '%'||?||'%' order by seq desc";
	   private final String BOARD_CNT = "update board set cnt = cnt+1 "
	   		+ "where seq = ?";
	   
	   public void insertAccount(AccountVO vo) {
		   System.out.println("==> Spring Jdbc로 insertAccount()");
		   jdbcTemplate.update(Insert_Account,vo.getId(),vo.getPass(),vo.getBusiness_no(),vo.getBusiness_name(),
				   vo.getCeo(),vo.getContact(),vo.getEmail(),vo.getBusiness_address(),vo.getRegdate(),vo.getLevel1());
	   }
}
