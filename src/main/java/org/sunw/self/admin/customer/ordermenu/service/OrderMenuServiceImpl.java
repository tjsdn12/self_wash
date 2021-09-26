package org.sunw.self.admin.customer.ordermenu.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuDTO;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuVO;
import org.sunw.self.admin.customer.ordermenu.mapper.OrderMenuMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderMenuServiceImpl implements OrderMenuService {
	
	private final OrderMenuMapper orderMenuMapper;
	
	@Override
	public int insert(OrderMenuDTO orderMenuDTO) {
		return orderMenuMapper.insert(orderMenuDTO.getOrderMenuVO());
	}

	@Override
	public List<OrderMenuVO> getAllOrderMenuList(OrderMenuDTO orderMenuDTO) {
		List<OrderMenuVO> list = orderMenuMapper.getAllOrderMenuList(orderMenuDTO);
		return list;
	}

	@Override
	public int getOrderMenuCnt(OrderMenuDTO orderMenuDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrderMenuDTO getOneOrderMenu(String orderMenuId) {
		OrderMenuDTO orderMenuDTO = new OrderMenuDTO();
		orderMenuDTO.setOrderMenuVO(orderMenuMapper.getOneOrderMenu(orderMenuId));
		return orderMenuDTO;
	}

	@Override
	public int update(OrderMenuDTO orderMenuDTO) {
		
		return orderMenuMapper.update(orderMenuDTO.getOrderMenuVO());
		
	}

	@Override
	public int delete(String orderMenuId) {
		
		return orderMenuMapper.delete(orderMenuId);
	}

}
