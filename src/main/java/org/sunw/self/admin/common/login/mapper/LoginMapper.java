package org.sunw.self.admin.common.login.mapper;

import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.common.login.domain.LoginVO;

public interface LoginMapper {
	
	LoginVO getLoginInfo(LoginDTO loginDTO);

}
