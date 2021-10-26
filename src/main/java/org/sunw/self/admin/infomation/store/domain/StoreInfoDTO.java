package org.sunw.self.admin.infomation.store.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class StoreInfoDTO extends DefaultDTO{
	
	StoreInfoVO storeInfoVO;
	
	String sId;
	
	String sName;

}
