package org.sunw.self.admin.equipment.model.controller;

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
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.service.EquipmentModelService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/equipment/model")
public class EquipmentModelController {
	@Autowired
	EquipmentModelService equipmentModelService;
	
	@GetMapping("/list")
	public void list(EquipmentModelDTO equipmentModelDTO,Model model) {
		model.addAttribute("getAllEquipmentModelList",equipmentModelService.getAllEquipmentModelList(equipmentModelDTO));
	}
	@GetMapping("/form")
	public void form() {
		
	}
	@PostMapping("/form")
	public ResponseEntity<Map<String, String>>form(@RequestBody EquipmentModelDTO equipmentModelDTO){
		Map<String, String> result =new HashMap<String, String>();
		equipmentModelService.insert(equipmentModelDTO);
		return new ResponseEntity<Map<String,String>>(result,HttpStatus.OK);
	}
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody EquipmentModelDTO equipmentModelDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentModelService.insert(equipmentModelDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@DeleteMapping("list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody EquipmentModelDTO equipmentModelDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess =equipmentModelService.delete(equipmentModelDTO.getEquipmentModelVO().getequipmentModelId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다..":"d.";
		result.setMessage(message);
		return result;
	}
	@GetMapping("/detail")
	public void selectEquipmentModel(EquipmentModelDTO equipmentModelDTO, Model model) {
		EquipmentModelDTO getOne =equipmentModelService.getOneEquipmentModel(equipmentModelDTO.getEquipmentModelId());
		model.addAttribute("equipmentModelDTO",getOne);
		log.info(model);
	}
}
