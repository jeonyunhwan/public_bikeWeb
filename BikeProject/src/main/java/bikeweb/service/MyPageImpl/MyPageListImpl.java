package bikeweb.service.MyPageImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.CouponVo;
import com.bikeWeb.vo.PagingVo;
import com.bikeWeb.vo.RentalVo;

import bikeweb.dao.MyPageDao;
import bikeweb.service.MyPageService;
@Service
public class MyPageListImpl implements MyPageService {
	private MyPageDao dao;	
	/**
	 * @param dao
	 * 생성자 주입 
	 */
	@Autowired
	public MyPageListImpl(MyPageDao dao) {
		this.dao = dao;
	}
	
	 /**
	 * @param vo
	 */


	public int getPointSize(String id) {
		 return dao.getPointSize(id);
	 }
	public int getPointSizeAnd(String id,String startDate,String endDate) {
		Map<String,Object> data = new HashMap<>();
		data.put("id",id);
		data.put("sDate",startDate);
		data.put("eDate",endDate);
		return dao.getPointSizeAnd(data);
	}
	
	public List<RentalVo> pointInfo(PagingVo vo,String id,String startDate,String endDate) {	
		Map<String,Object> data = new HashMap<>();
		data.put("vo", vo);
		data.put("id", id);
		data.put("sDate", startDate);
		data.put("eDate",endDate);
		List<RentalVo> pointList = dao.getPointList(data);
		for(int i=0; i<pointList.size(); i++) {
			if(pointList.get(i).getTime()==0) pointList.get(i).setTime(1);
			
			//마일리지 시간당 10p
			pointList.get(i).setTime(pointList.get(i).getTime()*10);
			
		}
		return pointList;
	}
	
	//로직처리 
	public List<RentalVo> pointInfo(PagingVo vo,String id){
		Map<String,Object> data = new HashMap<>();
		data.put("vo",vo);
		data.put("id",id);
		List<RentalVo> pointList = dao.getAllPointList(data);
		
		for(int i=0; i<pointList.size(); i++) {
			if(pointList.get(i).getTime()==0) pointList.get(i).setTime(1);
			
			//마일리지 시간당 10p
			pointList.get(i).setTime(pointList.get(i).getTime()*10);
			
		}
		/*
		//마일리지 (최소 1시간) 
		int point = 1;
		//반납-시간별로 10p 
		for(int i = 0;i<pointList.size();i++) {
			point = pointList.get(i).getTime()*10;
			pointList.add(new RentalVo(point));
		}
		*/
		//로직 결과 담기 
		
		return pointList;	
	}
	public int getTotalPointAPI(String id) {
		// total = totalTime * 10; 
		Integer totalTime = 0;
		totalTime = dao.getTotalPointAPI(id);
		if(totalTime==null) totalTime = 0;
		else {
			totalTime = dao.getTotalPointAPI(id)*10;
		}
		return totalTime;
	}
	// 
	public Map<String,Object> getRentalInfoAPI(String id) {
		// 반납시간 - 대여시간 
		Integer totalTime;
		totalTime = dao.getTotalPointAPI(id);
		if(totalTime == null) {
			totalTime = 0;
		}
		// 몸무게 
		int weight = dao.getRentalInfoAPI(id);
		//걍 거리는 1시간 15km로 했음 
		int distance = totalTime*15;
		//칼로리= 체중 x 6.8* 총 시간 * 1.05
		// METs 는 평균 체중 60kg > 평균 속도 16.1~19.2 
		// 시속을 받을 수 없어서 평균 mets 6.8 이라고 잡음 
		double kal = Math.round((weight * 6.8 * totalTime * 1.05)*10/10);
		// 탄소 절감 
		double coCal = Math.round((distance * 0.2)*10/10);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("totalTime",totalTime);
		map.put("distance",distance);
		map.put("kal",kal);
		map.put("coCal",coCal);
		
		return map;
		
	}
	 public List<RentalVo> getRentalInfo(String id,PagingVo vo){
		 List<RentalVo> list = new ArrayList<>();
		 Map<String,Object> data = new HashMap<>();
		 data.put("vo",vo);
		 data.put("id",id);
		 list = dao.getRentalInfo(data);
			
		 return list;
	 }
	 // 그냥 데이터 출력이기 때문에 바로 출력 
	 public List<RentalVo> getRentalList(PagingVo vo,String id,String startDate,String endDate) {	
			Map<String,Object> data = new HashMap<>();
			data.put("vo",vo);
			data.put("id", id);
			data.put("sDate",startDate);
			data.put("eDate",endDate);
		    List<RentalVo> pointList = dao.getRentalList(data);
			return pointList;
	}
	 public List<CouponVo> getCouponList(String id){
		 List<CouponVo> list = new ArrayList<>();
		 list = dao.getCouponList(id);
		 for(int i=0; i<list.size(); i++) {
				if(list.get(i).getUseOrNot()==0) list.get(i).setShowUse("사용가능");
				else list.get(i).setShowUse("사용불가능");	
		 }
		 return list;
	 }
}
