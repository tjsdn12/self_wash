package org.sunw.self.admin.customer.qna.controller;


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
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.service.InquiryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customer/inquiry")
public class InquiryController {
	
	@Autowired
	InquiryService inquiryService;
	
	@GetMapping("/list")
	public void goList(InquiryDTO inquiryDTO,Model model) {
		
		model.addAttribute("getAllInquiryList",inquiryService.getAllInquiryList(inquiryDTO));
		
	}
	
	@GetMapping("/form")
	public void form(InquiryDTO inquiryDTO, Model model) {
		InquiryDTO getOne = inquiryService.getOneInquiry(inquiryDTO.getInquiryId());
		model.addAttribute("inquiryVO",getOne.getInquiryVO());
		log.info(model);
		
		model.addAttribute("getManagerList", inquiryService.getManagerList());
		
		model.addAttribute("getOneUserId" , inquiryService.getUserList());
		
	}
	
	@PutMapping("/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody InquiryDTO inquiryDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = inquiryService.update(inquiryDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@DeleteMapping("list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody InquiryDTO inquiryDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess= inquiryService.delete(inquiryDTO.getInquiryVO().getInquiryId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@GetMapping("/detail")
	public void selectInquiry(InquiryDTO inquiryDTO,Model model) {
		InquiryDTO getOne = inquiryService.getOneInquiry(inquiryDTO.getInquiryId());
		model.addAttribute("inquiryVO",getOne.getInquiryVO());
		log.info(model);
		log.info(inquiryDTO.getInquiryId());
	}
	
	@GetMapping("/register")
	public void register(InquiryDTO inquiryDTO, Model model) {
		InquiryDTO getOne = inquiryService.getOneInquiry(inquiryDTO.getInquiryId());
		model.addAttribute("inquiryVO",getOne.getInquiryVO());
		log.info(model);
		
		model.addAttribute("getManagerList", inquiryService.getManagerList());
		
		model.addAttribute("getOneUserId" , inquiryService.getUserList());
		
	}

	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody InquiryDTO inquiryDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = inquiryService.insert(inquiryDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
}
