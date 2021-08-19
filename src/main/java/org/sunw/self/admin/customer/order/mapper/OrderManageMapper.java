package org.sunw.self.admin.customer.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.customer.order.domain.OrderManageDTO;
import org.sunw.self.admin.customer.order.domain.OrderManageVO;

public interface OrderManageMapper {
	
	public int insert(OrderManageVO orderManageVO);
	
	public List<OrderManageVO>getAllOrderManageList(OrderManageDTO orderManageDTO);
	
	public int getOrederManageCnt(OrderManageDTO orderManageDTO);
	
	OrderManageVO getOneOrderManage(@Param("orderId")String orderId);
	
	public int getOrderStatusCnt();
	
	public int update(OrderManageVO orderManageVO);
	
	public int delete(String orderId);

}
