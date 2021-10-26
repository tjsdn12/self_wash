package org.sunw.self.admin.user.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoVO;
import org.sunw.self.admin.infomation.store.mapper.StoreInfoMapper;
import org.sunw.self.admin.user.manager.domain.ManageManagerDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;
import org.sunw.self.admin.user.manager.mapper.ManageManagerMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManageManagerServiceImpl implements ManageManagerService {
	
	private final ManageManagerMapper manageManagerMapper;
	
	
	@Override
	public int insert(ManageManagerDTO manageManagerDTO) {
		return manageManagerMapper.insert(manageManagerDTO.getManageManagerVO());
	}

	@Override
	public List<ManageManagerVO> getAllManagerList(ManageManagerDTO manageManagerDTO) {
//		manageManagerDTO.setPerSheet(10);
		
		List<ManageManagerVO> list = manageManagerMapper.getAllManagerList(manageManagerDTO);

		return list;
	}

	@Override
	public int getManagerListCnt(ManageManagerDTO manageManagerDTO) {
		return manageManagerMapper.getManagerListCnt(manageManagerDTO);
	}

	@Override
	public List<StoreInfoVO> getStoreList() {
		List<StoreInfoVO>list = manageManagerMapper.getStoreList();
		return list;
	}
	
	@Override
	public ManageManagerDTO getOneManager(String mgrId) {
		ManageManagerDTO manageManagerDTO = new ManageManagerDTO();
		manageManagerDTO.setManageManagerVO(manageManagerMapper.getOneManager(mgrId));
		return manageManagerDTO;
	}

	@Override
	public int getManagerCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	//저장버튼
	public int update(ManageManagerDTO manageManagerDTO) {
		
		return manageManagerMapper.update(manageManagerDTO.getManageManagerVO());
	
	}

	@Override
	public int delete(String mgrId) {
		return manageManagerMapper.delete(mgrId);
	}

	@Override
	public int phoneCheck(ManageManagerDTO manageManagerDTO) {
		
		return manageManagerMapper.phoneCheck(manageManagerDTO.getManageManagerVO());
	}
	
	


}
