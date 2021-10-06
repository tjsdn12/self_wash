package org.sunw.self.admin.customer.order.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.customer.order.domain.OrderManageDTO;
import org.sunw.self.admin.customer.order.domain.OrderManageVO;
import org.sunw.self.admin.customer.order.mapper.OrderManageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderManageServiceImpl implements OrderManageService{
	
	private final OrderManageMapper orderManageMapper;
	
	@Override
	public int insert(OrderManageDTO orderManageDTO) {
		return orderManageMapper.insert(orderManageDTO.getOrderManageVO());
	}

	@Override
	public List<OrderManageVO> getAllOrderManageList(OrderManageDTO orderManageDTO) {
		List<OrderManageVO> list = orderManageMapper.getAllOrderManageList(orderManageDTO);
		return list;
	}

	@Override
	public int getOrederManageCnt(OrderManageDTO orderManageDTO) {
		return 0;
	}

	@Override
	public OrderManageDTO getOneOrderManage(String OrderId) {
		OrderManageDTO orderManageDTO = new OrderManageDTO();
		orderManageDTO.setOrderManageVO(orderManageMapper.getOneOrderManage(OrderId));
		return orderManageDTO;
	}

	@Override
	public int update(OrderManageDTO orderManageDTO) {
		
		return orderManageMapper.update(orderManageDTO.getOrderManageVO());
		
	}

	@Override
	public int delete(String OrderId) {
		
		return orderManageMapper.delete(OrderId);
	}
	
	

}
