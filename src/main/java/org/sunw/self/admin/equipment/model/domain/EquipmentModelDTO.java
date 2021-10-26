package org.sunw.self.admin.equipment.model.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class EquipmentModelDTO extends DefaultDTO {

	EquipmentModelVO equipmentModelVO;
	
	String equipmentModelId;
	
	String equipmentName;
}
