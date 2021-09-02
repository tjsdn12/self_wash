package org.sunw.self.admin.customer.ordermenu.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuDTO;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuVO;

public interface OrderMenuService {
	
	public int insert(OrderMenuDTO orderMenuDTO);
	
	public List<OrderMenuVO>getAllOrderMenuList(OrderMenuDTO orderMenuDTO);
	
	public int getOrderMenuCnt(OrderMenuDTO orderMenuDTO);
	
	OrderMenuDTO getOneOrderMenu(String orderMenuId);
	
	public int update(OrderMenuDTO orderMenuDTO);
	
	public int delete(String orderMenuId);
	
	default OrderMenuDTO toOrderMenuDTO(OrderMenuVO orderMenuVO) {
		OrderMenuDTO orderMenuDTO= new OrderMenuDTO();
		BeanUtils.copyProperties(orderMenuDTO,orderMenuVO);
		return orderMenuDTO;
	}
	default OrderMenuVO toOrderMenuVO(OrderMenuDTO orderMenuDTO) {
		OrderMenuVO orderMenuVO =new OrderMenuVO();
		BeanUtils.copyProperties(orderMenuVO, orderMenuDTO);
		return orderMenuVO;
	}

}
