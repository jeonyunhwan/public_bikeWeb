package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bikeWeb.vo.NoticeVo;

import bikeweb.service.AdminService;
import bikeweb.service.NoticeService;

@Controller
public class AdminController {
	@Autowired(required = false)
	private AdminService service;
	@Autowired(required = false)
	private NoticeService service2;
	
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "a10_admin\\admin_main.jsp";
	}
	
	@RequestMapping("/insNotice.do") // 공지사항 등록
	public String insNotice(@RequestParam(value="report", defaultValue = "") MultipartFile report,NoticeVo ins, Model d) {
		service.insNotice(ins);
		d.addAttribute("msg","등록 성공!");
		return "a10_admin\\adminNotice.jsp";
	}
	
	@RequestMapping("/adminNoticeList.do")
	public String noticeList(@ModelAttribute("sch") NoticeVo sch, Model d) {
		d.addAttribute("list", service2.noticeList(sch));		
		return "a10_admin\\showNotice.jsp";
	}
	// 상세페이지
	@GetMapping("/adminNoticeDetail.do")
	public String noticeView(@RequestParam("noticeno") String noticeno, Model d){
		d.addAttribute("notice", service2.noticeView(noticeno));
		return "a10_admin\\showNoticeDetail.jsp";
	}
}
