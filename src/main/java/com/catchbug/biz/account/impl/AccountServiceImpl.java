package com.catchbug.biz.account.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.AccountService;
import com.catchbug.biz.vo.AccountVO;

@Service("AccountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
//	private AccountDAO accountDAO;
	private AccountDAOmybaits accountDAO;
	
	
	@Override
	public void insertAccount(AccountVO vo) {
		accountDAO.insertAccount(vo);
	}

}
