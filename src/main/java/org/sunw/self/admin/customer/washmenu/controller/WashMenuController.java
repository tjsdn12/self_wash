package org.sunw.self.admin.customer.washmenu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.customer.washmenu.service.WashMenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/washmenu")
public class WashMenuController {
	@Autowired
	WashMenuService washMenuService;
	@GetMapping("list")
	public void list(WashMenuDTO washMenuDTO,Model model) {
		
		model.addAttribute("getAllWashMenuList",washMenuService.getAllWashMenuList(washMenuDTO));
		
	}
	@GetMapping("/form")
	public void form(WashMenuDTO washMenuDTO,Model model) {
		WashMenuDTO getOne = washMenuService.getOneWashMenu(washMenuDTO.getWashMenuId());
		model.addAttribute("washMenuVO",getOne.getWashMenuVO());
		log.info(model);
		
		model.addAttribute("getEquipmentModelList", washMenuService.getEquipmentModelList());
		
	}
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody WashMenuDTO washMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =washMenuService.update(washMenuDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody WashMenuDTO washMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =washMenuService.delete(washMenuDTO.getWashMenuVO().getWashMenuId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("/detail")
	public void selectWashMenu(WashMenuDTO washMenuDTO,Model model) {
		WashMenuDTO getOne = washMenuService.getOneWashMenu(washMenuDTO.getWashMenuId());
		model.addAttribute("washMenuVO",getOne.getWashMenuVO());
		log.info(model);
	}

	
	@GetMapping("/register")
	public void register(WashMenuDTO washMenuDTO,Model model) {
		WashMenuDTO getOne = washMenuService.getOneWashMenu(washMenuDTO.getWashMenuId());
		model.addAttribute("washMenuVO",getOne.getWashMenuVO());
		log.info(model);
		
		model.addAttribute("getEquipmentModelList", washMenuService.getEquipmentModelList());
		
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody WashMenuDTO washMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =washMenuService.insert(washMenuDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
}
