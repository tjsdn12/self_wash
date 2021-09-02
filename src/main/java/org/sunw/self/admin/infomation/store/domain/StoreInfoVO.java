package org.sunw.self.admin.infomation.store.domain;

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
public class StoreInfoVO {
	

	String sId;	
	String sName;	
	String sLocation;
	String manager;	
	String attemptClassification;		
	String cityCountyClassification;	
	String businessNumber;				
	Integer managerResidentNumber;		
	Integer postCode;	
	
	public void setId(String sId) {
		this.sId =sId;
	}
	public String getsId() {
		return this.sId;
	}
	
	public void setsName(String sName) {
		this.sName=sName;
	}
	public String getsName() {
		return this.sName;
	}
	
	public void getsLocation(String sLocation) {
		this.sLocation=sLocation;
	}
	public String getsLocation() {
		return this.sLocation;
	}



}
