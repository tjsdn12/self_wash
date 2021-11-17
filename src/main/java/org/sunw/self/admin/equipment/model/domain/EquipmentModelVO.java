package org.sunw.self.admin.equipment.model.domain;

import java.util.HashMap;
import java.util.Map;

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
	private final static Map<String, String> equipmentTypeNames = new HashMap<String, String>();
	private final static Map<String, String> capacityGbNames = new HashMap<String, String>();
	static {
		equipmentTypeNames.put("1", "세탁기");
		equipmentTypeNames.put("2", "건조기");
		equipmentTypeNames.put("3", "신발세탁기");
		equipmentTypeNames.put("4", "세탁건조기");
		capacityGbNames.put("1", "기본(13kg)");
		capacityGbNames.put("2", "대량(18kg)");
	}
	
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
	String equipmentType;
	String capacityGb;
	
	public String getEquipmentTypeName() {
		return equipmentTypeNames.get(equipmentType);
	}
	
	public String getCapacityGbName() {
		return capacityGbNames.get(capacityGb);
	}

}
