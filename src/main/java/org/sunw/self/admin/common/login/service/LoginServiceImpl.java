package org.sunw.self.admin.common.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.common.login.domain.LoginVO;
import org.sunw.self.admin.common.login.mapper.LoginMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

	private final LoginMapper loginMapper;

	@Override
	public LoginVO getLoginInfo(LoginDTO loginDTO) {

		LoginVO loginVO = loginMapper.getLoginInfo(loginDTO);
		log.info(loginVO);
		log.info(loginDTO);
		return loginVO;
	}

	@Override
	public void logout(HttpSession session) {
		
		session.invalidate();
		
	}
	
	

}
