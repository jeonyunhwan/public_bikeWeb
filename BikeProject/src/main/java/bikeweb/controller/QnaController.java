package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.QnaVo;

import bikeweb.service.QnaService;

@Controller
public class QnaController {
	@Autowired(required=false)
	private QnaService service;
	// QNA 상담 내역 리스트 / 제목 + 내용 검색
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
	// 문의 글 등록
	@GetMapping("/insertQnaFrm.do")
	public String insertQnaFrm(){
		return "a32_qnaFaq\\insQna.jsp";
	}
	@PostMapping("/insertQna.do")
	public String insertQna(QnaVo ins, Model d){
		service.insertQna(ins);
		d.addAttribute("msg","저장되었습니다.");
		return "a32_qnaFaq\\insQna.jsp";
	}
	// 글 수정
	@GetMapping("uptQnaFrm.do")
	public String uptQnaFrm(@RequestParam("qno") String qno, Model d){
		d.addAttribute("qna", service.qnaView(qno));
		return "a32_qnaFaq\\uptQna.jsp";
	}
	@PostMapping("/uptQna.do")
	public String uptQna(QnaVo upt, Model d) {
		service.updateQna(upt);
		d.addAttribute("msg","수정되었습니다.");
		return "a32_qnaFaq\\uptQna.jsp";
	}
	// 글 삭제
	@GetMapping("/delQna.do")
	public String delQna(@RequestParam("qno") String qno, Model d) {
		service.deleteQna(qno);
		d.addAttribute("msg", "삭제되었습니다.");
		return "a32_qnaFaq\\qnaView.jsp";
	}
}
