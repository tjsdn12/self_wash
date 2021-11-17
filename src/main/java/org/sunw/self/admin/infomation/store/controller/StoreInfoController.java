package org.sunw.self.admin.infomation.store.controller;


import java.util.List;

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
import org.sunw.self.admin.common.domain.PageMaker;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageDTO;
import org.sunw.self.admin.equipment.equipment.domain.EquipmentManageVO;
import org.sunw.self.admin.equipment.equipment.service.EquipmentManageService;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelVO;
import org.sunw.self.admin.equipment.model.service.EquipmentModelService;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.infomation.store.service.StoreInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info/storeinfo")
public class StoreInfoController {
	@Autowired
	StoreInfoService storeInfoService;
	
	@Autowired
	EquipmentManageService equipmentManageService;
	
	@GetMapping("/list")
	public void list(StoreInfoDTO storeInfoDTO ,Model model) {
	
		log.info(storeInfoDTO);
		
		model.addAttribute("getAllStoreInfoList",storeInfoService.getAllStoreInfoList(storeInfoDTO));
		PageMaker pageMaker = new PageMaker(storeInfoDTO, storeInfoService.getStoreInfoCnt(storeInfoDTO));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@GetMapping("/form")
	public void form(StoreInfoDTO storeInfoDTO, Model model) {
		StoreInfoDTO getOne = storeInfoService.getOneStoreInfo(storeInfoDTO.getSId());
		model.addAttribute("storeInfoVO",getOne.getStoreInfoVO());
		log.info(model);
		
	}
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody StoreInfoDTO storeInfoDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = storeInfoService.update(storeInfoDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@DeleteMapping("list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody StoreInfoDTO storeInfoDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess = storeInfoService.delete(storeInfoDTO.getStoreInfoVO().getsId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@GetMapping("/detail")
	public void selectStore(StoreInfoDTO storeInfoDTO,Model model) {
		StoreInfoDTO getOne =storeInfoService.getOneStoreInfo(storeInfoDTO.getSId());
		model.addAttribute("storeInfoVO",getOne.getStoreInfoVO());
		log.info(model);
	}

	@GetMapping("/popup/detail")
	public void detail(StoreInfoDTO storeInfoDTO,Model model) {
		StoreInfoDTO getOne =storeInfoService.getOneStoreInfo(storeInfoDTO.getSId());
		model.addAttribute("storeInfoVO",getOne.getStoreInfoVO());
		List<EquipmentManageVO> list =equipmentManageService.getStoreEquipmentList(storeInfoDTO.getSId());
		model.addAttribute("equipmentList",list);
		List<EquipmentManageVO> equipmentPlacementList = equipmentManageService.getStoreEquipmentPlacementList(storeInfoDTO.getSId());
		model.addAttribute("equipmentPlacementList",equipmentPlacementList);
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody StoreInfoDTO storeInfoDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = storeInfoService.insert(storeInfoDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("/register")
	public void register(StoreInfoDTO storeInfoDTO, Model model) {
		StoreInfoDTO getOne = storeInfoService.getOneStoreInfo(storeInfoDTO.getSId());
		model.addAttribute("storeInfoVO",getOne.getStoreInfoVO());
		log.info(model);
	}
	


	@PutMapping("/popup/detail")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO popupInsert(@RequestBody EquipmentManageDTO equipmentManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentManageService.insertEquipmentPlacement(equipmentManageDTO)>0;
		result.setSuccess(isSuccess);
		return result;
	}

	@DeleteMapping("/popup/detail")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO popupDelete(@RequestBody EquipmentManageDTO equipmentManageDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentManageService.deleteEquipmentPlacement(equipmentManageDTO)>0;
		result.setSuccess(isSuccess);
		return result;
	}
	

}
