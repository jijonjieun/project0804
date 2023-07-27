package com.poseidon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poseidon.dao.LoginDAO;
import com.poseidon.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO; 
	
	public LoginDTO login(LoginDTO dto) {
		return loginDAO.login(dto);

	}
}
