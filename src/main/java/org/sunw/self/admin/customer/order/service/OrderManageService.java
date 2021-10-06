package org.sunw.self.admin.customer.order.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.customer.order.domain.OrderManageDTO;
import org.sunw.self.admin.customer.order.domain.OrderManageVO;

public interface OrderManageService {
	
	public int insert(OrderManageDTO orderManageDTO);
	
	public List<OrderManageVO>getAllOrderManageList(OrderManageDTO orderManageDTO);

	public int getOrederManageCnt(OrderManageDTO orderManageDTO);
	
	OrderManageDTO getOneOrderManage(String OrderId);
	
	public int update(OrderManageDTO orderManageDTO);
	
    public int delete (String OrderId);
	

}
