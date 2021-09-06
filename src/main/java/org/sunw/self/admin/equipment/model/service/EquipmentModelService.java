package org.sunw.self.admin.equipment.model.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;

public interface EquipmentModelService {
	
	public int insert(EquipmentModelDTO equipmentModelDTO);

	public List<EquipmentModelVO> getAllEquipmentModelList(EquipmentModelDTO equipmentModelDTO);
	
	public int getEquipmentModelCnt(EquipmentModelDTO equipmentModelDTO);
	
	EquipmentModelDTO getOneEquipmentModel(String equipmentModelId);
	
	public int update(EquipmentModelDTO equipmentModelDTO);
	
	public int delete(String equipmentModelId);
	
}
