package bikeweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.RentalVo;

import bikeweb.dao.RentalDao;

@Service
public class RentalService {
	@Autowired(required = false)
	private RentalDao dao;
	
	public List<RentalVo> weekRank(){
		return dao.weekRank();
				
	};
	public List<RentalVo> monthRank(){
		return dao.monthRank();
				
	};
}
