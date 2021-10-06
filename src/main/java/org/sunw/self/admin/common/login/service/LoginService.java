package org.sunw.self.admin.common.login.service;

import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.common.login.domain.LoginVO;

public interface LoginService {
	
	LoginVO getLoginInfo(LoginDTO loginDTO);

}
