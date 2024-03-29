package org.sunw.self.admin.common.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.common.login.domain.LoginDTO;
import org.sunw.self.admin.common.login.domain.LoginVO;
import org.sunw.self.admin.common.login.service.LoginService;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerDTO;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;
import org.sunw.self.admin.user.manager.service.ManageManagerService;

@Controller
@RequestMapping("/common/login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	ManageManagerService manageManagerService;
	
	
	@GetMapping("/login")
	public void loginForm(LoginDTO loginDTO, Model model) {
		
		model.addAttribute("loginInfo" , loginService.getLoginInfo(loginDTO));
		
	}
	
	@GetMapping("/register")
	public void register(ManageManagerDTO manageManagerDTO, Model model) {
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody ManageManagerDTO manageManagerDTO) {
		ResultDTO result = new ResultDTO();
		ManageManagerVO vo = manageManagerDTO.getManageManagerVO();
		vo.setApprovalStatus("0");
		vo.setAuthorLevel("MANAGER");
		boolean isSuccess = manageManagerService.insert(manageManagerDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	
	@PostMapping("/login")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO logInfo(@RequestBody LoginDTO loginDTO, HttpServletRequest request) {
		ResultDTO result = new ResultDTO();
		LoginVO loginInfo =loginService.getLoginInfo(loginDTO);
		boolean isSuccess = loginInfo != null; 
		result.setSuccess(isSuccess);
		String message = isSuccess?"로그인 되었습니다.":"핸드폰번호 혹은 비밀번호가 일치하지 않습니다.";
		result.setMessage(message);
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", loginInfo);
		//로그아웃 세션에 저장된 정보 를 삭제시킴
		//session.invalidate();

//		HttpSession session = request.getSession();
		//세션에 저장된 정보를 가져옴
//		LoginInfo loginInfo = session.getAttribute("loginInfo");
		
		return result;
		
	}
	
	
	
	
	
	
	@PostMapping("/logout")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO logOutInfo(HttpServletRequest request) {
		ResultDTO result = new ResultDTO();
		HttpSession session = request.getSession();
		session.invalidate();
		
		return result;
	}
	
	

	
	
}
