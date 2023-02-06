package bikeweb.dao;

import java.util.List;

import com.bikeWeb.vo.RentalVo;

public interface RentalDao {

	public List<RentalVo> weekRank();
	public List<RentalVo> monthRank();
}
