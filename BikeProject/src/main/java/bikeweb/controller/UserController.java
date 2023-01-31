package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bikeWeb.vo.MemberVo;

import bikeweb.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/signup.do")
	public String signin(MemberVo ins, Model d) {
		service.signup(ins);
		System.out.println(ins.getEmail());
		System.out.println(ins.getWeight());
		System.out.println(ins.getId());
		d.addAttribute("msg", "회원가입이 완료되었습니다.");
		return "a00_main\\a02_login.jsp";
	}
}
