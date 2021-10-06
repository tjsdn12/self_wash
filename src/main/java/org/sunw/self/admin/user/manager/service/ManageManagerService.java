package org.sunw.self.admin.user.manager.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoVO;
import org.sunw.self.admin.user.manager.domain.ManageManagerDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;

public interface ManageManagerService {
	public int insert(ManageManagerDTO manageManagerDTO);
	//매니져 추가
	public List<ManageManagerVO> getAllManagerList(ManageManagerDTO manageManagerDTO);
	//페이지에 나타나는 검색 숫자
	public int getManagerListCnt(ManageManagerDTO manageManagerDTO);
	
	
	public int getManagerCnt();
	
	public int update(ManageManagerDTO manageManagerDTO);
	
	public int delete(String mgrId);
	
	ManageManagerDTO getOneManager(String mgrId);
	
	public List<StoreInfoVO> getStoreList();
	
	public int phoneCheck(ManageManagerDTO manageManagerDTO);
	
	
}
