package bikeweb.dao;

import java.util.List;
import java.util.Map;

import com.bikeWeb.vo.CouponVo;
import com.bikeWeb.vo.RentalVo;

public interface MyPageDao {
	//point 처리 dao 
    public int getPointSize(String id);
    public int getPointSizeAnd(Map<String, Object> data);
    public Integer getTotalPointAPI(String id);
    public int getRentalInfoAPI(String id);
    public List<RentalVo> getRentalInfo(Map<String, Object> data);
	public List<RentalVo> getPointList(Map<String, Object> data);
	public List<RentalVo> getAllPointList(Map<String, Object> data);
	public List<RentalVo> getRentalList(Map<String,Object> data);
	public List<CouponVo> getCouponList(String id);
}
