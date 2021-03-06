package org.sunw.self.admin.equipment.equipment.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.common.domain.PageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageVO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;
import org.sunw.self.admin.user.manager.domain.ManageManagerDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;

public interface EquipmentManageService {
	
	public int insert(EquipmentManageDTO equipmentManageDTO);
	
	public List<EquipmentManageVO>  getAllEquipmentManageList(EquipmentManageDTO equipmentManageDTO);
	
	public int getEquipmentManageCnt(EquipmentManageDTO equipmentManageDTO);
	
	EquipmentManageDTO getOneEquipmentManage(String equipmentCode);
	
	public List<EquipmentManageVO> getStoreEquipmentList(String sId);

	public List<EquipmentManageVO> getStoreEquipmentPlacementList(String sId);
	
	
	
	public int update(EquipmentManageDTO equipmentManageDTO);
	
	public int delete (String equipmentCode);
	
	public int insertEquipmentPlacement(EquipmentManageDTO equipmentManageDTO);
	
	public int deleteEquipmentPlacement(EquipmentManageDTO equipmentManageDTO);
	

}
