package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.NoticeVo;

import bikeweb.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired(required=false)
	private NoticeService service;
	// 공지사항 전체 리스트 / 제목 + 내용 검색
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute("sch") NoticeVo sch, Model d) {
		d.addAttribute("list", service.noticeList(sch));		
		return "a31_notice\\notice.jsp";
	}
	// 상세페이지
	@GetMapping("noticeView.do")
	public String noticeView(@RequestParam("noticeno") String noticeno, Model d){
		d.addAttribute("notice", service.noticeView(noticeno));
		return "a31_notice\\noticeView.jsp";
	}
}
