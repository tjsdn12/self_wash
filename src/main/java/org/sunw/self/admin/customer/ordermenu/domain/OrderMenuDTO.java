package org.sunw.self.admin.customer.ordermenu.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class OrderMenuDTO extends DefaultDTO {

	OrderMenuVO orderMenuVO;
	
	String orderMenuId;
}
