package com.bikeWeb.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVo {
	private String noticeno;
	private String mgrid;
	private Date writedate;
	private String title;
	private String content;
	private String imgfile;
	private MultipartFile report;
	/**
	 * 
	 */
	public NoticeVo() {
		super();
	}
	
	public MultipartFile getReport() {
		return report;
	}

	public void setReport(MultipartFile report) {
		this.report = report;
	}

	public String getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}
	public String getMgrid() {
		return mgrid;
	}
	public void setMgrid(String mgrid) {
		this.mgrid = mgrid;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	
}

