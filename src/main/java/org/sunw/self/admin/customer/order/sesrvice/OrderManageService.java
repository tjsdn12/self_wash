package org.sunw.self.admin.customer.order.sesrvice;

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
	
	default OrderManageDTO toOrderManageDTO(OrderManageVO orderManageVO) {
		OrderManageDTO orderManageDTO= new OrderManageDTO();
		BeanUtils.copyProperties(orderManageDTO,orderManageVO);
		return orderManageDTO;
	}
	default OrderManageVO toOrderManageVO(OrderManageDTO orderManageDTO) {
		OrderManageVO orderManageVO =new OrderManageVO();
		BeanUtils.copyProperties(orderManageVO, orderManageDTO);
		return orderManageVO;
	}

}