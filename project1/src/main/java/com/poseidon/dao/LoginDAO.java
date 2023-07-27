package com.poseidon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poseidon.dto.LoginDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}

}
