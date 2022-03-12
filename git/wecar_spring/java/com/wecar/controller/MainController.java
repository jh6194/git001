package com.wecar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wecar.dto.UserDto;
import com.wecar.service.user.UserService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	@Autowired UserService service;
	
	@GetMapping("/view")
	public void main() {}
	
	@GetMapping("/login")
	public String login(@RequestParam("uno")int uno, HttpSession session) {
		UserDto dto = new UserDto();
		dto.setUno(uno);
		session.setAttribute("user", service.userSelect(dto));
		return "redirect:/main/view";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(); 
		session.removeAttribute("user");
		return "redirect:/main/view";
	}
}
