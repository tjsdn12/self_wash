package org.sunw.self.admin.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	public MainController() {
		log.info("create controller");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		System.out.println("a basdbvas");
		return "/index";
	}
	
}
