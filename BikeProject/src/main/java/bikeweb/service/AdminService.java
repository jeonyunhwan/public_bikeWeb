package bikeweb.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bikeWeb.vo.NoticeVo;

import bikeweb.dao.AdminDao;

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
		ins.setFile(upload+fname); 
		dao.insNotice(ins);
	};
}
