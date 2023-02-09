package bikeweb.dao;

import com.bikeWeb.vo.NoticeVo;

public interface AdminDao {
	
	public void insNotice(NoticeVo ins);
	public void delNotice(String noticeno);
	public String getImgfile(String noticeno);
	public int countQ();
}
