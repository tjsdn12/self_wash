
package org.sunw.self.admin.user.user.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.user.user.domain.ManageUserDTO;
import org.sunw.self.admin.user.user.domain.ManageUserVO;

public interface ManageUserService {
	
	public int insert(ManageUserDTO manageUserDTO);

	public List<ManageUserVO> getAllUserList( ManageUserDTO manageUserDTO);
	
	public int getUserListCnt(ManageUserDTO manageUserDTO);
	
	
	public int getUserCnt();
	
	public int update(ManageUserDTO manageUserDTO);
	
	public int delete(String memId);
	
	ManageUserDTO getOneUser(String memId);
	
	
}

