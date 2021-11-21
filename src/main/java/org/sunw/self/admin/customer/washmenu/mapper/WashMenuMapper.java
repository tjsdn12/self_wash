package org.sunw.self.admin.customer.washmenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.customer.washmenu.domain.CategoryVO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuVO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;

public interface WashMenuMapper {
	
	public int insert(WashMenuVO washMenuVO);
	
	public List<WashMenuVO>getAllWashMenuList(WashMenuDTO washMenuDTO);
	
	public int getWashMenuCnt(WashMenuDTO washMenuDTO);
	
	WashMenuVO getOneWashMenu(@Param("washMenuId")String washMenuId);
	
	public int getWashMenuStatusCnt();
	
	public int update(WashMenuVO washMenuVO);
	
	public int delete(String washMenuId);
	
	public List<EquipmentModelVO>getEquipmentModelList();
	
	public List<WashMenuVO> getEquipmentWashMenuList(WashMenuDTO washMenuDTO);
	
	public int insertEquipmentWashMenu(@Param("equipmentModelId") String equipmentModelId, @Param("washMenuId")String washMenuId);
	
	public int deleteAllEquipmentWashMenu(String equipmentModelId);

	public int deleteEquipmentWashMenu(String menuEquipmentMappingId);
	
	public List<CategoryVO> getCategoryList();
	

}
