package bikeweb.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bikeWeb.vo.NoticeVo;
import com.bikeWeb.vo.QnaVo;

import bikeweb.dao.AdminDao;
import bikeweb.dao.QnaDao;

@Service
public class AdminService {
	@Value("${file.upload}")
	private String upload;
	
	// 파일 업로드 하는 메서드
	public String uploadFile(MultipartFile report) {
		String fname = report.getOriginalFilename();
		if(fname!=null && !fname.equals("")) {
			File fobj = new File(upload+fname);
			try {
				report.transferTo(fobj);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}	
		return fname;
	}
	
	@Autowired(required = false)
	private AdminDao dao;
	
	public void insNotice(NoticeVo ins) {
		String fname = uploadFile(ins.getReport());
		if(fname!=null && !fname.equals("")) {
			ins.setImgfile(fname); 
			dao.insNotice(ins);
		}else {
			ins.setImgfile("");
			dao.insNotice(ins);
		}
	};
	public void delNotice(String noticeno) {
		String fname = dao.getImgfile(noticeno);
		File file = new File(upload+fname); // 저장된 파일 가져와서 파일객체로 만들기
		if(file.exists()) {
			file.delete();
		}
		dao.delNotice(noticeno);
	};
	

}
