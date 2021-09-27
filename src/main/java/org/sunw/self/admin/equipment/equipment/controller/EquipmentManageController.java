package org.sunw.self.admin.equipment.equipment.controller;

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
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.equipment.service.EquipmentManageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/equipment/manage")
public class EquipmentManageController {
	@Autowired
	EquipmentManageService equipmentManageService;
	@GetMapping("/list")
	public void list(EquipmentManageDTO equipmentManageDTO, Model model) {
		
		model.addAttribute("getAllEquipmentManageList",equipmentManageService.getAllEquipmentManageList(equipmentManageDTO));
		
	}
	@GetMapping("/form")
	public void form(EquipmentManageDTO equipmentManageDTO, Model model) {
		EquipmentManageDTO getOne = equipmentManageService.getOneEquipmentManage(equipmentManageDTO.getEquipmentCode());
		model.addAttribute("equipmentManageVO",getOne.getEquipmentManageVO());
		log.info(model); 
		
	}
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody EquipmentManageDTO equipmentManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentManageService.update(equipmentManageDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	
	}
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody EquipmentManageDTO equipmentManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess =equipmentManageService.delete(equipmentManageDTO.getEquipmentManageVO().getequipmentCode())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@GetMapping("/detail")
	public void selectEquipmentManage(EquipmentManageDTO equipmentManageDTO,Model model) {
		EquipmentManageDTO getOne =equipmentManageService.getOneEquipmentManage(equipmentManageDTO.getEquipmentCode());
		model.addAttribute("equipmentManageVO",getOne.getEquipmentManageVO());
		log.info(model);
	}
	
	@GetMapping("/register")
	public void register(EquipmentManageDTO equipmentManageDTO, Model model) {
		EquipmentManageDTO getOne = equipmentManageService.getOneEquipmentManage(equipmentManageDTO.getEquipmentCode());
		model.addAttribute("equipmentManageVO",getOne.getEquipmentManageVO());
		log.info(model); 
		
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody EquipmentManageDTO equipmentManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentManageService.insert(equipmentManageDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	
	}
	

}
