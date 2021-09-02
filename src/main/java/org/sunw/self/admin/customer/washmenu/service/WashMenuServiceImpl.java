package org.sunw.self.admin.customer.washmenu.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuVO;
import org.sunw.self.admin.customer.washmenu.mapper.WashMenuMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WashMenuServiceImpl implements WashMenuService {
	
	private final WashMenuMapper washMenuMapper;
	
	@Override
	public int insert(WashMenuDTO washMenuDTO) {
		
		return washMenuMapper.insert(washMenuDTO.getWashMenuVO());
	}

	@Override
	public List<WashMenuVO> getAllWashMenuList(WashMenuDTO washMenuDTO) {
		List<WashMenuVO> list = washMenuMapper.getAllWashMenuList(washMenuDTO);
		return list;
	}

	@Override
	public int getWashMenuCnt(WashMenuDTO washMenuDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public WashMenuDTO getOneWashMenu(String washMenuId) {
		
		return toWashMenuDTO(washMenuMapper.getOneWashMenu(washMenuId));
	}

	@Override
	public int update(WashMenuDTO washMenuDTO) {
		
		return washMenuMapper.update(toWashMenuVO(washMenuDTO));
	}

	@Override
	public int delete(String washMenuId) {
		
		return washMenuMapper.delete(washMenuId);
	}

}
