package org.sunw.self.admin.user.manager.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerDTO;
import org.sunw.self.admin.user.manager.service.ManageManagerService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/manager")
public class ManageManagerController {
	@Autowired
	ManageManagerService manageManagerService;
	
	@GetMapping("/list")
	public void list(ManageManagerDTO manageManagerDTO, Model model) {
		
		model.addAttribute("getAllManagerList", manageManagerService.getAllManagerList(manageManagerDTO ));
	}
	
	
	@GetMapping("/form")
	public void form() {
		
	}
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody ManageManagerDTO manageManagerDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = manageManagerService.insert(manageManagerDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	
	@PostMapping("/form")
	public ResponseEntity<Map<String,String>> form(@RequestBody ManageManagerDTO manageManagerDTO){
		
		Map<String, String> result =new HashMap<String, String>();
		manageManagerService.insert(manageManagerDTO);
		return new ResponseEntity<Map<String,String>>(result,HttpStatus.OK);
		
	}
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody ManageManagerDTO manageManagerDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess = manageManagerService.delete(manageManagerDTO.getManageManagerVO().getMgrId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다..":"d.";
		result.setMessage(message);
		return result;
	}
	@GetMapping("/detail")
	public void selectManager(ManageManagerDTO manageManagerDTO,Model model) {
		ManageManagerDTO getOne = manageManagerService.getOneManager(manageManagerDTO.getMgrId());
		model.addAttribute("managerManagerDTO",getOne);
		log.info(model);
	}
	
}
