package org.sunw.self.admin.customer.order.controller;

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
import org.sunw.self.admin.customer.order.domain.OrderManageDTO;
import org.sunw.self.admin.customer.order.service.OrderManageService;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/ordermanage")
public class OrderManageController {
	@Autowired
	OrderManageService orderManageService;
	@GetMapping("list")
	public void list(OrderManageDTO orderManageDTO,Model model) {
		
		model.addAttribute("getAllOrderManageList", orderManageService.getAllOrderManageList(orderManageDTO));
	
	}
	@GetMapping("/form")
	public void form(OrderManageDTO orderManageDTO, Model model) {
		OrderManageDTO getOne = orderManageService.getOneOrderManage(orderManageDTO.getOrderId());
		model.addAttribute("orderManageVO",getOne.getOrderManageVO());
		log.info(model);
	}
	
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody OrderManageDTO orderManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = orderManageService.update(orderManageDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody OrderManageDTO orderManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =orderManageService.delete(orderManageDTO.getOrderManageVO().getorderId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("detail")
	public void selectOrderManage(OrderManageDTO orderManageDTO,Model model) {
		OrderManageDTO getOne =orderManageService.getOneOrderManage(orderManageDTO.getOrderId());
		model.addAttribute("orderManageVO",getOne.getOrderManageVO());
		log.info(model);
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody OrderManageDTO orderManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = orderManageService.insert(orderManageDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("/register")
	public void register(OrderManageDTO orderManageDTO, Model model) {
		OrderManageDTO getOne = orderManageService.getOneOrderManage(orderManageDTO.getOrderId());
		model.addAttribute("orderManageVO",getOne.getOrderManageVO());
		log.info(model);
	}
}
