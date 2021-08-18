package org.sunw.self.admin.equipment.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.equipment.manage.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.manage.domain.EquipmentManageVO;

public interface EquipmentManageMapper {

	public int insert(EquipmentManageVO equipmentManageVO);
	
	public List<EquipmentManageVO> getAllEquipmentManageList(EquipmentManageDTO equipmentManageDTO);
	
	public int getEquipmentManageCnt(EquipmentManageDTO equipmentManageDTO);
	
	EquipmentManageVO getOneEquipmentManage(@Param("equipmentCode")String equipmentCode);
	
	public int getEquipmentStatueCnt();
	
	public int update(EquipmentManageVO equipmentManageVO);
	
	public int delete(String equipmentCode);
}
