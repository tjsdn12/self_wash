package org.sunw.self.admin.equipment.equipment.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class EquipmentManageDTO extends DefaultDTO{
	
	EquipmentManageVO equipmentManageVO;
	
	String equipmentCode;
	
	String equipmentModelId;
	
	String xCoord;
	
	String yCoord;
	
	String sId;

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
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
