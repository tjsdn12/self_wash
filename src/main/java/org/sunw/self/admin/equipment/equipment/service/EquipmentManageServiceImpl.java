package org.sunw.self.admin.equipment.equipment.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageVO;
import org.sunw.self.admin.equipment.equipment.mapper.EquipmentManageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EquipmentManageServiceImpl implements EquipmentManageService {
	
	private final EquipmentManageMapper equipmentManageMapper;
	
	@Override
	public int insert(EquipmentManageDTO equipmentManageDTO) {
		return equipmentManageMapper.insert(equipmentManageDTO.getEquipmentManageVO());
	}

	@Override
	public List<EquipmentManageVO> getAllEquipmentManageList(EquipmentManageDTO equipmentManageDTO) {
		List<EquipmentManageVO> list = equipmentManageMapper.getAllEquipmentManageList(equipmentManageDTO);
		return list;
	}

	@Override
	public int getEquipmentManageCnt(EquipmentManageDTO equipmentManageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public int update(EquipmentManageDTO equipmentManageDTO) {
		
		return equipmentManageMapper.update(equipmentManageDTO.getEquipmentManageVO());
		
	}

	@Override
	public int delete(String equipmentCode) {
		
		return equipmentManageMapper.delete(equipmentCode);
	}

	@Override
	public EquipmentManageDTO getOneEquipmentManage(String equipmentCode) {
		
		EquipmentManageDTO equipmentManageDTO = new EquipmentManageDTO();
		equipmentManageDTO.setEquipmentManageVO(equipmentManageMapper.getOneEquipmentManage(equipmentCode));
		return equipmentManageDTO;
	}

	

}
