package org.sunw.self.admin.customer.washmenu.domain;

import java.util.List;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;
@Data
public class WashMenuDTO extends DefaultDTO {

	WashMenuVO washMenuVO;
	
	String washMenuId;
	
	String menuEquipmentMappingId;
	
	String equipmentModelId;
	
	String equipmentType;
	
	List<String> addEquipmentWashMenuList;

}
