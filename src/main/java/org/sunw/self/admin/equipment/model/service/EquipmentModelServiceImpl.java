package org.sunw.self.admin.equipment.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;
import org.sunw.self.admin.equipment.model.mapper.EquipmentModelMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EquipmentModelServiceImpl implements EquipmentModelService{
	
	private final EquipmentModelMapper equipmentModelMapper;
	
	@Override
	public int insert(EquipmentModelDTO equipmentModelDTO) {
		return equipmentModelMapper.insert(equipmentModelDTO.getEquipmentModelVO());
	}

	@Override
	public List<EquipmentModelVO> getAllEquipmentModelList(EquipmentModelDTO equipmentModelDTO) {
		List<EquipmentModelVO> list = equipmentModelMapper.getAllEquipmentModelList(equipmentModelDTO);
		return list;
	}

	@Override
	public int getEquipmentModelCnt(EquipmentModelDTO equipmentModelDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public int update(EquipmentModelDTO equipmentModelDTO) {
		
		return equipmentModelMapper.update(equipmentModelDTO.getEquipmentModelVO());
	}

	@Override
	public int delete(String equipmentModelId) {
		return equipmentModelMapper.delete(equipmentModelId);
	}

	@Override
	public EquipmentModelDTO getOneEquipmentModel(String equipmentModelId) {
		EquipmentModelDTO equipmentModelDTO = new EquipmentModelDTO();
		equipmentModelDTO.setEquipmentModelVO(equipmentModelMapper.getOneEquipmentModel(equipmentModelId));
		return equipmentModelDTO;
	}

}
