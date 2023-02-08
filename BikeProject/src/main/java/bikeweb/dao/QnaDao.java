package bikeweb.dao;

import java.util.List;

import com.bikeWeb.vo.QnaVo;

public interface QnaDao {
	public List<QnaVo> qnaList(QnaVo sch);
	public QnaVo qnaView(String qno);
	public void insertQna(QnaVo ins);
}
