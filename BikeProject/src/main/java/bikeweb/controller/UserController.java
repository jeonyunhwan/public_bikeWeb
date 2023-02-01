package bikeweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.MemberVo;

import bikeweb.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/signup.do") //회원가입
	public String signin(MemberVo ins) {
		service.signup(ins);

		return "a00_main\\a02_login.jsp";
	}
	
	@PostMapping("/invalidId.do") // 회원가입시 아이디 중복확인
	public String invalidId(@RequestParam("id") String id, Model d) {
		d.addAttribute("idCk",service.invalidId(id));
		return "pageJsonReport";
	}
	
	@PostMapping("/login.do") // 로그인
	public String login(MemberVo login, Model d) {
		d.addAttribute("loginCk",service.login(login));
		return "pageJsonReport";
	}
	
	@GetMapping("/getId.do") // 회원정보 수정시 로그인한 아이디로 된 정보 가져오기
	public String getId(@RequestParam("id") String id, Model d) {
		d.addAttribute("userInfo",service.getId(id));
		return "pageJsonReport";
	}
	
	@PostMapping("/uptInfo.do") // 회원정보 수정
	public String uptInfo(MemberVo upt, Model d) {
		service.uptInfo(upt);
		d.addAttribute("uptInfo",service.getId(upt.getId()));
		return "pageJsonReport";
	}
}
