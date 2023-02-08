package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bikeWeb.vo.NoticeVo;

import bikeweb.service.AdminService;

@Controller
public class AdminController {
	@Autowired(required = false)
	private AdminService service;
	
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "a10_admin\\admin_main.jsp";
	}
	@PostMapping("/insNotice.do") // 공지사항 등록
	public String insNotice(NoticeVo ins) {
		return "";
	}
}
