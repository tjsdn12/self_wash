package org.sunw.self.admin.equipment.equipment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageVO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;

public interface EquipmentManageMapper {

	public int insert(EquipmentManageVO equipmentManageVO);
	
	public List<EquipmentManageVO> getAllEquipmentManageList(EquipmentManageDTO equipmentManageDTO);
	
	public int getEquipmentManageCnt(EquipmentManageDTO equipmentManageDTO);
	
	EquipmentManageVO getOneEquipmentManage(@Param("equipmentCode")String equipmentCode);
	
	public int getEquipmentStatueCnt();
	
	public int update(EquipmentManageVO equipmentManageVO);
	
	public int delete(String equipmentCode);
	
	public List<EquipmentManageVO> getStoreEquipmentList(String sId);
	
	public List<EquipmentManageVO> getStoreEquipmentPlacementList(String sId);
	
	public int insertEquipmentPlacement(EquipmentManageDTO equipmentManageDTO);

	public int deleteEquipmentPlacement(EquipmentManageDTO equipmentManageDTO);
}
