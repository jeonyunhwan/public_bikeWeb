package bikeweb.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
    @Value("${file.upload}")
	private String upload;

	private void uploadFile(MultipartFile f){
		String imgfile = f.getOriginalFilename();
		File fObj = new File(upload+imgfile);
		try{
			f.transferTo(fObj);
		}catch(Exception e){
				System.out.println("업로드예외:"+e.getMessage());
		}			
	}
	public void insertQna(QnaVo ins) {
		String imgfile = ins.getReport().getOriginalFilename();
		if( !imgfile.equals("") ){
			uploadFile(ins.getReport());
			ins.setImgfile(imgfile);
			dao.insertQna(ins);
		}
		
	}
	public void updateQna(QnaVo upt) {
		dao.updateQna(upt);
	}
	public void deleteQna(String qno){
		dao.deleteQna(qno);
	}
}
