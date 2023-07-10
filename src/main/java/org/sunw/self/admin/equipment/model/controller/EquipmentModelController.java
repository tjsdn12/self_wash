package org.sunw.self.admin.equipment.model.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.sunw.self.admin.common.domain.PageMaker;
import org.sunw.self.admin.common.domain.ResultDTO;
import org.sunw.self.admin.customer.washmenu.domain.WashMenuDTO;
import org.sunw.self.admin.customer.washmenu.service.WashMenuService;
import org.sunw.self.admin.equipment.model.domain.EquipmentModelDTO;
import org.sunw.self.admin.equipment.model.service.EquipmentModelService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/equipment/model")
public class EquipmentModelController {
	
	private static final String FILE_UPLOAD_PATH = "/self_wash/uploads/";
	private static final String FILE_DOWNLOLAD_PATH = "/equipment/model/image?image=";
	
	@Autowired
	EquipmentModelService equipmentModelService;
	
	@Autowired
	WashMenuService washMenuService;
	
	@GetMapping("/list")
	public void list(EquipmentModelDTO equipmentModelDTO,Model model) {
		model.addAttribute("getAllEquipmentModelList",equipmentModelService.getAllEquipmentModelList(equipmentModelDTO));
		PageMaker pageMaker = new PageMaker(equipmentModelDTO, equipmentModelService.getEquipmentModelCnt(equipmentModelDTO));
		model.addAttribute("pageMaker", pageMaker);
		log.info(pageMaker);
	}
	@GetMapping("/form")
	public void form(EquipmentModelDTO equipmentModelDTO, Model model) {
		EquipmentModelDTO getOne = equipmentModelService.getOneEquipmentModel(equipmentModelDTO.getEquipmentModelId());
		model.addAttribute("equipmentModelVO",getOne.getEquipmentModelVO());
		log.info(model);
		
	}
	
	
	@GetMapping("/popup/list")
	public void list(WashMenuDTO washMenuDTO, Model model) {
		model.addAttribute("getAllWashMenuList",washMenuService.getEquipmentWashMenuList(washMenuDTO));
	}

	@GetMapping("/popup/register")
	public void register(WashMenuDTO washMenuDTO, Model model) {
		washMenuDTO.setPerSheet(100);
		model.addAttribute("getAllWashMenuList",washMenuService.getAllWashMenuList(washMenuDTO));
	}

	@PutMapping("/popup/insert")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO insert(@RequestBody WashMenuDTO washMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = washMenuService.insertEquipmentWashMenu(washMenuDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}

	@DeleteMapping("/popup/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody WashMenuDTO washMenuDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = washMenuService.deleteEquipmentWashMenu(washMenuDTO.getMenuEquipmentMappingId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	
	@PutMapping(value= "/form/fileUpload")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO fileUpload(MultipartFile file) {
		ResultDTO result = new ResultDTO();
			//file.getOriginalFilename : 파일 명 불러옴
	        String fileName = file.getOriginalFilename();
	        //경로랑 파일명으로 파일을 새로 생성할 경로를 지정
	        File target = new File(FILE_UPLOAD_PATH, fileName);
	        
	        File uploadPath = new File(FILE_UPLOAD_PATH);
	        //upload_path 경로가 존재하지 않으면
	        if(!uploadPath.exists()) {
	        	//그 폴더를 새로 생성
	        	uploadPath.mkdirs();
	        }
	        try {
	        	//file.getBytes() : 파일의 바이트 코드를 가져옴
	        	//FileCopyUtils.copy : 바이트코드로부터 target 경로에 새로운 파일을 생성해서 복사함.
				FileCopyUtils.copy(file.getBytes(), target);
			} catch (IOException e) {
				e.printStackTrace();
			}
		result.setSuccess(true);
		result.setData(FILE_DOWNLOLAD_PATH+fileName);
		return result;
	}
	
	@GetMapping(value= "/image")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public  void download(HttpServletResponse response, HttpServletRequest request) throws Exception {
		FileInputStream fileInputStream = null;
        try {
        	//파라미터로 이미지파일 경로 불러옴
        	String path = FILE_UPLOAD_PATH+request.getParameter("image"); // 경로에 접근할 때 역슬래시('\') 사용
        	fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	
        	//파일을 보내는데 이게 무슨파일인지 알아야하잖아, 이 응답이 image/jpeg파일임을 알려줌
        	response.setHeader("Content-Type", "image/jpeg");
        	
        	//파일을 bytecode형태로 응답시킬 유틸리티
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
            byte[] buffer = new byte[1024];
            //파일의 byte코드를 한줄씩 읽어서 read 변수에 담음
            while ((read = fileInputStream.read(buffer)) != -1) { 
            	// 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
            	//유틸리티로 읽어들인 read(byte코드가 담긴 변수)를 한줄씩 작성함
                out.write(buffer, 0, read);
            }
                
        } catch (Exception e) {
            throw new Exception("download error");
        }finally {
        	fileInputStream.close();
        }
	}
	
	@PutMapping(value= "/form")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO save(@RequestBody EquipmentModelDTO equipmentModelDTO) {
		ResultDTO result = new ResultDTO();
		
		boolean isSuccess = equipmentModelService.update(equipmentModelDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@DeleteMapping("/list")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO delete(@RequestBody EquipmentModelDTO equipmentModelDTO) {
		ResultDTO result =new ResultDTO();
		boolean isSuccess =equipmentModelService.delete(equipmentModelDTO.getEquipmentModelVO().getEquipmentModelId())>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"삭제되었습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
	@GetMapping("/detail")
	public void selectEquipmentModel(EquipmentModelDTO equipmentModelDTO, Model model) {
		EquipmentModelDTO getOne =equipmentModelService.getOneEquipmentModel(equipmentModelDTO.getEquipmentModelId());
		model.addAttribute("equipmentModelVO",getOne.getEquipmentModelVO());
		log.info(model);
	}
	
	@GetMapping("/register")
	public void register(EquipmentModelDTO equipmentModelDTO, Model model) {
		EquipmentModelDTO getOne = equipmentModelService.getOneEquipmentModel(equipmentModelDTO.getEquipmentModelId());
		model.addAttribute("equipmentModelVO",getOne.getEquipmentModelVO());
		log.info(model);
		
	}
	
	@PutMapping("/register")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ResultDTO register(@RequestBody EquipmentModelDTO equipmentModelDTO) {
		ResultDTO result = new ResultDTO();
		boolean isSuccess = equipmentModelService.insert(equipmentModelDTO)>0;
		result.setSuccess(isSuccess);
		String message = isSuccess?"저장에 성공하였습니다.":"오류가 발생하였습니다.";
		result.setMessage(message);
		return result;
	}
}
