package org.sunw.self.admin.customer.washmenu.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuVO;

public interface WashMenuService {
	
	public int insert(WashMenuDTO washMenuDTO);
	
	public List<WashMenuVO>getAllWashMenuList(WashMenuDTO washMenuDTO);
	
	public int getWashMenuCnt(WashMenuDTO washMenuDTO);
	
	WashMenuDTO getOneWashMenu(String washMenuId);
	
	public int update(WashMenuDTO washMenuDTO);
	
	public int delete(String washMenuId);
	
	default WashMenuDTO toWashMenuDTO(WashMenuVO washMenuVO) {
		WashMenuDTO washMenuDTO= new WashMenuDTO();
		BeanUtils.copyProperties(washMenuDTO,washMenuVO);
		return washMenuDTO;
	}
	
	default WashMenuVO toWashMenuVO(WashMenuDTO washMenuDTO) {
		WashMenuVO washMenuVO =new WashMenuVO();
		BeanUtils.copyProperties(washMenuVO, washMenuDTO);
		return washMenuVO;
	}

	
	
}
