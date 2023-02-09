package bikeweb.dao;

import com.bikeWeb.vo.NoticeVo;
import com.bikeWeb.vo.QnaVo;

public interface AdminDao {
	
	public void insNotice(NoticeVo ins);
	public void delNotice(String noticeno);
	public String getImgfile(String noticeno);
	public void uptQna(QnaVo upt);
	
}
