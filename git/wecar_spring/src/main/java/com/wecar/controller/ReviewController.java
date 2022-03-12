package com.wecar.controller;

import java.io.File;
import java.net.InetAddress;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wecar.dto.ReserveDto;
import com.wecar.dto.ReviewDto;
import com.wecar.dto.ReviewPagingDto;
import com.wecar.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired ReviewService service;

	@GetMapping("/list")
	public void list(ReviewPagingDto dto1, Model model) {
		ReviewPagingDto dto = new ReviewPagingDto();
		dto.setPageTotal(service.listSum());
		dto.setOnePageLimit(10);
		dto.setPageAll((int) Math.ceil(dto.getPageTotal() / (float)dto.getOnePageLimit()));
		dto.setBottomlist(10);
		dto.setPstartno(dto1.getPstartno());
		dto.setList10(service.listPage(dto1));
		dto.setCurrentButton((int) Math.ceil((dto1.getPstartno() + 1) / (float) dto.getOnePageLimit()));
		dto.setStartButton(((int) Math.floor((dto.getCurrentButton() - 1) / (float) dto.getBottomlist())) * dto.getBottomlist() + 1);
		dto.setEndButton((dto.getStartButton() + dto.getBottomlist()) - 1);
		if(dto.getPageAll() < dto.getEndButton()) { dto.setEndButton(dto.getPageAll()); }
		model.addAttribute("list", dto.getList10());
		model.addAttribute("paging", dto);
	}
	
	@GetMapping("/writeView") public void writeView(@RequestParam("rno")int rno, @RequestParam("cno")String cno, Model model) { 
		model.addAttribute("user",service.writeView(rno));
		model.addAttribute("cno",cno);
	}
	
	@PostMapping("/write")
	public String write(ReviewDto dto, ReserveDto rdto, MultipartFile file, HttpServletRequest request, RedirectAttributes attributes) throws Exception {
		String result = "실패";
		String saveName = file.getOriginalFilename();
		if (saveName.equals("")) {
			saveName = "####";
		} else {
			saveName = UUID.randomUUID().toString() + "_" + saveName;
		}
//		String path = "/upload";
		String path = request.getServletContext().getRealPath("/") + "resources/upload/";
		File target = new File(path, saveName);		//File(파일경로, 파일이름)
		FileCopyUtils.copy(file.getBytes(), target);
		dto.setSip(InetAddress.getLocalHost().getHostAddress());
		dto.setSfile(saveName);
		if (service.write(dto) > 0) { result = "성공"; service.state(rdto); }
		attributes.addFlashAttribute("result", result);
		return "redirect:/review/list?pstartno=0&uno="+dto.getUno();
	}

	@GetMapping("/delete")
	public void delete(ReviewDto dto, RedirectAttributes attributes, Model model) {
		String result = "실패";
		if(service.delete(dto) > 0) { result = "성공"; }
		model.addAttribute("cno", dto.getCno());
		attributes.addFlashAttribute("result", result);
	}
}                                                                    