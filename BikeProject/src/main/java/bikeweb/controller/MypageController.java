package bikeweb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bikeWeb.vo.CouponVo;
import com.bikeWeb.vo.PagingVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.service.MyPageService;

@Controller
public class MypageController {
	// point 정보 확인 컨트롤러
	private final MyPageService service;
	//생성자 주입하기 
	@Autowired
	public MypageController(MyPageService service) {
		this.service = service;
	}
	@GetMapping("/point.do")
	public String allPointInfo(PagingVo vo,@RequestParam("id") String id,
			@RequestParam(value="nowPage", required=false)String nowPage,@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			Model d) {
		int total = service.getPointSize(id);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		List<RentalVo> data = null;
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		data = service.pointInfo(vo,id);
		d.addAttribute("paging", vo);
		d.addAttribute("point",data);
		return "point_history";
	}
	@PostMapping("/point.do")
	public String pointInfo(PagingVo vo,
			@RequestParam("id") String id,
			@RequestParam(value = "toDate",required=false) String toDate,
			@RequestParam(value = "fromDate",required=false) String fromDate,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			Model d) {
		// total 개수
		int total = service.getPointSizeAnd(id,toDate,fromDate);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		List<RentalVo> data = null;
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		d.addAttribute("paging", vo);
		d.addAttribute("point", service.pointInfo(vo, id, toDate, fromDate));
		return "point_history";
	}
	/**
	 * @param service
	 */
	@RequestMapping("/totalPoint.do")
	public String totalPointAPI(@RequestParam("id") String id,Model d) {
		d.addAttribute("totalPoint",service.getTotalPointAPI(id));
		return "pageJsonReport";
	}
	@GetMapping("/rentalAPI.do")
	public String totalRentalInfoAPI(@RequestParam("id") String id,Model d) {
		Map<String,Object> data = null;
		//hashmap 형태 
		data = service.getRentalInfoAPI(id);
		d.addAttribute("InfoData", data);
		return "pageJsonReport";
	}
	@GetMapping("/rental.do")
	public String totalRentalInfo(PagingVo vo,@RequestParam("id") String id,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,Model d) {
		
		int total = service.getPointSize(id);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<RentalVo> data = null;
		data = service.getRentalInfo(id,vo);
		d.addAttribute("paging",vo);
		d.addAttribute("rentalInfo",data);
		return "rental_history";
	}
	@PostMapping("/rental.do")
	public String RentalInfo(PagingVo vo,Model d,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam("id") String id,
			@RequestParam(value = "toDate",required=false) String toDate,
			@RequestParam(value = "fromDate",required=false) String fromDate) {
		
		int total = service.getPointSizeAnd(id,toDate,fromDate);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		d.addAttribute("paging", vo);
		d.addAttribute("rentalInfo",service.getRentalList(vo, id, toDate, fromDate));
		return "rental_history";
	}
	@RequestMapping("/Coupon.do")
	public String CouponList(@RequestParam("id") String id,Model d) {
		List<CouponVo> data =  service.getCouponList(id);
		d.addAttribute("couponList", data);
		return "useTicket_history";
	}
}
