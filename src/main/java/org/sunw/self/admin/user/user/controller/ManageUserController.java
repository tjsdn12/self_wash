package org.sunw.self.admin.user.user.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

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
import org.sunw.self.admin.user.user.domain.ManageUserDTO;
import org.sunw.self.admin.user.user.service.ManageUserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/user")
public class ManageUserController {
	@Autowired
	ManageUserService manageUserService;
	
	@GetMapping("/list")
	public void list(ManageUserDTO manageUserDTO,Model model) {
		
		model.addAttribute("getAllUserList", manageUserService.getAllUserList(manageUserDTO));
	}
	
	@GetMapping("/form")
	public void form() {
		
	}
	@PostMapping("/form")
	public ResponseEntity<Map<String, String>> from (@RequestBody ManageUserDTO manageUserDTO){
		Map<String, String> result =new HashMap<String, String>();
		manageUserService.insert(manageUserDTO);
		return new ResponseEntity<Map<String,String>>(result,HttpStatus.OK);
	}
	
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody ManageUserDTO manageUserDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess =manageUserService.insert(manageUserDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody ManageUserDTO manageUserDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess =manageUserService.delete(manageUserDTO.getManageUserVO().getMemId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"d.";
		result.setMessage(message);
		return result;
	
	}
	
	@GetMapping("/detail")
	public void detail(ManageUserDTO manageUserDTO, Model model) {
		ManageUserDTO getOne =manageUserService.getOneUser(manageUserDTO.getMemId());
		model.addAttribute("manageUserDTO",getOne);
		log.info(model);
	}
	
	
}