package org.sunw.self.admin.equipment.equipment.domain;

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
public class EquipmentManageVO {

	private final static Map<String, String> equipmentTypeNames = new HashMap<String, String>();
	static {
		equipmentTypeNames.put("1", "세탁기");
		equipmentTypeNames.put("2", "건조기");
		equipmentTypeNames.put("3", "신발세탁기");
		equipmentTypeNames.put("4", "세탁건조기");
	}

	String equipmentCode;
	String tptb;
	String equipmentStatus;
	Integer equipmentModelId;
	String equipmentName;
	String regularInspection;
	String regularInspectionDate;
	String purchasePrice;
	String purchaseDatetime;
	String equipmentType;
	String sId;
	String sName;
	String xCoord;
	String yCoord;

	public String getEquipmentTypeName() {
		return equipmentTypeNames.get(equipmentType);
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getxCoord() {
		return xCoord;
	}

	public void setxCoord(String xCoord) {
		this.xCoord = xCoord;
	}

	public String getyCoord() {
		return yCoord;
	}

	public void setyCoord(String yCoord) {
		this.yCoord = yCoord;
	}
	
}
