package org.sunw.self.admin.user.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.user.user.domain.ManageUserDTO;
import org.sunw.self.admin.user.user.domain.ManageUserVO;
import org.sunw.self.admin.user.user.mapper.ManageUserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManageUserServiceImpl implements ManageUserService {

	private final ManageUserMapper manageUserMapper;
	
	@Override
	public int insert(ManageUserDTO manageUserDTO ) {
		return manageUserMapper.insert(manageUserDTO.getManageUserVO());
	}

	@Override
	public List<ManageUserVO> getAllUserList( ManageUserDTO manageUserDTO) {
		manageUserDTO.setPage(1);
		manageUserDTO.setPerSheet(10);
		List<ManageUserVO> list =manageUserMapper.getAllUserList(manageUserDTO);
		return list;
	}

	@Override
	public int getUserListCnt(ManageUserDTO manageUserDTO) {
		return manageUserMapper.getUserListCnt(manageUserDTO);
	}

	@Override
	public ManageUserDTO getOneUser(String memId) {
		ManageUserDTO manageUserDTO = new ManageUserDTO();
		manageUserDTO.setManageUserVO(manageUserMapper.getOneUser(memId));
		return manageUserDTO;
	}
	

	@Override
	public int getUserCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ManageUserDTO manageUserDTO) {
		
		return manageUserMapper.update(manageUserDTO.getManageUserVO());
	}

	@Override
	public int delete(String memId) {
		return manageUserMapper.delete(memId);
	}



}
