package org.sunw.self.admin.equipment.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;

public interface EquipmentModelMapper {
	
	public int insert(EquipmentModelVO equipmentModelVO);
	
	public List<EquipmentModelVO>getAllEquipmentModelList(EquipmentModelDTO equipmentModelDTO);

	public int getEquipmentModelCnt(EquipmentModelDTO equipmentModelDTO);
	
	EquipmentModelVO getOneEquipmentModel(@Param("equipmentModelId")String equipmentModelId);

	public int update(EquipmentModelVO equipmentModelVO);
	
	public int delete(String equipmentModelId);

}
