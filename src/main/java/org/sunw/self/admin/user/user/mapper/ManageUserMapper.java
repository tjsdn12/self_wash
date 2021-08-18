package org.sunw.self.admin.user.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.user.user.domain.ManageUserDTO;
import org.sunw.self.admin.user.user.domain.ManageUserVO;

public interface ManageUserMapper {
	
	public int insert(ManageUserVO manageUserVO);
	
	public List<ManageUserVO> getAllUserList (ManageUserDTO manageUserDTO );
	
	public int getUserListCnt(ManageUserDTO manageUserDTO);
	
	ManageUserVO getOneUser(@Param("memId") String memId);
	
	public int getUserCnt();
	
	public int update(ManageUserVO manageUserVO);
	
	public int delete(String memId);
}
