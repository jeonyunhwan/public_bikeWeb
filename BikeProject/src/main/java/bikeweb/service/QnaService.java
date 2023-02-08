package bikeweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.QnaVo;

import bikeweb.dao.QnaDao;

@Service
public class QnaService {

	@Autowired(required=false)
    private QnaDao dao;
   
    public List<QnaVo> qnaList(QnaVo sch){
       if(sch.getTitle()==null)sch.setTitle("");
       if(sch.getContent()==null)sch.setContent("");
       return dao.qnaList(sch);
    }
    public QnaVo qnaView(String qno) {
    	return dao.qnaView(qno);
    }
}
