package com.wecar.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionAdvice {
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		model.addAttribute("exception", ex);
		return "inc/error_page500";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String except2(Exception ex, Model model) {
		return "inc/error_page404";
	}
}
