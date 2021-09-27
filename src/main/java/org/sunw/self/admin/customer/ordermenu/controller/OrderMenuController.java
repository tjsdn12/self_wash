package org.sunw.self.admin.customer.ordermenu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.customer.ordermenu.domain.OrderMenuDTO;
import org.sunw.self.admin.customer.ordermenu.service.OrderMenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/ordermenu")
public class OrderMenuController {
	
	@Autowired
	OrderMenuService orderMenuService;
	
	@GetMapping("/list")
	public void list(OrderMenuDTO orderMenuDTO,Model model) {
		
		model.addAttribute("getAllOrderMenuList",orderMenuService.getAllOrderMenuList(orderMenuDTO));
	}
	
	@GetMapping("/form")
	public void form(OrderMenuDTO orderMenuDTO, Model model) {
		OrderMenuDTO getOne = orderMenuService.getOneOrderMenu(orderMenuDTO.getOrderMenuId());
		model.addAttribute("orderMenuVO",getOne.getOrderMenuVO());
		log.info(model);
		
	}
	
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody OrderMenuDTO orderMenuDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess = orderMenuService.update(orderMenuDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody OrderMenuDTO orderMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =orderMenuService.delete(orderMenuDTO.getOrderMenuVO().getorderMenuId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("/detail")
	public void selectOrderMenu(OrderMenuDTO orderMenuDTO,Model model) {
		OrderMenuDTO getOne = orderMenuService.getOneOrderMenu(orderMenuDTO.getOrderMenuId());
		model.addAttribute("orderMenuVO",getOne.getOrderMenuVO());
		log.info(model);
	}
	
	@GetMapping("/register")
	public void register(OrderMenuDTO orderMenuDTO, Model model) {
		OrderMenuDTO getOne = orderMenuService.getOneOrderMenu(orderMenuDTO.getOrderMenuId());
		model.addAttribute("orderMenuVO",getOne.getOrderMenuVO());
		log.info(model);
		
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody OrderMenuDTO orderMenuDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess = orderMenuService.insert(orderMenuDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
}
