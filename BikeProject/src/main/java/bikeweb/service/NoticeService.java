package bikeweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bikeWeb.vo.GuideLineVo;
import com.bikeWeb.vo.NoticeVo;

import bikeweb.dao.NoticeDao;

@Service
public class NoticeService {

	@Autowired(required=false)
    private NoticeDao dao;
   
    public List<NoticeVo> noticeList(NoticeVo sch){
       if(sch.getTitle()==null)sch.setTitle("");
       if(sch.getContent()==null)sch.setContent("");
       return dao.noticeList(sch);
    }
    public NoticeVo noticeView(String noticeno) {
    	return dao.noticeView(noticeno);
    }
    public List<GuideLineVo> guideLineList(){
        return dao.guideLineList();
     }
}
