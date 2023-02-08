package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.QnaVo;

import bikeweb.service.QnaService;

@Controller
public class QnaController {
	@Autowired(required=false)
	private QnaService service;
	// QNA 내역 리스트 / 제목 + 내용 검색
	@RequestMapping("/qnaList.do")
	public String qnaList(@ModelAttribute("sch") QnaVo sch, Model d) {
		d.addAttribute("list", service.qnaList(sch));		
		return "a32_qnaFaq\\qnaHistory.jsp";
	}
	// 상세페이지
	@GetMapping("qnaView.do")
	public String qnaView(@RequestParam("qno") String qno, Model d){
		d.addAttribute("qna", service.qnaView(qno));
		return "a32_qnaFaq\\qnaView.jsp";
	}
}
