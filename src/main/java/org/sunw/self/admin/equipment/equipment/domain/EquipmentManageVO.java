package org.sunw.self.admin.equipment.equipment.domain;

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
	

  String equipmentCode;
  String tptb;
  String equipmentStatus;
  Integer equipmentModelId;
  String regularInspection;
  String regularInspectionDate;
  String purchasePrice;
  String purchaseDatetime;
  
  public void setequipmentCode(String equipmentCode) {
	  this.equipmentCode=equipmentCode;
  }
  public String getequipmentCode() {
	  return this.equipmentCode;
  }
 


}
