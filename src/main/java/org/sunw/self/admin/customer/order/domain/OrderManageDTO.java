package org.sunw.self.admin.customer.order.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class OrderManageDTO extends DefaultDTO{
	
	OrderManageVO orderManageVO;
	
	String orderId;

}
