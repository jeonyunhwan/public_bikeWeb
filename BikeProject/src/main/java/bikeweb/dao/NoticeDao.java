package bikeweb.dao;

import java.util.List;

import com.bikeWeb.vo.GuideLineVo;
import com.bikeWeb.vo.NoticeVo;

public interface NoticeDao {
	public List<NoticeVo> noticeList(NoticeVo sch);
	public NoticeVo noticeView(String noticeno);
	
	public List<GuideLineVo> guideLineList();

}
