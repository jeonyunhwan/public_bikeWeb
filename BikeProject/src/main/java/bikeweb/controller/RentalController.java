package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bikeweb.service.RentalService;

@Controller
public class RentalController {
	@Autowired(required = false)
	private RentalService service;
	
	@RequestMapping("/rank.do")
	public String rankPage(Model d) {
		d.addAttribute("weekRank",service.weekRank());
		return "a00_main\\a06_rank.jsp";
	}
	@RequestMapping("/rankM.do")
	public String rankPage2(Model d) {
		d.addAttribute("monthRank",service.monthRank());
		return "a00_main\\a11_rank2.jsp";
	}
}
