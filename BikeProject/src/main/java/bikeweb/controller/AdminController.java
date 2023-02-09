package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bikeWeb.vo.NoticeVo;
import com.bikeWeb.vo.QnaVo;

import bikeweb.service.AdminService;
import bikeweb.service.NoticeService;
import bikeweb.service.QnaService;

@Controller
public class AdminController {
	@Autowired(required = false)
	private AdminService service;
	@Autowired(required = false)
	private NoticeService service2;
	@Autowired(required = false)
	private QnaService service3;
	// 관리자 메인페이지
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "a10_admin\\admin_main.jsp";
	}
	// 공지사항 등록
	@RequestMapping("/insNotice.do") 
	public String insNotice(@RequestParam(value="report", defaultValue = "") MultipartFile report,NoticeVo ins, Model d) {
		service.insNotice(ins);
		d.addAttribute("msg","등록 처리되었습니다.");
		return "a10_admin\\adminNotice.jsp";
	}
	// 공지사항 조회 리스트
	@RequestMapping("/adminNoticeList.do")
	public String noticeList(@ModelAttribute("sch") NoticeVo sch, Model d) {
		d.addAttribute("list", service2.noticeList(sch));		
		return "a10_admin\\showNotice.jsp";
	}
	// 공지사항 상세페이지
	@GetMapping("/adminNoticeDetail.do")
	public String noticeView(@RequestParam("noticeno") String noticeno, Model d){
		d.addAttribute("notice", service2.noticeView(noticeno));
		return "a10_admin\\showNoticeDetail.jsp";
	}
	// 공지사항 삭제
	@PostMapping("/delNotice.do")
	public String delNotice(@RequestParam("noticeno") String noticeno, Model d) {
		service.delNotice(noticeno);
		d.addAttribute("msg", "삭제 처리되었습니다.");
		return "redirect:/adminNoticeList.do";
	}
	// QNA 질문 리스트
	@RequestMapping("/adminQnaList.do")
	public String qnaList(@ModelAttribute("sch") QnaVo sch, Model d) {
		d.addAttribute("list", service3.qnaList(sch));		
		return "a10_admin\\showQna.jsp";
	}
	// 상세페이지 이동
	@GetMapping("/adminQnaAnswer.do")
	public String qnaView(@RequestParam("qno") String qno, Model d){
		d.addAttribute("qna", service3.qnaView(qno));
		return "a10_admin\\adminAsk.jsp";
	}
}
