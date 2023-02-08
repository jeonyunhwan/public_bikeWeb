package com.bikeWeb.vo;

import java.util.Date;

public class CouponVo {
	private String couponCode;
	private Date insertDate;
	private int useOrNot;
	private String fromUser;
	private String toUser;
	private Date fromDate;
	private Date toDate;
	private String showUse;
	/**
	 * 
	 */
	//기본생성자 설정 
	public CouponVo() {
		super();
	}
	public String getCouponCode() {
		return couponCode;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public int getUseOrNot() {
		return useOrNot;
	}
	public String getFromUser() {
		return fromUser;
	}
	public String getToUser() {
		return toUser;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public String getShowUse() {
		return showUse;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public void setUseOrNot(int useOrNot) {
		this.useOrNot = useOrNot;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public void setShowUse(String showUse) {
		this.showUse = showUse;
	}
	
	
	
}
