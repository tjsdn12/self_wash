package org.sunw.self.admin.common.login.service;

import javax.servlet.http.HttpSession;

import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.common.login.domain.LoginVO;

public interface LoginService {
	
	LoginVO getLoginInfo(LoginDTO loginDTO);
	
	public void logout(HttpSession session);

}
