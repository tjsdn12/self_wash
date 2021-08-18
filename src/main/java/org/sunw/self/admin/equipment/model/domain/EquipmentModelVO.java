package org.sunw.self.admin.equipment.model.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EquipmentModelVO {

	String equipmentModelId;
	String equipmentName;
	String manufacturingCompany;
	String manufacturerNumber;
	Integer categoryId;
	String repairer;
	String repairerNumber;
	String exposureYesNo;
	String equipmentPhoto;
	String equipmentSpec;
	
	public void setequipmentModelId(String equipmentModelId) {
		this.equipmentModelId=equipmentModelId;
	}
	public String getequipmentModelId() {
		return this.equipmentModelId;
	}

}
