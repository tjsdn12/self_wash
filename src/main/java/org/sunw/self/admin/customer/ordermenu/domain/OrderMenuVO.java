package org.sunw.self.admin.customer.ordermenu.domain;

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
public class OrderMenuVO {
	

	String orderMenuId;	
	String orderMenuName;	
	Long price;			
	Integer amount;			
	String washMenuId;	
	String memId;
	
	public void setorderMenuId(String orderMenuId) {
		this.orderMenuId=orderMenuId;
	}
	public String getorderMenuId() {
		return this.orderMenuId;
	}

}
