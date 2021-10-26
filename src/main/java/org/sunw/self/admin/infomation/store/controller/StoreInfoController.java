package org.sunw.self.admin.infomation.store.controller;


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
import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.infomation.store.service.StoreInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info/storeinfo")
public class StoreInfoController {
	@Autowired
	StoreInfoService storeInfoService;
	
	@GetMapping("/list")
	public void list(StoreInfoDTO storeInfoDTO ,Model model) {
	
		log.info(storeInfoDTO);
		
		model.addAttribute("getAllStoreInfoList",storeInfoService.getAllStoreInfoList(storeInfoDTO));
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
	

}
