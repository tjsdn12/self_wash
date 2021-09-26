package org.sunw.self.admin.customer.washmenu.domain;

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
	
	 String washMenuId;		
	 Integer menuPrice;			
	 String equipmentModelId;	
	 String menuName;			
	 String detergentUseAt;	
	 String equipmentName;

}
