package org.sunw.self.admin.equipment.manage.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class EquipmentManageDTO extends DefaultDTO{
	
	EquipmentManageVO equipmentManageVO;
	
	String equipmentCode;

	
}
