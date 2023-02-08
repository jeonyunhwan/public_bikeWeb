package bikeweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bikeWeb.vo.CouponVo;
import com.bikeWeb.vo.PagingVo;
import com.bikeWeb.vo.RentalVo;

@Service
public interface MyPageService {
	public int getPointSize(String id);
	public int getPointSizeAnd(String id,String startDate,String endDate);
	public int getTotalPointAPI(String id);
	public Map<String, Object> getRentalInfoAPI(String id);
	public List<RentalVo> pointInfo(PagingVo vo,String id,String startDate,String endDate);
	public List<RentalVo> pointInfo(PagingVo vo,String id);
	public List<RentalVo> getRentalInfo(String id,PagingVo vo);
	public List<RentalVo> getRentalList(PagingVo vo,String id,String startDate,String endDate);
	public List<CouponVo> getCouponList(String id);
}
