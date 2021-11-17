package org.sunw.self.admin.customer.washmenu.domain;

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
public class WashMenuVO {

	private final static Map<String, String> equipmentTypeNames = new HashMap<String, String>();
	static {
		equipmentTypeNames.put("1", "세탁기");
		equipmentTypeNames.put("2", "건조기");
		equipmentTypeNames.put("3", "신발세탁기");
		equipmentTypeNames.put("4", "세탁건조기");
	}

	String washMenuId;
	String menuEquipmentMappingId;
	Integer menuPrice;
	String equipmentModelId;
	String menuName;
	String detergentUseAt;
	String equipmentName;
	String rinsingCnt;
	String weight;
	String dehydrationCnt;
	String categoryId;
	String waterType;
	String time;
	String menuDesc;
	String equipmentType;

	public String getEquipmentTypeName() {
		return equipmentTypeNames.get(equipmentType);
	}

}
