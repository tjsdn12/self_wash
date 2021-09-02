package org.sunw.self.admin.customer.ordermenu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuDTO;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuVO;

public interface OrderMenuMapper {
	
	public int insert(OrderMenuVO orderMenuVO);
	
	public List<OrderMenuVO>getAllOrderMenuList(OrderMenuDTO orderMenuDTO);
	
	public int getOrderMenuCnt(OrderMenuDTO orderMenuDTO);
	
	OrderMenuVO getOneOrderMenu(@Param("orderMenuId")String orderMenuId);
	
	public int update(OrderMenuVO orderMenuVO);
	
	public int delete(String orderMenuId);

}
