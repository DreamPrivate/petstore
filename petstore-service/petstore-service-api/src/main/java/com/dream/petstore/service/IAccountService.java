package com.dream.petstore.service;

import com.dream.petstore.entity.Account;

/**
 * AccountService接口
 * 
 * @author ronghua
 * @version 1.0
 * @date 2016年12月6日 下午11:07:10
 * @since 1.8
 */
public interface IAccountService {

	public Account getAccount(String username);
	
	public Account getAccount(String username, String password);
	
	public void insertAccount(Account account);
	
	public void updateAccount(Account account);
}
